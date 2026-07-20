/** State in which we are aware of an enemy's presence but have not decided to enter combat yet */
UCLASS(Abstract)
class UAIState_Warning : UAIState_Conflict
{
    default OwnedGameplayTags.AddTag(GameplayTag::AIState_Conflict_Warning);
    default AIStateTag = GameplayTag::AIState_Conflict_Warning;
    default FocusPriority = EGothicFocusPriority::Warning;

    /** Escalate threat (go to combat) if threatening character gets closer by this distance */
    UPROPERTY()
    float ThreatApproachedTooMuchDistance = 350.0f; // TODO this should probably scale with how far we were at the start

    /** Move away by this distance if threatening character is closer than this distance at the start of the state */
    UPROPERTY()
    float MinimumDistance = 200.0f;

    /** If target is closer than this distance after the minimum amount of warnings have been made, npc will transition to combat */
    UPROPERTY()
    float TooCloseDistance = 100.0f;

    /** Distance from self to threatening character at the start of the state (after repositioning) */
    UPROPERTY()
    float StartingDistance = -1.0f;

    UPROPERTY()
    float SafeDistance = 1500.0f;

    /** How often we should warn the other character before we start a fight. */
    UPROPERTY()
    int NumWarningsBeforeCombat = 2;

    /** How many warnings should be done at a minimum unless attacked. */
    // UPROPERTY()
    // int MinimumNumWarningsBeforeCombat = 0;

    /** Whether the character should use their weapon during warning */
    UPROPERTY()
    bool bUseWeapon = true;

    /** Speed at which we should follow the enemy if we do */
    UPROPERTY()
    EWalkSpeed WalkSpeed = EWalkSpeed::Walking;

    /** Whether we should attack after all warnings are done or keep warning */
    UPROPERTY()
    bool bHasWarningLimit = true;

    /** Exit state if no hostiles detected */
    UPROPERTY()
    bool bRequireHostiles = true;

    /** Exit state if initial target not perceived */
    UPROPERTY()
    bool bRequireAwarenessOfInitialTarget = false;

    /** Initial target of the warning state */
    UPROPERTY()
    AGothicCharacter InitialTarget;

    /** Exit state if initial target is farther than this distance + warning distance */
    UPROPERTY()    
    float ThreatGoneDistanceThreshold = 200.0f;

    UPROPERTY()
    float MinTimeSecondsBetweenWarnings = 1.0f; //6.5f;

    UPROPERTY()
    float MaxTimeSecondsBetweenWarnings = 2.0f; //8.5f;

    UPROPERTY()
    float WaitingTimeAfterTargetTooFar = 1.0f;

    UPROPERTY()
    float WaitingTimeOnAllWarningsDoneSafeDistance = 3.0f;

    UPROPERTY()
    float MaximumDistanceSeen = 0.0f;

    UPROPERTY()
    int BaseNumWarningsDone = 0;

    UPROPERTY()
    bool bEndWarningImmediatelyOnLastWarningDone = false;

    UPROPERTY()
    private bool _bWarningFinished = false;

    UPROPERTY()
    FInGameTime DefaultLastWarningTime;

    UPROPERTY()
    FInGameTime TimeAllWarningsDone;

    UPROPERTY()
    FInGameTime TimeForNextWarning;

    bool bUseWarningCooldowns = true;

    default IsTickingTask = true;

    UFUNCTION()
    float GetThreatGoneDistance() const property
    {
        return AI.WarnignHostileDistance + ThreatGoneDistanceThreshold;
    }

    UFUNCTION(BlueprintOverride)
    void SetupPerceptions(UCharacterPerceptionComponent Perception)
    {
        Super::SetupPerceptions(Perception);
        
        BindAssessmentToPerception(Perception.SeenLivingHostileCharacterWithinRange(TooCloseDistance),
            WhenGained = GameplayTag::AIEvent_Threat_IsTooClose);
            

            
        //Perception.SeenLivingHostileCharacterTicking().PerceptionGained.BindUFunction(this, n"PerceptionEvent_OnThreatNearby");
    }

    void SelectAndDrawWeapon()
    {
        if (!CanEquipWeapons())
            return;

        AI.ItemActionScoringEntryManager.UpdateAvailableItems();
        AI.SelectBestItemActionFromInventory();
        if (SelectedItem == nullptr)
            return;

        AI.DrawItem(SelectedItem);
    }


    int GetNumWarningsDone() property
    {
        return BaseNumWarningsDone;
    }

    /** Override to make this character warn the other */
    void WarnOther() 
    {
        BaseNumWarningsDone++;
    }

    bool IsOtherStillAggressive() const
    {
        return CharacterOfInterest.HasDrawnWeapon();
    }

    bool IsThreatTooClose() const
    {
        if (Self.GetFeetLocation().Distance(CharacterOfInterest.GetFeetLocation()) > TooCloseDistance + Self.SimpleCollisionRadius + CharacterOfInterest.SimpleCollisionRadius)
            return false;

        return true;
    }
    
    bool IsThreatTooFarAway(AGothicCharacter ThreatCharacter) const 
    {
        if (ThreatGoneDistance < 0.0f )
        {
            // No valid Distance set
            return false;
        }

        return Self.GetDistanceTo(ThreatCharacter) >= ThreatGoneDistance;
    }

    bool HasThreatApproachedTooMuch() const
    {
        if (CharacterOfInterest == nullptr)
            return false;

        float DistanceToOtherCharacter = Self.GetFeetLocation().Distance(CharacterOfInterest.GetFeetLocation()); 

        if (DistanceToOtherCharacter > SafeDistance)
            return false;

        float ApproachDelta = MaximumDistanceSeen - DistanceToOtherCharacter; // Distance of how much the Character approached since first seen 

        if (ApproachDelta < ThreatApproachedTooMuchDistance) // Approached less than our threshold, not too close
            return false;

        return true;
    }

    void SelectWarningCharacterOfInterest()
    {
        if (bRequireAwarenessOfInitialTarget && InitialTarget != nullptr && !IsThreatTooFarAway(InitialTarget))
        {
            // Initial target is still valid and in threat distance
            // No need to change it
            CharacterOfInterest = InitialTarget;
            AI.TargetCharacterOfInterest(FocusPriority, this);
            return;
        }
      
        // Trying to find new Target Character : 
        
        float ClosestDistance = MAX_flt;
        AGothicCharacter ClosestValidCharacter = nullptr;

        for (auto Character : AI.GetSensedLivingEnemies())
        {
            // Select first enemy found if there is one

            CharacterOfInterest = Character;
            AI.TargetCharacterOfInterest(FocusPriority, this);

            return;
        }

        // No Enemy found, checking Hostiles :

        for (auto Character : AI.GetSensedLivingHostiles())
        {
            float Distance = Character.GetDistanceTo(Self);
            
            if (Distance >= ClosestDistance)
                continue;

            if (IsThreatTooFarAway(Character))
                continue;

            ClosestValidCharacter = Character;
            ClosestDistance = Distance;
        }

        CharacterOfInterest = ClosestValidCharacter;

        if (CharacterOfInterest == nullptr)
            return;

        AI.TargetCharacterOfInterest(FocusPriority, this);
    }

    UFUNCTION(BlueprintOverride)
    void DoTask() final
    {
        Super::DoTask(); 

        BeginWarning();

        while(!bShouldExitState)
        {
            // EvaluateDisengage();
            SelectWarningCharacterOfInterest();
         
            if (CharacterOfInterest == nullptr )
            {
                AssessEndWarning();
                WaitOneTick();
                continue;
            }

            // Updating MaximumDistanceSeen value before the checks
            auto DistanceToCharacterOfInterest = CharacterState.Character.ActorLocation.Distance(CharacterOfInterest.ActorLocation);
            if (DistanceToCharacterOfInterest > MaximumDistanceSeen)
            {
                MaximumDistanceSeen = DistanceToCharacterOfInterest;
            }

            if (Self.IsDrawingOrUndrawingWeapon())
            {
                // We are in the middle of drawing/undrawing our weapon, wait until we're done
                WaitOneTick();
                continue;
            }

            if (IsThreatTooClose() || HasThreatApproachedTooMuch())
            {
                FRememberedPerception Perception;
                Perception.Origin.CharacterState = CharacterOfInterest.CharacterState;
                AI.AssessEvent(GameplayTag::AIEvent_Threat_IsTooClose, Perception);
                
                WaitOneTick();
                continue;
            }

            if (IsOtherWarningAlready())
            {
                WaitOneTick();
                continue;
            }

            if (!TimeForNextWarning.IsTimeInThePast() && bUseWarningCooldowns)
            {
                // Warning still on cooldown
                WaitOneTick();
                continue;
            }

            if (IsThreatTooFarAway(CharacterOfInterest.CharacterState.Character))
            {
                AssessEndWarning();
                WaitSeconds(WaitingTimeAfterTargetTooFar);
                return;
            }

            if (!CharacterState.Character.IsDrawingOrUndrawingWeapon() &&
                (NumWarningsBeforeCombat > NumWarningsDone || !bHasWarningLimit))
            {
                // Do a warning since we didn't reach our limit yet
                DefaultLastWarningTime = FInGameTime::Now();
                WarnOther();

                if (NumWarningsBeforeCombat != NumWarningsDone || !bEndWarningImmediatelyOnLastWarningDone) 
                {
                    // This was the last warning and we do NOT want it to end immediately
                    TimeForNextWarning = FInGameTime::XRealtimeSecondsFromNow(Math::RandRange(MinTimeSecondsBetweenWarnings, MaxTimeSecondsBetweenWarnings));
                }

                WaitOneTick();
                continue;
            }

            if (!IsValid(CharacterOfInterest))
            {
                WaitOneTick();
                continue;
            }

            if (!TimeAllWarningsDone.IsValid())
            {
                TimeAllWarningsDone = bEndWarningImmediatelyOnLastWarningDone ? 
                    FInGameTime::XRealtimeSecondsFromNow(WaitingTimeOnAllWarningsDoneSafeDistance) :
                    FInGameTime::Now();
            }

            if (DistanceToCharacterOfInterest > SafeDistance && TimeAllWarningsDone.IsTimeInTheFuture())
            {
                WaitOneTick();
                continue;
            }

            AssessWarningsDone();

            WaitSeconds(2.0f);
        }
    }

    /** Override to specify the very first action to do to warn the other (e.g. drawing our own weapon) */
    void BeginWarning()
    {
        TimeForNextWarning = FInGameTime::Now();

        // Draw Weapon if needed
        if (bUseWeapon)
        {
            while (!Self.HasDrawnWeapon() && CanEquipWeapons())
            {
                if (!Self.IsDrawingOrUndrawingWeapon())
                {
                    SelectAndDrawWeapon();
                }
                
                WaitOneTick();
            }
        }
        else
        {
            while (Self.HasDrawnWeapon() && CanEquipWeapons())
            {
                if (!Self.IsDrawingOrUndrawingWeapon())
                {
                    AI.UndrawWeapon();
                }
                
                WaitOneTick();
            }
        }

        // Move away if target is too close
        if (Self.GetFeetLocation().Distance(CharacterOfInterest.GetFeetLocation()) < MinimumDistance)
        {
            if (IsThreatTooClose())
            {
                // Character is so close, that we don't want to move away but start combat in the next step

                if (AI.TargetEnemy == CharacterOfInterest)
                {
                    // Only dodge away if Character of interets is targeted
                    AI.DodgeAwayFromTarget();
                }

                return;
            }

            if (AI.Self.CanStrafe())
            {
                SetWalkSpeed(EWalkSpeed::Walking);
                AI.GoIntoDirection(Self.GetFeetLocation() - CharacterOfInterest.GetFeetLocation(), 150.0f, MinimumMoveDistance = MinimumDistance - 20.0f);
            }
            else
            {
                AI.DodgeAwayFromTarget();
            }
        }

        StartingDistance = Self.GetFeetLocation().Distance(CharacterOfInterest.GetFeetLocation());
        AI.SetTargetEnemy(CharacterOfInterest, FocusPriority, this);
    }

    bool IsOtherWarningAlready()
    {
        if (Self.Perception.Memory
            .Filter()
            .FilterByType(GameplayTag::Sound_Bark_Warn)
            .FilterRecent(5.0f)
            .FilterTargetCharacterIs(CharacterOfInterest)
            .FilterOriginCharacterIsNot(Self)
            .HasAny())
        {
            return true;
        }

        return false;
    }

    void AssessEndWarning()
    {
        if (bRequireAwarenessOfInitialTarget && InitialTarget == nullptr)
        {
            AI.AssessEvent(GameplayTag::AIEvent_Sensed_NoEnemiesNoHostiles, RememberedPerception);
        }
        
        if (bRequireAwarenessOfInitialTarget && InitialTarget != nullptr && !AI.Self.Perception.CanSense(InitialTarget))
        {
            AI.AssessEvent(GameplayTag::AIEvent_Sensed_NoEnemiesNoHostiles, RememberedPerception);
        }

        if (bRequireAwarenessOfInitialTarget && InitialTarget != nullptr && IsThreatTooFarAway(InitialTarget))
        {
            AI.AssessEvent(GameplayTag::AIEvent_Sensed_NoEnemiesNoHostiles, RememberedPerception);
        }

        if (bRequireHostiles && ThreatGoneDistance > 0.0f)
        {
            AI.AssessHostilesAndEnemiesAround(RememberedPerception, ThreatGoneDistance);
        }

        if (bRequireHostiles)
        {
            AI.CheckAnyHostilesOrEnemiesSensed(RememberedPerception, true);            
        }
    }

    void AssessWarningsDone()
    {
        FRememberedPerception Perception;

        Perception.EventTag = GameplayTag::AIEvent_Threat_AllWarningsDone;
        Perception.Origin.Character = RememberedPerception.Origin.Character;
        Perception.Instigator.Character = RememberedPerception.Origin.Character;
        Perception.Target.Character = RememberedPerception.Origin.Character;
        Perception.Affected.Character = RememberedPerception.Origin.Character;

        AI.AssessEvent(GameplayTag::AIEvent_Threat_AllWarningsDone, RememberedPerception);
        _bWarningFinished = true;
    }

    FString GetDisplayName() const override
    {
        return "Warning";
    }

    FGothicPathfollowSettings SetupPathfollowingSettings(FString AddToDebugOwnerName)
    {
        FGothicPathfollowSettings NewSetting = AI.AIController.GetCurrentPathfollowSetting();
        NewSetting.DebugOwnerName = AddToDebugOwnerName;

        return NewSetting;
    }

#if WITH_IMGUI
    UFUNCTION(BlueprintOverride)
    void DisplayImGui()
    {
        if(AI.TargetEnemy == nullptr)
            return;
        
        ImGui::Text("Target: "); ImGui::SameLine(); ImGui::TextColored(FColor::Yellow, AI.TargetEnemy.CharacterGlobalId.ToString());
        ImGui::Text("Warnings done: "); ImGui::SameLine(); ImGui::TextColored(FColor::Yellow, f"{NumWarningsDone}");
        ImGui::Text("Time until next warning: "); ImGui::SameLine(); ImGui::TextColored(FColor::Yellow, f"{TimeForNextWarning.AgeInRealtimeSeconds - FInGameTime::Now().AgeInIngameSeconds}");
    }
#endif
}