UCLASS()
class UAIState_Disengage : UAIState_Conflict
{  
    default OwnedGameplayTags.AddTag(GameplayTag::AIState_Conflict_Disengage);
    default AIStateTag = GameplayTag::AIState_Conflict_Disengage;
    default bSupportsSimulatedSteps = true;
    default AssessmentModuleClass = UAIARM_State_Disengage;

    default DefaultConflictType = EConflictType::None;
    default bTargetCharacterOfInterest = false;

    /** Agent from the perception that caused this state */
    FPerceivedAgent AttackerAgent;

    FInteractionSpotHandle CurrentTargetSpot;

    /** Resume going to this spot in case we were interrupted by simulation */ 
    FInteractionSpotHandle StoredTargetSpot;

    const UTerritoryConfig CurrentTerritory;

    /** Distance to Spot to concider it reached 
    Putting this high since we just need to get nearby and don't want to actually be on the spot */
    float SpotReachDistance = 300.0f;

    /** Distance to the attacker at which the character feels safe if no ranged weapons */
    float MeleeSafeDistance = 1500.0f;

    /** Distance to the attacker at which the character feels safe, even if there is still line of sight */
    float SightSafeDistance = 6000.0f;

    /** Radius to search for spots around this character */
    float RadiusSearchRange = 1500.0f;

    /** Max amount of spots checked to find next disengage spot  */
    int CheckSpotAmount = 30;

    /** Preferred location needs to be at least this far away to concider picking it as first disengage spot */ 
    UPROPERTY()
    float MinDistanceToPreferredLocation = 1500.0f;

    /** Selected spot needs to be at least this far away to concider picking it as first disengage spot */ 
    UPROPERTY()
    float MinDistanceToSpot = 1500.0f;


    /** If the last time we got his is less than this threshold we want to remain in this state */
    float SecondsSinceLastHitThreshold = 5.0f; 

    float MaxDisengageDurationSeconds = 30.0f;
    float MinDisengageDurationSeconds = 4.0f;

    /** When entering simulation, wait for this long until going back to preferred location */
    float SecondsWaitUntilGoBackFromSimulation = 600.0f;

    UPROPERTY()
    EWalkSpeed RunSpeed = EWalkSpeed::Sprinting;

    UPROPERTY()
    bool bUndrawWeapon = true;
    
    UPROPERTY()
    private bool bExitAssessmentDone = false;

    UPROPERTY()
    private bool bFailAssessmentDone = false;

    private bool bExitInitialWalkToPreferredLocation = false;


    /** When Selecting Spots within the Territory they should have one or more of these tags to be valid  */
    FGameplayTagContainer AllowedSpotActionTags;

    default AllowedSpotActionTags.AddTag(GameplayTag::Action_Ambient);

    UFUNCTION(BlueprintOverride)
    void SetupPerceptions(UCharacterPerceptionComponent Perception)
    {
        Super::SetupPerceptions(Perception);
        
        Perception
        .AddPerceptionHandler()
        .WithAwareness(1.0f)
        .WithinRange(500.0f)
        .HandleOriginActor(RememberedPerception.Instigator.CharacterState.Character)
        .WithRelationship(ERelationship::Enemy)
        .NotOnCharactersWith(GameplayTag::State_Dead)
        .NotOnCharactersWith(GameplayTag::State_Defeated)
        .TickRate(0.5f)
        .PerceptionGained.BindUFunction(this, n"OnSeenInstigatorNearby");
    }

    UFUNCTION()
    void OnSeenInstigatorNearby(const FRememberedPerception&in Perception, const FPerceptionShortTermMemory&in Memory)
    {
        if (TimeTaskActivated.AgeInRealtimeSeconds < 7.0f)
            return;

        if (!IsTargetReachable())
            return;

        AssessDisengageFailEvent();
    }

    UFUNCTION(BlueprintOverride)
    void HandleAvatarChanged()
    {
        if (IsInDailyRoutineSimulation())
        {
            StoredTargetSpot = CurrentTargetSpot;
            // Restart State when entering Simulation
            RestartState();
        }
    }

    UFUNCTION(BlueprintOverride)
    void DoTask() final
    {
        Super::DoTask(); 

        if (bUndrawWeapon)
        {
            AI.UndrawWeapon();
        }

        SetWalkSpeed(RunSpeed);

        if (IsInDailyRoutineSimulation())
        {
            while (!bShouldExitState && RuntimeInGame < FInGameTime::FromSeconds(SecondsWaitUntilGoBackFromSimulation))
            {
                WaitSeconds(1.0f);
            }

            // When Starting this task while in simulation we want to walk back to preferred location instead
            AI.GotoPreferredLocation();
            
            return;
        }

        if (IsValid(RememberedPerception.Instigator.Character))
        {
            AttackerAgent = RememberedPerception.Instigator;
        }
        else if (IsValid(RememberedPerception.Origin.Character))
        {
            AttackerAgent = RememberedPerception.Origin;
        }

        // Try going back to preferred location first
        auto PreferredLocation = AI.PreferredLocation.CenterPoint;

        float DistanceToPreferredLocation = PreferredLocation.Distance(AI.Character.ActorLocation); 
        const float SmallerSpotReachDistance = SpotReachDistance / 2.0f;
        
        if (DistanceToPreferredLocation > MinDistanceToPreferredLocation)
        {
            if (AI.CanGotoPosition(PreferredLocation, ReachDistance = SpotReachDistance))
            {
                // NOTE : using smaller reach distance here to not encounter problems when barely in radius
                AI.GotoPosition(PreferredLocation, ReachDistance = SmallerSpotReachDistance);
                while(!bExitInitialWalkToPreferredLocation)
                {
                    if(AI.Character.ActorLocation.Distance(PreferredLocation) < SpotReachDistance)
                    {
                        if (ShouldEndDisengage())
                        {                    
                            bExitAssessmentDone = true;
                        }

                        bExitInitialWalkToPreferredLocation = true;
                    }

                    WaitOneTick();
                }
            }
        }

        CurrentTerritory = AI.GetCurrentTerritory();

        // Random wait to avoid unnautral synchronized action for multiple NPCs
        float randomTimeDelay = Math::RandRange(0.5f,3.5f);

        WaitSeconds(randomTimeDelay);

        while (!bExitAssessmentDone)
        {
            if (bFailAssessmentDone)
            {
                WaitSeconds(5.0f);
                break;
            }

            if (StoredTargetSpot.IsValid())
            {
                // Just came back from simulation, continue with the spot we left off
                CurrentTargetSpot = StoredTargetSpot;
                StoredTargetSpot.Invalidate();
                continue;
            }


            CurrentTargetSpot = UTerritorySubsystem::Get().GetDisengageSpotInTerritory(CurrentTerritory, CharacterState, AttackerAgent.CharacterState, AllowedSpotActionTags, CheckSpotAmount);
            
            if (CurrentTargetSpot.IsValid())
            {
                if (CurrentTargetSpot.Location.Distance(AI.Character.ActorLocation) < MinDistanceToSpot)
                {
                    // Selected spot was too close
                    AssessDisengageFailEvent();
                    return;
                }

                AI.GotoFreepoint(CurrentTargetSpot, ReachDistance = SpotReachDistance);
                WaitSeconds(1.0f);
            }
            else 
            {       
                DistanceToPreferredLocation = PreferredLocation.Distance(AI.Character.ActorLocation); 
                if (DistanceToPreferredLocation < SpotReachDistance)
                {
                    // We already are at our Preferred location
                    AssessDisengageFailEvent();
                    return;
                }
                else
                {
                    AI.GotoPosition(PreferredLocation, ReachDistance = SpotReachDistance);
                }
            }

            if (ShouldEndDisengage())
                break;
            
            WaitOneTick();
        }

        WaitSeconds(2.0f);
        AI.GotoPreferredLocation();
        AI.AssessEvent(GameplayTag::AIEvent_State_Done, RememberedPerception);
        bExitAssessmentDone = true;
        while (!bShouldExitState)
        {
            WaitSeconds(2.0);
            AI.AssessEvent(GameplayTag::AIEvent_State_Done, FRememberedPerception());
        }
    }

    void AssessDisengageFailEvent()
    {
        FRememberedPerception Perception;
        Perception.Origin.CharacterState = RememberedPerception.Instigator.CharacterState;
        AI.AssessEvent(GameplayTag::AIEvent_Disengage_Fail, Perception);
        bFailAssessmentDone = true;
    }

    bool ShouldEndDisengage()
    {
        float TimeSecondsSinceLastHitOnMe = GetSecondsSinceLastHitOnMe();

        if (TimeSecondsSinceLastHitOnMe < SecondsSinceLastHitThreshold)
        {
            // We got hit recently, don't exit state
            return false;
        }

        if (RuntimeSeconds < MinDisengageDurationSeconds)
        {
            // We entered this state too recently, don't exit yet
            return false;
        }

        if (RuntimeSeconds > MaxDisengageDurationSeconds)
        {
            // We spend more time in this state than allowed, exit now
            return true;
        }

        // We should exit if we aren't in danger anymore
        return !IsInDanger();
    }

    bool IsInDanger()
    {  
        auto AttackerCharacter = AttackerAgent.CharacterState;
        const float AttackerDistance = AttackerCharacter.GetDistanceTo(CharacterState);

        if (AttackerDistance > SightSafeDistance)
            return false;

        if (!IsValid(AttackerCharacter))
            return false;

        if (AttackerCharacter.IsDead() || AttackerCharacter.IsDefeated())
            return false;

        if (!CharacterState.IsEnemyTowards(AttackerCharacter) && !CharacterState.IsHostileTowards(AttackerCharacter))
            return false;

        if (AttackerDistance < MeleeSafeDistance)
            return true;

        if (CanSeeAttacker(AttackerCharacter))
            return true;

        return false;
    }

    // How many seconds have passed since this character was hit? 
    float GetSecondsSinceLastHitOnMe() const property
    {
        auto MemoryArray = Self.Perception.Memory
            .Filter()
            .FilterAffectedCharacterIs(Self)
            .FilterByType(GameplayTag::Event_Damaged_Me_After)
            .ToArray();
        
        if (MemoryArray.Num() == 0)
            return MAX_flt;
        
        return World.TimeSeconds - MemoryArray.Last().TimeUpdated;
    }

    FString GetDisplayName() const override
    {
        return "Disengage Behavior State";
    }

    bool CanSeeAttacker(AGothicCharacterState AttackerCharacter)
    {
        ETraceTypeQuery TraceType = UCollisionProfile::ConvertToTraceType(ECollisionChannel::ECC_Visibility);

        TArray<AActor> ActorsIgnore;
        ActorsIgnore.Add(AttackerCharacter.Character);
        ActorsIgnore.Add(CharacterState.Character);

        FHitResult HitResult;

        auto LineOfSightTrace =  !System::LineTraceSingle(
                    CharacterState.CharacterLocation,
                    AttackerCharacter.GetActorLocation(),
                    TraceType,
                    false,
                    ActorsIgnore,
                    EDrawDebugTrace::None,
                    HitResult,
                    true);

                    return LineOfSightTrace;

    }
}

UCLASS()
class UAIState_Disengage_Creature : UAIState_Disengage
{
    default bUndrawWeapon = true;
}