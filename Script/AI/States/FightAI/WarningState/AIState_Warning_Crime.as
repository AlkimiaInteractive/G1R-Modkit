/** State in which we are aware of an enemy's presence but have not decided to enter combat yet */
UCLASS(Abstract)
class UAIState_Warning_Crime : UAIState_Conflict
{
    default OwnedGameplayTags.AddTag(GameplayTag::AIState_Conflict_Warning);
    default AIStateTag = GameplayTag::AIState_Conflict_Warning;
    default SwitchAIStateMode = ESwitchAIStateMode::EndState_Cancel;
    default EndInteractionMode = ESwitchAIStateEndInteractionMode::EndAnyOngoingInteraction_Instant;
    default FocusPriority = EGothicFocusPriority::Warning;
    default StateGroupClass = UAIGroup_Warning_Threat;

    default AssessmentModuleClass = UAIARM_State_Warning_Human;

    /** Escalate threat (go to combat) if threatening character gets closer by this distance */
    UPROPERTY()
    float ThreatApproachedTooMuchDistance = 700.0f;

    /** Move away by this distance if threatening character is closer than this distance at the start of the state */
    UPROPERTY()
    float InitialMinimumDistance = 200.0f;

    /** Move away by this distance if threatening character is closer than this distance throughout the state */
    UPROPERTY()
    float ContinuousMinimumDistance = 0.0f;

    /** If target is closer than this distance after the minimum amount of warnings have been made, npc will transition to combat */
    UPROPERTY()
    float TooCloseDistance = 100.0f;

    /** Get to this distance when farther */
    UPROPERTY()
    float MaxDistance = MAX_flt;

    /** How often we should warn the other character before we start a fight. */
    UPROPERTY()
    int NumWarningsBeforeCombat = 2;

    /** How many warnings should be done at a minimum unless attacked. */
    UPROPERTY()
    int MinimumNumWarningsBeforeCombat = 1;

    /** Whether the character should use their weapon during warning */
    UPROPERTY()
    bool bUseWeapon = true;

    UFUNCTION()
    bool ShouldUseWeapon()
    {
        return bUseWeapon;
    }

    /** Speed at which we should follow the enemy if we do */
    UPROPERTY()
    EWalkSpeed WalkSpeed = EWalkSpeed::Walking;

    /** Whether we should change speed when enemy is not facing us, false will use WalkSpeed value - true will use EWalkSpeed::Running */
    UPROPERTY()
    bool bRunWhenEnemyNotFacingMe = false;

    // FIXME: Add a way to go straight to attack-state from here
    /** Read from outside. Set to true to signal that this character had enough of the aggression and should attack now! */
    UPROPERTY()
    bool bShouldAttackNow = false;

    /** Whether we should flee if the enemy is more powerful than us */
    UPROPERTY()
    bool bShouldFleeWhenEnemyIsMorePowerful = false;

    /** Whether we should attack after all warnings are done or keep warning */
    UPROPERTY()
    bool bHasWarningLimit = true;

    /** Read from outside. Set to true to signal that this character should flee now */
    UPROPERTY()
    bool bShouldFleeNow = false;

    /** Exit state if no hostiles detected */
    UPROPERTY()
    bool bRequireHostiles = true;

    /** Exit state if initial target not perceived */
    UPROPERTY()
    bool bRequireAwarenessOfInitialTarget = false;

    /** Initial target of the warning state */
    UPROPERTY()
    AGothicCharacter InitialTarget;

    /** Exit state if initial target is farther than this distance */
    UPROPERTY()    
    float ThreatGoneDistance = -1.0f;

    UPROPERTY()
    bool bStartLocationSet = false;

    UPROPERTY()
    float WarningTime = 0.0f;
    

    UPROPERTY()
    int BaseNumWarningsDone = 0;

    UPROPERTY()
    bool bEndWarningImmediatelyOnLastWarningDone = false;

    UPROPERTY()
    private bool _bWarningFinished = false;

    UPROPERTY()
    protected bool _bBeginWarningFinished = false;

    UPROPERTY()
    FInGameTime _TimeForWarning;

    UPROPERTY()
    const float TimeBetweenWarnings = 6.0f;

    UPROPERTY()
    TMap<AGothicCharacter, float> MaximumDistancesSeen;

    default IsTickingTask = true;

    UPROPERTY()
    bool bRequireLineOfSight = true;

    UPROPERTY()
    bool bChaseOnNoLineOfSight = false;

    UPROPERTY()
    float MaximumTimeSecondsWithoutVisibleHostile = 0.0f;

    UPROPERTY()
    bool bCharacterOfInterestVisible = false;

    UPROPERTY()
    FInGameTime TimeLastCharacterOfInterestWasVisible;

    UPROPERTY()
    bool bWarnDirectlyFromAIState = false;

    UPROPERTY()
    protected bool bEndAssessmentDone = false;

    FInGameTime GetTimeForWarning() const property
    {
        auto WarningGroup = Cast<UAIGroup_Warning_Base>(StateGroup);
        if (!IsValid(WarningGroup))
            return _TimeForWarning;

        return WarningGroup.TimeForWarning;
    }

    void SetTimeForWarning()
    {
        _TimeForWarning = FInGameTime::XRealtimeSecondsFromNow(TimeBetweenWarnings);
        BaseNumWarningsDone++;

        auto WarningGroup = Cast<UAIGroup_Warning_Base>(StateGroup);
        if (!IsValid(WarningGroup))
            return;

        WarningGroup.TimeForWarning = FInGameTime::XRealtimeSecondsFromNow(TimeBetweenWarnings);
        WarningGroup.NumWarningsDone++;
    }

    UFUNCTION()
    void AddToWarnedCharacters(const AGothicCharacter OtherCharacter)
    {
        if (!IsValid(OtherCharacter))
            return;

        auto WarningGroup = Cast<UAIGroup_Warning_Base>(StateGroup);
        if (!IsValid(WarningGroup))
            return;

        WarningGroup.CharactersBeingWarned.Add(OtherCharacter);
        MaximumDistancesSeen.Add(OtherCharacter, Self.GetDistanceTo(OtherCharacter));
    }

    UFUNCTION()
    void RemoveFromWarnedCharacters(const AGothicCharacter OtherCharacter)
    {
        if (!IsValid(OtherCharacter))
            return;

        auto WarningGroup = Cast<UAIGroup_Warning_Base>(StateGroup);
        if (!IsValid(WarningGroup))
            return;

        WarningGroup.CharactersBeingWarned.Remove(OtherCharacter);
        auto WarnedCharacterSubsystem = UWarnedCharacterSubsystem::Get();
        WarnedCharacterSubsystem.RegisterStopWarningCharacter(CharacterState, OtherCharacter.CharacterState);

        if (MaximumDistancesSeen.Contains(OtherCharacter))
        {
            MaximumDistancesSeen.Remove(OtherCharacter);
        }
    }

    TSet<AGothicCharacter> GetCharactersBeingWarned() const property
    {
        auto WarningGroup = Cast<UAIGroup_Warning_Base>(StateGroup);
        if (!IsValid(WarningGroup))
            return TSet<AGothicCharacter>();

        return WarningGroup.CharactersBeingWarned;
    }

    UFUNCTION()
    private void SetDistancesOfCharactersBeingWarned()
    {
        for (auto OtherCharacter : CharactersBeingWarned)
        {
            MaximumDistancesSeen.Add(OtherCharacter, Self.GetDistanceTo(OtherCharacter));
        }
    }

    bool IsEnemyFacingMe() const
    {
        return CharacterOfInterest.IsFacingOtherCharacter(Self);
    }

    /** When CoI not visible, base crime warning may path-follow. Pickpocket overrides false. */
    bool ShouldFollowCharacterOfInterestWhenNotVisible() const
    {
        return true;
    }

    /** Hook after SelectWarningCharacterOfInterest each tick (e.g. in-place turn toward thief). */
    void AfterSelectWarningCharacterOfInterest()
    {
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

    /** Override to make this character warn the other */
    void WarnOther(AGothicCharacter OtherCharacter) 
    {
        SetTimeForWarning();   
    }

    /** Override to specify the very first action to do to warn the other (e.g. drawing our own weapon) */
    void BeginWarning()
    {
        auto WarnedCharacterSubsystem = UWarnedCharacterSubsystem::Get();
        if (RememberedPerception.EventTag.MatchesTag(GameplayTag::AIEvent_ConflictAssessment))
        {
            // Joining warning, CharacterOfInterest is the ally
            if (!IsValid(CharacterOfInterest) || !WarnedCharacterSubsystem.IsCharacterWarning(CharacterOfInterest.CharacterState))
            {
                EndTaskAsFailure();
                return;
            }

            WarnedCharacterSubsystem.RegisterJoinWarning(CharacterState, CharacterOfInterest.CharacterState);
            CharacterOfInterest = nullptr;
        }
        else
        {
            WarnedCharacterSubsystem.RegisterBeginWarning(CharacterState, CharacterOfInterest.CharacterState);
        }

        if (IsValid(CharacterOfInterest) && (!IsValid(StateGroup.Leader) || !StateGroup.Leader.HasGameplayTag(GameplayTag::AIState_Conflict_Warning)))
        {
            StateGroup.Leader = CharacterState;
        }

        if (!IsValid(CharacterOfInterest) && IsValid(StateGroup) && !CharactersBeingWarned.IsEmpty())
        {
            for (auto TargetedCharacter : CharactersBeingWarned)
            {
                CharacterOfInterest = TargetedCharacter;
                break;
            }
        }
        else if (!IsValid(CharacterOfInterest))
        {
            SelectWarningCharacterOfInterest();
        }

        AddToWarnedCharacters(CharacterOfInterest);

        if (ShouldUseWeapon())
        {
            while (!Self.HasDrawnWeapon())
            {
                if (!Self.IsDrawingOrUndrawingWeapon())
                {
                    SelectAndDrawWeapon();
                }
                
                WaitOneTick();
            }
        }

        if (IsValid(CharacterOfInterest))
        {
            AI.SetTargetEnemy(CharacterOfInterest, FocusPriority, this);       
            
            if (Self.GetFeetLocation().Distance(CharacterOfInterest.GetFeetLocation()) < InitialMinimumDistance)
            {
                if (AI.Self.CanStrafe())
                {
                    SetWalkSpeed(EWalkSpeed::Walking);
                    AI.GoIntoDirection(Self.GetFeetLocation() - CharacterOfInterest.GetFeetLocation(), 150.0f, MinimumMoveDistance = InitialMinimumDistance - 20.0f);
                }
                else
                {
                    AI.DodgeAwayFromTarget();
                }
            }

            while (!Self.IsFacingOtherCharacter(CharacterOfInterest))
            {
                WaitOneTick();
            }
        }

        SetDistancesOfCharactersBeingWarned();
        _bBeginWarningFinished = true;
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

    int GetNumWarningsDone() const property
    {
        return BaseNumWarningsDone;

        // TODO check VL

        // int Count = Self.Perception.Memory
        //     .Filter()
        //     .FilterByType(GameplayTag::Sound_Bark_Warn)
        //     .FilterRecent(30.0f)
        //     .FilterTargetCharacterIs(CharacterOfInterest)
        //     .FilterOriginCharacterIs(Self)
        //     .Count;

        // return Count;
    }

    bool IsThreatTooClose(AGothicCharacter OtherCharacter)
    {
        if (!_bBeginWarningFinished)
            return false;

        if (Self.GetFeetLocation().Distance(OtherCharacter.GetFeetLocation()) > TooCloseDistance + Self.SimpleCollisionRadius + OtherCharacter.SimpleCollisionRadius)
            return false;

        return true;
    }

    bool HasThreatApproachedTooMuch(AGothicCharacter OtherCharacter) const
    {
        if (!_bBeginWarningFinished)
            return false;

        if (!MaximumDistancesSeen.Contains(OtherCharacter))
            return false;

        if (Self.GetFeetLocation().Distance(OtherCharacter.GetFeetLocation()) > MaximumDistancesSeen[OtherCharacter] - ThreatApproachedTooMuchDistance)
            return false;

        return true;
    }

    void SelectWarningCharacterOfInterest()
    {
        AGothicCharacter Target = nullptr;
        if (bRequireAwarenessOfInitialTarget && InitialTarget != nullptr && (ThreatGoneDistance < 0.0f || Self.GetDistanceTo(InitialTarget) <= ThreatGoneDistance))
        {
            float Dist = Self.GetDistanceTo(InitialTarget);

            Target = InitialTarget;
        }
        else
        {
            float ClosestDistance = MAX_flt;
            AGothicCharacter ClosestValidCharacter = nullptr;
            TArray<AGothicCharacter> ToRemove;

            for (auto OtherCharacter : CharactersBeingWarned)
            {
                if (!IsValid(OtherCharacter) || OtherCharacter.IsDefeated() || OtherCharacter.IsDead() || !ShouldKeepWarningCharacter(OtherCharacter.CharacterState))
                {
                    ToRemove.Add(OtherCharacter);
                    continue;
                }

                float Distance = OtherCharacter.GetDistanceTo(Self);
                if (Distance >= ClosestDistance)
                    continue;

                if (ThreatGoneDistance > 0.0f && Distance > ThreatGoneDistance)
                    continue;

                ClosestValidCharacter = OtherCharacter;
                ClosestDistance = Distance;
            }

            for (auto OtherCharacter : ToRemove)
            {
                RemoveFromWarnedCharacters(OtherCharacter);
            }

            Target = ClosestValidCharacter;
        }

        CharacterOfInterest = Target;
        if (CharacterOfInterest == nullptr)
            return;

        if (!AI.Character.Perception.CanSee(CharacterOfInterest))
        {
            bCharacterOfInterestVisible = false;
            return;
        }

        bCharacterOfInterestVisible = true;

        AI.TargetCharacterOfInterest(FocusPriority, this);
    }

    bool ShouldKeepWarningCharacter(AGothicCharacterState OtherCharacterState) const
    {
        return Self.CharacterState.IsHostileTowards(OtherCharacterState);
    }

    void CheckWarnedCharacterDistances()
    {
        for (auto OtherCharacter : CharactersBeingWarned)
        {
            if (OtherCharacter == nullptr || OtherCharacter.IsDead() || OtherCharacter.IsDefeated())
                continue;

            if (!IsThreatTooClose(OtherCharacter) && !HasThreatApproachedTooMuch(OtherCharacter))
                continue;

            FRememberedPerception Perception;
            Perception.Origin.CharacterState = OtherCharacter.CharacterState;
            AI.AssessEvent(GameplayTag::AIEvent_Threat_IsTooClose, Perception);
            bEndAssessmentDone = true;
        }
    }

    UFUNCTION(BlueprintOverride)
    void DoTask() final
    {
        Super::DoTask();

        BeginWarning();
        WarnOther(CharacterOfInterest);

        while(!bShouldExitState)
        {
            // EvaluateDisengage();

            CheckWarnedCharacterDistances();

            SelectWarningCharacterOfInterest();

            AfterSelectWarningCharacterOfInterest();

            if (!bCharacterOfInterestVisible && IsValid(CharacterOfInterest) && ShouldFollowCharacterOfInterestWhenNotVisible())
            {
                SetWalkSpeed(EWalkSpeed::Running);
                AI.StartFollowingActor(CharacterOfInterest);
            }
            else
            {
                SetWalkSpeed(EWalkSpeed::Walking);
                AI.StopFollowingActor();
            }

            if (IsValid(CharacterOfInterest) && bWarnDirectlyFromAIState &&
                !ShouldWaitBeforeWarningOther() && 
                TimeForWarning.IsTimeInThePast() && NumWarningsDone < NumWarningsBeforeCombat)
            {
                WarnOther(CharacterOfInterest);
            }
            else if (TimeForWarning.IsTimeInThePast() && NumWarningsDone >= NumWarningsBeforeCombat && 
                IsValid(CharacterOfInterest) && 
                (!IsValid(StateGroup.Leader) || StateGroup.Leader == CharacterState))
            {
                FRememberedPerception ToCombatPercetpion;
                ToCombatPercetpion.Affected.Character = Self;
                ToCombatPercetpion.Affected.CharacterState = Self.CharacterState;
                ToCombatPercetpion.Instigator.Character = CharacterOfInterest;
                ToCombatPercetpion.Instigator.CharacterState = CharacterOfInterest.CharacterState;
                ToCombatPercetpion.EventTag = GameplayTag::AIEvent_Threat_AllWarningsDone;

                AI.AssessEvent(GameplayTag::AIEvent_Threat_AllWarningsDone, ToCombatPercetpion);
                bEndAssessmentDone = true;
            }

            if (ShouldUseWeapon())
            {
                SelectAndDrawWeapon();
            }

            if (!bEndAssessmentDone && CharacterOfInterest == nullptr && AI.GetSensedLivingEnemies().IsEmpty())
            {
                AssessEndWarning();
                WaitOneTick();
                continue;
            }

            DoInLoopIfCharacterNotStillWarning();

            WaitOneTick();
        }
    }

    bool ShouldWaitBeforeWarningOther()
    {
        return false;
    }

    void DoInLoopIfCharacterNotStillWarning()
    {
        if (!IsValid(CharacterOfInterest))
            return;
        
        float Distance = Self.GetFeetLocation().Distance(CharacterOfInterest.GetFeetLocation());
        if (Distance > MaxDistance)
        {
            if (Distance - MaxDistance > 250.0f)
            {
                SetWalkSpeed(EWalkSpeed::Running);
            }
            else
            {
                SetWalkSpeed(EWalkSpeed::Walking);
            }

            AI.GotoCharacter(CharacterOfInterest, MaxDistance);
            SetWalkSpeed(EWalkSpeed::Walking);
        }
        
        if (Distance < ContinuousMinimumDistance)
        {
            if (AI.Self.CanStrafe())
            {
                SetWalkSpeed(EWalkSpeed::Walking);
                AI.GoIntoDirection(Self.GetFeetLocation() - CharacterOfInterest.GetFeetLocation(), 150.0f, MinimumMoveDistance = ContinuousMinimumDistance - 20.0f);
            }
            else
            {
                AI.DodgeAwayFromTarget();
            }
        }
    }

    void AssessEndWarning()
    {
        // if (NumWarningsDone == 0.0f)
        //     return;
        
        if (bRequireAwarenessOfInitialTarget && InitialTarget != nullptr && !AI.Self.Perception.CanSense(InitialTarget))
        {
            AI.CrimeProcessingSubsystem.ForgiveCrimesRelevantToWitness(AI.CharacterState, nullptr, GameplayTag::Crime_IgnoredWarning);
            AI.AssessEvent(GameplayTag::AIEvent_Sensed_NoEnemiesNoHostiles, RememberedPerception);
            bEndAssessmentDone = true;
            return;
        }

        if (bRequireAwarenessOfInitialTarget && InitialTarget != nullptr && ThreatGoneDistance > 0.0f && Self.GetDistanceTo(InitialTarget) > ThreatGoneDistance)
        {
            AI.CrimeProcessingSubsystem.ForgiveCrimesRelevantToWitness(AI.CharacterState, nullptr, GameplayTag::Crime_IgnoredWarning);
            AI.AssessEvent(GameplayTag::AIEvent_Sensed_NoEnemiesNoHostiles, RememberedPerception);
            bEndAssessmentDone = true;
            return;
        }

        if (!AI.GetSensedLivingEnemies().IsEmpty())
            return;

        if (bRequireHostiles && ThreatGoneDistance > 0.0f)
        {
            AI.CrimeProcessingSubsystem.ForgiveCrimesRelevantToWitness(AI.CharacterState, nullptr, GameplayTag::Crime_IgnoredWarning);
            AI.AssessHostilesAndEnemiesAround(RememberedPerception, ThreatGoneDistance);
            bEndAssessmentDone = true;
            return;
        }

        if (bRequireHostiles)
        {
            AI.CrimeProcessingSubsystem.ForgiveCrimesRelevantToWitness(AI.CharacterState, nullptr, GameplayTag::Crime_IgnoredWarning);
            AI.AssessEvent(GameplayTag::AIEvent_Sensed_NoEnemiesNoHostiles, RememberedPerception);
            bEndAssessmentDone = true;
            return;
        }
    }

    FString GetDisplayName() const override
    {
        return "Warning";
    }

#if WITH_IMGUI
    UFUNCTION(BlueprintOverride)
    void DisplayImGui()
    {
        if(AI.TargetEnemy == nullptr)
            return;
        
        ImGui::Text("Target: "); ImGui::SameLine(); ImGui::TextColored(FColor::Yellow, AI.TargetEnemy.CharacterGlobalId.ToString());
    }
#endif
}

/** State in which we are aware of an enemy's presence but have not decided to enter combat yet */
/** For creatures */
UCLASS()
class UAIState_Warning_Crime_Human : UAIState_Warning_Crime 
{
    //default AssessmentModuleClass = UAIARM_State_Warning_Human;
    default StateGroupClass = UAIGroup_Warning_Threat;

    /** Voicelines that can be said as the first warning*/
    UPROPERTY()
    protected FGameplayTag DefaultWarningVoicelineTag;

    /** Baseline Voiceline context tag container */
    UPROPERTY()
    protected FGenericVoicelineRequestContext DefaultVoicelineContext;

    UFUNCTION()
    FGameplayTag GetWarningVoicelineTag() const property
    {
        return DefaultWarningVoicelineTag;
    }

    int GetNumWarningsDone() const override property
    {
        auto WarningGroup = Cast<UAIGroup_Warning_Base>(StateGroup);
        if (!IsValid(WarningGroup))
            return BaseNumWarningsDone;

        return WarningGroup.NumWarningsDone;
    }

    UFUNCTION()
    FGenericVoicelineRequestContext GetWarningVoicelineContext() const property
    {
        return DefaultVoicelineContext;
    }

    bool ShouldUseWeapon() override
    {
        if (!IsValid(CharacterOfInterest))
            return false;

        if (CharacterState.ActsBrave())
            return true;

        if (CharacterOfInterest.IsStrongerThan(Self))
            return false;

        return Super::ShouldUseWeapon();
    }

    void WarnOther(AGothicCharacter OtherCharacter) override
    {
        if (!IsValid(CharacterOfInterest))
            return;

        if (!AI.Character.Perception.CanSee(CharacterOfInterest))
            return;

        if (IsValid(StateGroup) && IsValid(StateGroup.Leader) && IsValid(StateGroup.Leader.Character) && StateGroup.Leader != AI.CharacterState)
        {
            float DistanceFromLeaderToTarget = CharacterOfInterest.GetDistanceTo(StateGroup.Leader.Character);
            float DistanceFromSelfToTarget = CharacterOfInterest.GetDistanceTo(AI.Character);
            if (StateGroup.Leader.Character.Perception.CanSee(CharacterOfInterest) && 
                DistanceFromLeaderToTarget <= DistanceFromSelfToTarget)
                return;
        }

        StateGroup.Leader = AI.CharacterState;

        TArray<FGameplayTag> VoicelineQueue;
        // if (AI.CharacterState.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Address_Vocative_Angry, OtherCharacter.CharacterState))
        // {
        //     VoicelineQueue.Add(GameplayTag::Sound_Voice_Address_Vocative_Angry);
        // }

        // if (WarningVoicelineTag.IsValid() && AI.CharacterState.Voiceline.HasVoicelineFor(WarningVoicelineTag, OtherCharacter.CharacterState))
        // {
        //     VoicelineQueue.Add(WarningVoicelineTag);
        // }

        // if (!VoicelineQueue.IsEmpty())
        // {
        // }
        
        auto VoicelineTag = WarningVoicelineTag;
        auto VoicelineContext = WarningVoicelineContext;

        AI.CharacterState.Voiceline.SayVoicelineWithContext(
            VoicelineTag, 
            OtherCharacter.CharacterState, 
            VoicelineContext, 
            EPerceptionNoiseLoudness::Loud);

        Super::WarnOther(OtherCharacter);
    }

    FString GetDisplayName() const override
    {
        return "Human Warning";
    }
}

/** State in which we are aware of an enemy's presence but have not decided to enter combat yet */
/** For Humans */
/** We will stay in place and tell the enemy to sheathe their weapon 3 times (not aggressive anymore - switch to daily routine) or until they get too close (switch to combat) */
UCLASS()
class UAIState_Warning_Crime_Human_WeaponDrawn : UAIState_Warning_Crime_Human
{
    default OwnedGameplayTags.AddTag(GameplayTag::AIState_Conflict_Warning_Threat);
    default AIStateTag = GameplayTag::AIState_Conflict_Warning_Threat;
    default StateGroupClass = UAIGroup_Warning_Threat;

    default DefaultWarningVoicelineTag = GameplayTag::Sound_Voice_Reaction_Warning_WeaponDown;

    default ThreatApproachedTooMuchDistance = 300.0f;
    default bWarnDirectlyFromAIState = true;

    FString GetDisplayName() const override
    {
        return "No Weapons Allowed - Human Warning";
    }

    bool ShouldKeepWarningCharacter(AGothicCharacterState OtherCharacterState) const override
    {
        // if (!Super::ShouldKeepWarningCharacter(OtherCharacterState))
        //     return false;

        return OtherCharacterState.Character.HasDrawnWeapon();
    }

    FGameplayTag GetWarningVoicelineTag() const override property
    {
        if (NumWarningsDone > 0)
            return GameplayTag::Sound_Voice_Reaction_Warning_InsistWeaponDown;

        return GameplayTag::Sound_Voice_Reaction_Warning_WeaponDown;
    }

    FGenericVoicelineRequestContext GetWarningVoicelineContext() const override property
    {
        FGenericVoicelineRequestContext NewVoicelineContext;
        NewVoicelineContext.TagsOther.AddTag(GameplayTag::VoicelineContext_Weapon);
        return NewVoicelineContext;
    }
}

UCLASS()
class UAIState_Warning_Crime_Human_BlockedPath : UAIState_Warning_Crime_Human
{
    default OwnedGameplayTags.AddTag(GameplayTag::AIState_Conflict_Warning_BlockedPath);
    default AIStateTag = GameplayTag::AIState_Conflict_Warning_BlockedPath;

    default ThreatApproachedTooMuchDistance = MAX_flt;
    default InitialMinimumDistance = 0.0f;
    default TooCloseDistance = 0.0f;

    /** Personal space is computed by multiplying the collision radius with this number. */
    UPROPERTY()
    float PersonalSpaceRadiusMultiplier = 5.0f;

    /** Set to the character standing in the way while the state is running. */
    UPROPERTY()
    protected AGothicCharacter BlockingCharacter;

    UPROPERTY()
    FInGameTime ComplainingTime;

    UPROPERTY()
    float WarningPityTimeSeconds = 8.0f;

    /** How many complaints before escalating to combat via AIEvent_BlockingPath_EscalateToCombat. */
    UPROPERTY()
    int MaxWarningComplaintsBeforeCombat = 2;

    UPROPERTY()
    protected int WarningComplaintCount = 0;

    bool WasPathfollowingAtBlockEmit() const
    {
        auto GothicAI = Cast<UGameplayAbility_CharacterAI_Gothic>(AI);
        if (!IsValid(GothicAI))
            return true;
        return GothicAI.SpawnedStorage(UAIValueSet_BlockingPath).bWasPathfollowingAtBlockEmit;
    }

    bool ShouldEscalateGivenStationaryGate() const
    {
        if (WasPathfollowingAtBlockEmit())
            return true;

        auto GothicAI = Cast<UGameplayAbility_CharacterAI_Gothic>(AI);
        if (!IsValid(GothicAI))
            return true;
        return GothicAI.SpawnedStorage(UAIValueSet_BlockingPath).bAllowEscalationWhileStationary;
    }

    /** Subclasses (Orc) override to force voiceline path even when stationary. */
    bool ShouldUseStationaryAnimationInsteadOfVoiceline() const
    {
        return !WasPathfollowingAtBlockEmit();
    }

    void SayBlockedPathLine(FGameplayTag VoicelineTag)
    {
        if (ShouldUseStationaryAnimationInsteadOfVoiceline())
        {
            AI.Say(GameplayTag::Sound_Voice_Reaction_Interjection_Angry, EPerceptionNoiseLoudness::Loud, BlockingCharacter);
            AI.OutOfTheWayHere();
            return;
        }
        AI.Say(VoicelineTag, EPerceptionNoiseLoudness::Loud, BlockingCharacter);
    }

    void BeginWarning() override
    {
        Super::BeginWarning();

        SetTimeToComplain();
        BlockingCharacter = CharacterOfInterest;
        WarningComplaintCount = 0;

        if (!ShouldEscalateGivenStationaryGate())
        {
            Log(f"[BlockPath] State:Warning EntryAborted (Stationary + AllowEscalationStationary=false; Blocker: {BlockingCharacter} Pathfollowing={WasPathfollowingAtBlockEmit()}) -> StateDone");
            AI.AssessEvent(GameplayTag::AIEvent_State_Done, RememberedPerception);
            bEndAssessmentDone = true;
            return;
        }

        auto GothicAI = Cast<UGameplayAbility_CharacterAI_Gothic>(AI);
        if (IsValid(GothicAI))
        {
            auto BlockingPathStorage = GothicAI.SpawnedStorage(UAIValueSet_BlockingPath);
            if (!BlockingPathStorage.bBlockingPathFrustrationIncrementedThisCycle)
            {
                if (BlockingPathStorage.BlockingPathWindowStart.AgeInRealtimeSeconds > BlockingPathStorage.BlockingPathFrustrationWindowDuration)
                    BlockingPathStorage.BlockingPathFrustrationCount = 0;
                BlockingPathStorage.BlockingPathWindowStart = FInGameTime::Now();
                BlockingPathStorage.BlockingPathFrustrationCount++;
                BlockingPathStorage.bBlockingPathFrustrationIncrementedThisCycle = true;
                Log(f"[BlockPath] State:Warning FrustrationIncrement (Count={BlockingPathStorage.BlockingPathFrustrationCount})");
            }
        }

        Log(f"[BlockPath] State:Warning Entry (Blocker: {BlockingCharacter} Pathfollowing={WasPathfollowingAtBlockEmit()} AllowEscalationStationary={ShouldEscalateGivenStationaryGate()})");
        SayBlockedPathLine(GameplayTag::Sound_Voice_Reaction_Blocking_OutOfMyWay);
    }

    FString GetDisplayName() const override
    {
        return "Blocked Path - Human Warning";
    }

    bool IsItTimeToComplain()
    {
        return FInGameTime::IsAfter(FInGameTime::Now(), ComplainingTime);
    }

    void SetTimeToComplain()
    {
        ComplainingTime = FInGameTime::XRealtimeSecondsFromNow(WarningPityTimeSeconds);
    }

    void DoInLoopIfCharacterNotStillWarning() override
    {
        Super::DoInLoopIfCharacterNotStillWarning();

        if (!IsItTimeToComplain())
            return;

        WarningComplaintCount++;
        SetTimeToComplain();

        bool bCanEscalateToCombat = ShouldEscalateGivenStationaryGate();

        if (bCanEscalateToCombat && WarningComplaintCount >= MaxWarningComplaintsBeforeCombat)
        {
            FGenericVoicelineRequestContext CombatStartContext;
            CombatStartContext.TagsOther.AddLeafTag(GameplayTag::VoicelineContext_AskedForIt);
            Log(f"[BlockPath] State:Warning Escalate -> Combat (Complaints={WarningComplaintCount}/{MaxWarningComplaintsBeforeCombat})");
            Log(f"[BlockPath][WARN] EmitEscalateToCombat (Complaints={WarningComplaintCount}/{MaxWarningComplaintsBeforeCombat} Blocker={BlockingCharacter} BlockerValid={IsValid(BlockingCharacter)} CoI={CharacterOfInterest} CoIValid={IsValid(CharacterOfInterest)})");
            AI.CharacterState.Voiceline.SayVoicelineWithContext(
                GameplayTag::Sound_Voice_Reaction_Combat_Start, BlockingCharacter.CharacterState,
                CombatStartContext,
                EPerceptionNoiseLoudness::Loud);

            FRememberedPerception Perception;
            if (CharacterOfInterest != nullptr)
            {
                Perception.Instigator.CharacterState = CharacterOfInterest.CharacterState;
                Perception.Instigator.Character = CharacterOfInterest;
                Perception.Origin.CharacterState = CharacterOfInterest.CharacterState;
                Perception.Origin.Character = CharacterOfInterest;
            }
            Perception.Affected.CharacterState = CharacterState;
            Perception.Origin.RelativeRank = RememberedPerception.Origin.RelativeRank;
            Log(f"[BlockPath][WARN] EscalateToCombat Perception (OriginState={Perception.Origin.CharacterState} OriginChar={Perception.Origin.Character} InstigatorState={Perception.Instigator.CharacterState} InstigatorChar={Perception.Instigator.Character} RelativeRank={Perception.Origin.RelativeRank})");
            AI.AssessEvent(GameplayTag::AIEvent_BlockingPath_EscalateToCombat, Perception);
            bEndAssessmentDone = true;
        }
        else
        {
            if (!bCanEscalateToCombat && WarningComplaintCount >= MaxWarningComplaintsBeforeCombat)
                Log(f"[BlockPath] State:Warning CombatEscalationSuppressed (Stationary + AllowEscalationStationary=false; Complaints={WarningComplaintCount}/{MaxWarningComplaintsBeforeCombat})");
            else
                Log(f"[BlockPath] State:Warning Complain {WarningComplaintCount}/{MaxWarningComplaintsBeforeCombat} (Say InsistOutOfMyWay or stationary anim)");

            SayBlockedPathLine(GameplayTag::Sound_Voice_Reaction_Blocking_InsistOutOfMyWay);
        }
    }

    float GetActivePersonalSpaceRadius() const
    {
        auto GothicAI = Cast<UGameplayAbility_CharacterAI_Gothic>(AI);
        if (IsValid(GothicAI))
        {
            float Stored = GothicAI.SpawnedStorage(UAIValueSet_BlockingPath).ActiveBlockingPathPersonalSpaceRadiusCm;
            if (Stored > 0.0f)
                return Stored;
        }
        return Self.GetSimpleCollisionRadius() * PersonalSpaceRadiusMultiplier;
    }

    bool IsBlockerInInitialFacingCone() const
    {
        if (!IsValid(BlockingCharacter))
            return false;

        auto GothicAI = Cast<UGameplayAbility_CharacterAI_Gothic>(AI);
        if (IsValid(GothicAI))
        {
            FVector InitDir = GothicAI.SpawnedStorage(UAIValueSet_BlockingPath).InitialBlockingFacingDirection;
            if (!InitDir.IsNearlyZero())
            {
                FVector ToBlocker = (BlockingCharacter.GetActorLocation() - Self.GetActorLocation()).GetSafeNormal2D();
                return ToBlocker.DotProduct(InitDir.GetSafeNormal2D()) > 0.5f;
            }
        }
        return Self.IsFacingOtherCharacter(BlockingCharacter);
    }

    bool IsCharacterStillBlockingPath() const
    {
        if (!IsValid(BlockingCharacter))
            return false;

        if (Self.GetDistanceTo(BlockingCharacter) > GetActivePersonalSpaceRadius())
            return false;

        return IsBlockerInInitialFacingCone();
    }

    void SelectWarningCharacterOfInterest() override
    {
        if (!IsCharacterStillBlockingPath())
        {
            if (CharacterOfInterest != nullptr)
                Log(f"[BlockPath] State:Warning BlockerGone -> will AssessEndWarning");
            CharacterOfInterest = nullptr;
        }

        if (CharacterOfInterest == nullptr)
            return;

        if (!AI.Character.Perception.CanSee(CharacterOfInterest))
        {
            bCharacterOfInterestVisible = false;
            return;
        }

        bCharacterOfInterestVisible = true;
        AI.TargetCharacterOfInterest(FocusPriority, this);
    }

    bool ShouldKeepWarningCharacter(AGothicCharacterState OtherCharacterState) const override
    {
        return IsCharacterStillBlockingPath();
    }
}

UCLASS()
class UAIState_Warning_Crime_Orc_BlockedPath : UAIState_Warning_Crime_Human_BlockedPath
{
    bool ShouldUseStationaryAnimationInsteadOfVoiceline() const override
    {
        return false;
    }

    FString GetDisplayName() const override
    {
        return "Blocked Path - Orc Warning";
    }
}

UCLASS()
class UAIState_Warning_Crime_Human_Trespassing : UAIState_Warning_Crime_Human
{
    default OwnedGameplayTags.AddTag(GameplayTag::AIState_Conflict_Warning_Trespassing);
    default AIStateTag = GameplayTag::AIState_Conflict_Warning_Trespassing;
    default StateGroupClass = UAIGroup_Warning_Trespassing;

    default MaxDistance = 300.0f;

    FGameplayTag GetWarningVoicelineTag() const override property
    {
        if (NumWarningsDone > 0)
            return GameplayTag::Sound_Voice_Reaction_Warning_InsistIntruder;

        return GameplayTag::Sound_Voice_Reaction_Warning_Intruder;
    }

    FGenericVoicelineRequestContext GetWarningVoicelineContext() const override property
    {
        FGenericVoicelineRequestContext VoicelineContext = DefaultVoicelineContext;
        VoicelineContext.TagsOther.AddTag(GameplayTag::VoicelineContext_Intruder);

        if (!IsValid(CharacterOfInterest))
            return VoicelineContext;

        if (CharacterState.ActsBrave())
            return VoicelineContext;

        if (CharacterOfInterest.IsStrongerThan(Self))
        {
            VoicelineContext.TagsMe.AddTag(GameplayTag::VoicelineContext_Weak);
        }

        return VoicelineContext;
    }

    default ThreatApproachedTooMuchDistance = MAX_flt;
    default InitialMinimumDistance = 120.0f;
    default ContinuousMinimumDistance = 120.0f;
    default TooCloseDistance = 0.0f;
    default bRequireLineOfSight = true;
    default bChaseOnNoLineOfSight = true;
    default MaximumTimeSecondsWithoutVisibleHostile = 100.0f;
    default bWarnDirectlyFromAIState = true;

    FString GetDisplayName() const override
    {
        return "Trespassing - Human Warning";
    }

    void SelectWarningCharacterOfInterest() override
    {
        float MinDistance = MAX_flt;
        AGothicCharacter WarningCharacterOfInterest = nullptr;

        for (auto OtherCharacter : AI.GetSensedLivingHostiles())
        {
            if (!IsValid(OtherCharacter))
                continue;
            
            auto TrespassingContext = OtherCharacter.CharacterState.GetTrespassingContextFor(CharacterState);
            if (TrespassingContext.IsNotTrespassing() || TrespassingContext.IsTrespassingIgnored())
                continue;

            if (!AI.Character.Perception.CanSee(OtherCharacter))
                continue;
            
            float Distance = CharacterState.GetDistanceTo(OtherCharacter);
            if (Distance >= MinDistance)
                continue;
            
            WarningCharacterOfInterest = OtherCharacter;
            MinDistance = Distance;
        }

        for (auto OtherCharacter : CharactersBeingWarned)
        {
            if (!IsValid(OtherCharacter))
                continue;

            auto TrespassingContext = OtherCharacter.CharacterState.GetTrespassingContextFor(CharacterState);
            if (TrespassingContext.IsNotTrespassing() || TrespassingContext.IsTrespassingIgnored())
                continue;

            if (!AI.Character.Perception.CanSee(OtherCharacter))
                continue;
            
            float Distance = CharacterState.GetDistanceTo(OtherCharacter);
            if (Distance >= MinDistance)
                continue;
            
            WarningCharacterOfInterest = OtherCharacter;
            MinDistance = Distance;
        }

        if (!IsValid(WarningCharacterOfInterest) && IsValid(CharacterOfInterest) && 
            IsCharacterOfInterestTrespassing() && // Still trespassing
            !AI.Character.Perception.CanSee(CharacterOfInterest)) // but Not visible
        {
            if (bCharacterOfInterestVisible)
            {
                TimeLastCharacterOfInterestWasVisible = FInGameTime::Now();
            }
            
            bCharacterOfInterestVisible = false;

            if (MaximumTimeSecondsWithoutVisibleHostile >= TimeLastCharacterOfInterestWasVisible.AgeInRealtimeSeconds)
            {
                WarningCharacterOfInterest = CharacterOfInterest;
            }
        }

        CharacterOfInterest = WarningCharacterOfInterest;
        if (!IsValid(CharacterOfInterest))
            return;

        if (!AI.Character.Perception.CanSee(CharacterOfInterest))
            return;

        bCharacterOfInterestVisible = true;
        AI.TargetCharacterOfInterest(FocusPriority, this);
    }

    bool ShouldKeepWarningCharacter(AGothicCharacterState OtherCharacterState) const override
    {
        return OtherCharacterState.IsCharacterTrespassingAccordingToWitness(AI.CharacterState);
    }

    bool IsCharacterOfInterestTrespassing()
    {
        if (!IsValid(CharacterOfInterest))
            return false;

        return CharacterOfInterest.CharacterState.IsCharacterTrespassingAccordingToWitness(AI.CharacterState);
    }

    bool ShouldWaitBeforeWarningOther() override
    {
        if (!IsValid(CharacterOfInterest))
            return false;

        // Character is getting out of or into an interaction
        // if (CharacterOfInterest.CharacterState.HasGameplayTag(GameplayTag::State_Interact_Ongoing) && 
        //     CharacterOfInterest.CharacterState.HasGameplayTag(GameplayTag::State_BlockState))
        //     return true;

        if (CharacterOfInterest.IsDefeated())
            return true;

        return false;
    }

    /** How far back to scan for a personal-theft committed by the warned character. */
    UPROPERTY(EditDefaultsOnly, Category="Investigate")
    float PersonalTheftLookbackSeconds = 30.0f;

    void AssessEndWarning() override
    {
        AGothicCharacterState SuspectState = nullptr;
        AGothicCharacter SuspectChar = nullptr;
        FVector InstigatorPos = FVector::ZeroVector;
        FVector InstigatorNavPos = FVector::ZeroVector;

        if (IsValid(InitialTarget))
        {
            SuspectChar = InitialTarget;
            SuspectState = InitialTarget.CharacterState;
        }
        else if (IsValid(CharacterOfInterest))
        {
            SuspectChar = CharacterOfInterest;
            SuspectState = CharacterOfInterest.CharacterState;
        }
        else if (IsValid(RememberedPerception.Instigator.CharacterState))
        {
            SuspectChar = RememberedPerception.Instigator.Character;
            SuspectState = RememberedPerception.Instigator.CharacterState;
        }
        else if (IsValid(RememberedPerception.Origin.CharacterState))
        {
            SuspectChar = RememberedPerception.Origin.Character;
            SuspectState = RememberedPerception.Origin.CharacterState;
        }
        else
        {
            // Last resort: pick any character we are actively warning.
            for (auto WarnedChar : CharactersBeingWarned)
            {
                if (!IsValid(WarnedChar))
                    continue;
                SuspectChar = WarnedChar;
                SuspectState = WarnedChar.CharacterState;
                break;
            }
        }

        if (IsValid(SuspectChar))
        {
            InstigatorPos = SuspectChar.ActorLocation;
            InstigatorNavPos = SuspectChar.NavAgentLocation;
        }

        if (IsValid(SuspectState))
        {
            if (SuspiciousSoundTheftFollowup::TryAssessForWitness(
                    AI, AI.CharacterState, SuspectState,
                    PersonalTheftLookbackSeconds,
                    InstigatorPos, InstigatorNavPos))
            {
                return;
            }
        }

        Super::AssessEndWarning();
    }
}

UCLASS()
class UAIState_Warning_Crime_Human_NotWelcomeHere : UAIState_Warning_Crime_Human_Trespassing
{
    default OwnedGameplayTags.AddTag(GameplayTag::AIState_Conflict_Warning_NotWelcomeHere);
    default AIStateTag = GameplayTag::AIState_Conflict_Warning_NotWelcomeHere;
    default StateGroupClass = UAIGroup_Warning_Threat;

    bool IsCharacterOfInterestTrespassing() override
    {
        if (!IsValid(CharacterOfInterest))
            return false;

        return AI.IsInSameTerritoryOrCombatRadiusAsOtherCharacter(CharacterOfInterest);
    }
}

UCLASS()
class UAIState_Warning_Crime_Human_Interaction : UAIState_Warning_Crime_Human
{
    default OwnedGameplayTags.AddTag(GameplayTag::AIState_Conflict_Warning_Interaction);
    default AIStateTag = GameplayTag::AIState_Conflict_Warning_Interaction;
    default StateGroupClass = UAIGroup_Warning_Interaction;

    default DefaultWarningVoicelineTag = GameplayTag::Sound_Voice_Reaction_Warning;

    default ThreatApproachedTooMuchDistance = MAX_flt;
    default InitialMinimumDistance = 120.0f;
    default TooCloseDistance = 0.0f;
    default bRequireLineOfSight = true;
    default MaximumTimeSecondsWithoutVisibleHostile = 100.0f;
    default bWarnDirectlyFromAIState = true;

    default MaxDistance = 300.0f;

    FString GetDisplayName() const override
    {
        return "Interacting - Human Warning";
    }

    void SelectWarningCharacterOfInterest() override
    {
        float MinDistance = MAX_flt;
        AGothicCharacter WarningCharacterOfInterest = nullptr;

        for (auto OtherCharacter : AI.GetSensedLivingHostiles())
        {
            if (!OtherCharacter.CharacterState.HasGameplayTag(GameplayTag::State_Interact))
                continue;
            
            float Distance = CharacterState.GetDistanceTo(OtherCharacter);
            if (Distance >= MinDistance)
                continue;
            
            WarningCharacterOfInterest = OtherCharacter;
            MinDistance = Distance;
        }

        for (auto OtherCharacter : CharactersBeingWarned)
        {
            if (OtherCharacter == WarningCharacterOfInterest)
                continue;

            if (!OtherCharacter.CharacterState.HasGameplayTag(GameplayTag::State_Interact))
                continue;
            
            float Distance = CharacterState.GetDistanceTo(OtherCharacter);
            if (Distance >= MinDistance)
                continue;
            
            WarningCharacterOfInterest = OtherCharacter;
            MinDistance = Distance;
        }

        if (!IsValid(WarningCharacterOfInterest) && IsValid(CharacterOfInterest) && 
            CharacterOfInterest.CharacterState.HasGameplayTag(GameplayTag::State_Interact) && // Still interacting
            !AI.Character.Perception.CanSee(CharacterOfInterest)) // but Not visible
        {
            if (bCharacterOfInterestVisible)
            {
                TimeLastCharacterOfInterestWasVisible = FInGameTime::Now();
            }
            
            bCharacterOfInterestVisible = false;

            if (MaximumTimeSecondsWithoutVisibleHostile >= TimeLastCharacterOfInterestWasVisible.AgeInRealtimeSeconds)
            {
                WarningCharacterOfInterest = CharacterOfInterest;
            }
        }

        CharacterOfInterest = WarningCharacterOfInterest;
        if (!IsValid(CharacterOfInterest))
            return;

        if (!AI.Character.Perception.CanSee(CharacterOfInterest))
            return;

        bCharacterOfInterestVisible = true;
        AI.TargetCharacterOfInterest(FocusPriority, this);
    }

    bool ShouldKeepWarningCharacter(AGothicCharacterState OtherCharacterState) const override
    {
        return CharacterOfInterest.CharacterState.HasGameplayTag(GameplayTag::State_Interact);
    }

    bool ShouldWaitBeforeWarningOther() override
    {
        if (!IsValid(CharacterOfInterest))
            return false;

        // Character is getting out of or into an interaction
        // if (CharacterOfInterest.CharacterState.HasGameplayTag(GameplayTag::State_Interact_Ongoing) && 
        //     CharacterOfInterest.CharacterState.HasGameplayTag(GameplayTag::State_BlockState))
        //     return true;

        return false;
    }
}

UCLASS()
class UAIState_Warning_Crime_Human_Lockpicking : UAIState_Warning_Crime_Human_Interaction
{
    default OwnedGameplayTags.RemoveTag(GameplayTag::AIState_Conflict_Warning_Interaction);
    default OwnedGameplayTags.AddTag(GameplayTag::AIState_Conflict_Warning_Lockpicking);
    default AIStateTag = GameplayTag::AIState_Conflict_Warning_Lockpicking;

    default DefaultWarningVoicelineTag = GameplayTag::Sound_Voice_Reaction_Crime_Thief_Lockpicking;

    FString GetDisplayName() const override
    {
        return "Lockpicking - Human Warning";
    }
}

namespace Warning_Crime_Theft
{
    struct FStolenItemHandle
    {
        FStolenItemHandle(const UItemDefinition& InItem, const AGothicCharacterState InThief, const TArray<AGothicCharacterState> InVictimCharacters, const FGameplayTagContainer InVictimGuilds)
        {
            Item = InItem;
            Thief = InThief;
            VictimCharacters = InVictimCharacters;
            VictimGuilds = InVictimGuilds;
        }

        const UItemDefinition Item;
        const TArray<AGothicCharacterState> VictimCharacters;
        const FGameplayTagContainer VictimGuilds;
        const AGothicCharacterState Thief;
    }

    struct FStolenItemList
    {
        private TArray<FStolenItemHandle> _ItemHandles;
        float _StolenValue = 0.0f;

        TArray<FStolenItemHandle> GetItemHandles() const property
        {
            return _ItemHandles;
        }

        void AddItem(const UItemDefinition& Item, 
                     const AGothicCharacterState Thief, 
                     const TArray<AGothicCharacterState> VictimCharacters = TArray<AGothicCharacterState>(), 
                     const FGameplayTagContainer VictimGuilds = FGameplayTagContainer())
        {
            _ItemHandles.Add(FStolenItemHandle(Item, Thief, VictimCharacters, VictimGuilds));
            _StolenValue += Item.m_Value;
        }

        int GetCount() const property
        {
            return _ItemHandles.Num();
        }

        float GetStolenValue() const property
        {
            return _StolenValue;
        }

        bool GetIsEmpty() const property
        {
            return _ItemHandles.IsEmpty();
        }

        bool IsCharacterPersonalVictim(AGothicCharacterState CharacterState)
        {
            for (auto ItemHandle : ItemHandles)
            {
                if (ItemHandle.VictimCharacters.Contains(CharacterState))
                    return true;
            }

            return false;
        }

        bool Contains(TSubclassOf<UItemDefinition> ItemClass)
        {
            for (auto ItemHandle : ItemHandles)
            {
                if (ItemHandle.Item.IsA(ItemClass))
                    return true;
            }

            return false;
        }

        bool Remove(TSubclassOf<UItemDefinition> ItemClass, FStolenItemHandle& RemovedItemHandle)
        {
            int Index = 0;
            bool bFound = false;
            for (auto ItemHandle : ItemHandles)
            {
                if (ItemHandle.Item.IsA(ItemClass))
                {
                    RemovedItemHandle = ItemHandle;
                    bFound = true;
                    break;
                }

                Index++;
            }

            if (!bFound)
                return false;

            _StolenValue -= RemovedItemHandle.Item.m_Value;
            _ItemHandles.RemoveAt(Index);
            return true;
        }
    }

    struct FItemPickupHandle
    {
        FItemPickupHandle(TSubclassOf<UItemDefinition> InClass, AItemVisualWorld InItemVisualWorld, AGothicCharacterState InDroppedBy, EItemPickupReason InReason = EItemPickupReason::Return)
        {
            _Class = InClass;
            _ItemVisualWorld = InItemVisualWorld;
            _Reason = InReason;
            _DroppedBy = InDroppedBy;
        }

        AGothicCharacterState _DroppedBy;
        TSubclassOf<UItemDefinition> _Class;
        AItemVisualWorld _ItemVisualWorld;
        EItemPickupReason _Reason;

        TSubclassOf<UItemDefinition> GetClass() const property
        {
            return _Class;
        }

        AItemVisualWorld GetItemVisualWorld() const property
        {
            return _ItemVisualWorld;
        }

        EItemPickupReason GetReason() const property
        {
            return _Reason;
        }

        AGothicCharacterState GetDroppedBy() const property
        {
            return _DroppedBy;
        }
    }

    enum EItemPickupReason
    {
        None,
        Return,
        Exchange,
        Bribe,
        MAX
    }
}


UCLASS()
class UAIState_Warning_Crime_Human_Theft : UAIState_Warning_Crime_Human
{
    default OwnedGameplayTags.AddTag(GameplayTag::AIState_Conflict_Warning_Theft);
    default AIStateTag = GameplayTag::AIState_Conflict_Warning_Theft;
    default StateGroupClass = UAIGroup_Warning_Theft;

    default ThreatApproachedTooMuchDistance = MAX_flt;
    default InitialMinimumDistance = 120.0f;
    default TooCloseDistance = 0.0f;
    default bRequireLineOfSight = true;
    default MaximumTimeSecondsWithoutVisibleHostile = 100.0f;

    default MaxDistance = 300.0f;

    UAITask_PickUpItem PickUpTaskTemplate;
    UAITask_PickUpItem PickUpTask;

    /** Last world drop location / class when a PickUpTask was spawned (bribe proximity if actor despawns before Success). */
    FVector ActivePickupTargetWorldLocation;
    bool bHaveActivePickupTargetWorldLocation = false;
    TSubclassOf<UItemDefinition> ActivePickupTargetItemClass;

    AGothicCharacterState ThiefCharacterState;
    const UItemDefinition StolenItemDefaultObject;
    bool bSelfIsPersonalVictim = false;

    TArray<Warning_Crime_Theft::FItemPickupHandle> ItemPickupQueue;
    TArray<Warning_Crime_Theft::FItemPickupHandle> DroppedItemList;
    float TotalDroppedItemValue = 0.0f;

    UCrimeTuningConfig_Theft Tuning;
    FInGameTime ComplianceDeadline;
    bool bComplianceOnHold = false;
    float ComplianceSecondsRemainingWhenHeld = 0.0f;
    int WrongDropCount = 0;
    FInGameTime TimeForInsistGiveBack;
    bool bInsistGiveBackPending = false;
    FInGameTime TimeForHalfLifeInsist;
    bool bHalfLifeInsistPending = false;

    FVector OriginalTheftLocation;
    FInGameTime TimeLoSFirstLost;
    bool bWasVisibleLastTick = true;

    bool bPickingUpStuff = false;

    bool bHasExitedWarning = false;

    FString GetDisplayName() const override
    {
        return "Theft - Human Warning";
    }

    bool ShouldUseWeapon() override
    {
        return CanEquipWeapons();
    }

    FGenericVoicelineRequestContext GetWarningVoicelineContext() const override property
    {
        FGenericVoicelineRequestContext NewVoicelineContext;
        NewVoicelineContext.TagsOther.AddTag(GameplayTag::VoicelineContext_Thief);
        return NewVoicelineContext;
    }

    void BeginWarning() override
    {
        Super::BeginWarning();

        ThiefCharacterState = RememberedPerception.Instigator.CharacterState;

        OriginalTheftLocation = (IsValid(ThiefCharacterState) && IsValid(ThiefCharacterState.Character))
            ? ThiefCharacterState.Character.ActorLocation
            : AI.Character.ActorLocation;

        Tuning = AI.CrimeProcessingSubsystem.TheftTuning;
        float ComplianceSeconds = IsValid(Tuning) ? Tuning.WarningComplianceSeconds : 15.0f;
        ComplianceDeadline = FInGameTime::XRealtimeSecondsFromNow(ComplianceSeconds);
        TimeForHalfLifeInsist = FInGameTime::XRealtimeSecondsFromNow(ComplianceSeconds * 0.5f);
        bHalfLifeInsistPending = true;

        auto CrimeMemory = UCrimeMemorySubsystem::Get(AI);

        // Get all global crimes of thief
        auto ThiefCrimes = CrimeMemory.GetAllCrimesCommitedBy(ThiefCharacterState);
        TArray<FRelativeCrimeDataEntry> RelativeCrimes;
        if (!CrimeMemory.GetRelativeCrimesOfCharacter(RelativeCrimes, CharacterState))
            return;

        for (auto RelativeCrime : RelativeCrimes)
        {
            if (!ThiefCrimes.Contains(RelativeCrime.ID))
                continue;

            if (RelativeCrime.bIsSuppressed)
                continue;

            FGlobalCrimeDataEntry GlobalCrimeEntry;
            if (!CrimeMemory.GetCrimeByID(GlobalCrimeEntry, RelativeCrime.ID))
                continue;

            if (GlobalCrimeEntry.bIsForgiven)
                continue;

            if (!GlobalCrimeEntry.CrimeType.MatchesTag(GameplayTag::Crime_Theft))
                continue;

            StolenItemDefaultObject = GlobalCrimeEntry.ItemDefinitionClass.GetDefaultObject();

            if (GlobalCrimeEntry.VictimGlobalIDs.Contains(CharacterState.CharacterGlobalId))
            {
                bSelfIsPersonalVictim = true;
            }

            break;
        }

        // Perception may not have bound yet when routine cancels into warning, enqueue nearby return item once.
        TryEnqueueMissedDrops();
    }

    /**
     * Enqueue stolen items the thief already dropped before Warning entered (perception bound late).
     * Uses perception memory of Perception_Character_DropItem from the thief
     */
    void TryEnqueueMissedDrops()
    {
        if (!IsValid(AI) || !IsValid(AI.Character))
            return;
        if (!IsValid(ThiefCharacterState) || !IsValid(ThiefCharacterState.Character))
            return;
        if (!IsValid(StolenItemDefaultObject))
            return;

        float LookbackSec = IsValid(Tuning) ? Tuning.MissedDropPerceptionLookbackSec : 30.0f;

        auto DropEvents = Self.Perception.Memory
            .Filter()
            .FilterByType(GameplayTag::Perception_Character_DropItem)
            .FilterOriginCharacterIs(ThiefCharacterState.Character)
            .FilterRecent(LookbackSec)
            .ToArray();

        for (auto Evt : DropEvents)
        {
            auto Item = Cast<AItemVisualWorld>(Evt.Target.Actor);
            if (!IsValid(Item))
                continue;

            auto ItemClass = Item.m_WorldItemDefinition;
            if (!ItemClass.IsValid() || ItemClass != StolenItemDefaultObject.Class)
                continue;

            bool AlreadyQueued = false;
            for (auto Existing : ItemPickupQueue)
            {
                if (Existing.ItemVisualWorld == Item)
                {
                    AlreadyQueued = true;
                    break;
                }
            }
            if (AlreadyQueued)
                continue;

            SetItemToBePickedUp(ItemClass, Item, ThiefCharacterState, Warning_Crime_Theft::EItemPickupReason::Return);
        }
    }

    UFUNCTION(BlueprintOverride)
    void SetupPerceptions(UCharacterPerceptionComponent Perception)
    {
        Super::SetupPerceptions(Perception);
        
        Perception.OnSensedEventOnOthers(GameplayTag::Perception_Character_DropItem).PerceptionGained.BindUFunction(this, n"OnItemDroppedByOther");
    }

    UFUNCTION()
    private void OnItemDroppedByOther(const FRememberedPerception&in Perception,
                                      const FPerceptionShortTermMemory&in Memory)
    {
        if (!IsValid(ThiefCharacterState) || !IsValid(StolenItemDefaultObject))
        {
            return;
        }
        
        auto DropperCharacter = Perception.Origin.Character;
        auto Actor = Perception.Target.Actor;
        auto Item = Cast<AItemVisualWorld>(Actor);
        auto ItemClass = Item.m_WorldItemDefinition;

        bool bDroppedByThief = IsValid(DropperCharacter) && IsValid(DropperCharacter.CharacterState) &&
            DropperCharacter.CharacterState == ThiefCharacterState;

        // Stolen item dropped by thief: add to return queue.
        if (ItemClass == StolenItemDefaultObject.Class)
        {
            if (!bDroppedByThief)
            {
                return;
            }
            SetItemToBePickedUp(ItemClass, Item, DropperCharacter.CharacterState, Warning_Crime_Theft::EItemPickupReason::Return);
            return;
        }

        // Non-stolen item dropped: add to dropped list.
        int DroppedItemValue = ItemClass.DefaultObject.m_Value;
        TotalDroppedItemValue += DroppedItemValue;

        AddItemToDroppedList(ItemClass, Item, DropperCharacter.CharacterState);

        float BribeFloor = IsValid(Tuning) ? Tuning.BribeTotalDroppedValueFloor : 20.0f;
        float GuardMult = IsValid(Tuning) ? Tuning.GuardBribeVsStolenValueMultiplier : 0.8f;
        float VictimMult = IsValid(Tuning) ? Tuning.VictimExchangeVsStolenValueMultiplier : 1.1f;
        float StolenValue = StolenItemDefaultObject.m_Value;

        // Non-personal victim, non-stolen item dropped: check if we should bribe.
        if (!bSelfIsPersonalVictim &&
            (TotalDroppedItemValue > Math::Max(BribeFloor, StolenValue * GuardMult)) &&
            Self.HasGameplayTag(GameplayTag::CampRole_Guard))
        {
            SetDroppedItemListToBePickedUp(Warning_Crime_Theft::EItemPickupReason::Bribe);
            return;
        }

        // Personal victim, non-stolen item dropped: check if we should exchange.
        if (bSelfIsPersonalVictim &&
            TotalDroppedItemValue > Math::Max(BribeFloor, StolenValue * VictimMult))
        {
            SetDroppedItemListToBePickedUp(Warning_Crime_Theft::EItemPickupReason::Exchange);
            return;
        }

        // Wrong item dropped: count it and decide whether to escalate or give a second chance.
        WrongDropCount++;
        int MaxWrong = IsValid(Tuning) ? Tuning.MaxWrongDropsBeforeCombat : 2;
        if (WrongDropCount >= MaxWrong)
        {
            EmitEscalationEvent(GameplayTag::AIEvent_Crime_Theft_WarningRefused);
            return;
        }

        // Play YouWannaFoolMe and queue InsistGiveBack.
        if (AI.CharacterState.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Reaction_Crime_Thief_YouWannaFoolMe))
            AI.CharacterState.Voiceline.SayVoicelineWithContext(
                GameplayTag::Sound_Voice_Reaction_Crime_Thief_YouWannaFoolMe, IsValid(CharacterOfInterest) ? CharacterOfInterest.CharacterState : nullptr,
                WarningVoicelineContext,
                EPerceptionNoiseLoudness::Loud, );

        bInsistGiveBackPending = true;
        float Gap = IsValid(Tuning) ? Tuning.FoolMeInsistGiveBackGapSeconds : 2.0f;
        TimeForInsistGiveBack = FInGameTime::XRealtimeSecondsFromNow(Gap);

        float ComplianceSeconds = IsValid(Tuning) ? Tuning.WarningComplianceSeconds : 15.0f;
        ComplianceDeadline = FInGameTime::XRealtimeSecondsFromNow(ComplianceSeconds);
        TimeForHalfLifeInsist = FInGameTime::XRealtimeSecondsFromNow(ComplianceSeconds * 0.5f);
        bHalfLifeInsistPending = true;
    }

    void AddItemToDroppedList(TSubclassOf<UItemDefinition> ItemClass, AItemVisualWorld Item, AGothicCharacterState DroppedBy)
    {
        DroppedItemList.Add(Warning_Crime_Theft::FItemPickupHandle(ItemClass, Item, DroppedBy, Warning_Crime_Theft::EItemPickupReason::None));
    }

    void SetDroppedItemListToBePickedUp(Warning_Crime_Theft::EItemPickupReason Reason)
    {
        for (auto ItemHandle : DroppedItemList)
        {
            ItemPickupQueue.Add(Warning_Crime_Theft::FItemPickupHandle(ItemHandle.Class, ItemHandle.ItemVisualWorld, ItemHandle.DroppedBy, Reason));
        }
    }

    void SetItemToBePickedUp(TSubclassOf<UItemDefinition> ItemClass, AItemVisualWorld Item, AGothicCharacterState DroppedBy, Warning_Crime_Theft::EItemPickupReason Reason)
    {
        ItemPickupQueue.Add(Warning_Crime_Theft::FItemPickupHandle(ItemClass, Item, DroppedBy, Reason));
    }

    /** Called externally (e.g. by the personal-victim) to freeze this state's compliance timer. */
    void HoldComplianceTimer()
    {
        if (bComplianceOnHold)
            return;
        float Remaining = ComplianceDeadline.AgeInRealtimeSeconds;
        ComplianceSecondsRemainingWhenHeld = Math::Max(0.0f, -Remaining);
        bComplianceOnHold = true;
    }

    /** Called externally to resume a previously held compliance timer. */
    void ResumeComplianceTimer()
    {
        if (!bComplianceOnHold)
            return;
        float ResumeSeconds = Math::Max(0.5f, ComplianceSecondsRemainingWhenHeld);
        ComplianceDeadline = FInGameTime::XRealtimeSecondsFromNow(ResumeSeconds);
        bComplianceOnHold = false;
        ComplianceSecondsRemainingWhenHeld = 0.0f;
    }

    /** True if another theft-warning group member still has return/bribe pickup work in flight. */
    bool AnyWarningTheftGroupPeerNeedsComplianceHold() const
    {
        if (!IsValid(ThiefCharacterState))
            return false;

        auto AllTheftGroups = UGothicAIGroup::GetAllActiveGroupsOfClass(UAIGroup_Warning_Theft);
        for (auto Group : AllTheftGroups)
        {
            auto SEG = Cast<UAIGroup_StateEvent>(Group);
            if (!IsValid(SEG))
                continue;
            if (!SEG.TargetedCharacterStates.Contains(ThiefCharacterState))
                continue;

            for (auto Member : SEG.JoinedCharacters)
            {
                if (!IsValid(Member) || !IsValid(Member.CharacterState))
                    continue;
                if (Member.CharacterState == CharacterState)
                    continue;

                auto MemberAI = Cast<UGameplayAbility_CharacterAI_Gothic>(Member.CharacterState.AI);
                if (!IsValid(MemberAI))
                    continue;

                auto MemberTheftState = Cast<UAIState_Warning_Crime_Human_Theft>(MemberAI.CurrentState);
                if (!IsValid(MemberTheftState))
                    continue;

                if (MemberTheftState.bPickingUpStuff || !MemberTheftState.ItemPickupQueue.IsEmpty())
                    return true;
            }
        }
        return false;
    }

    /**
     * Hold compliance timeout while a return/bribe/exchange pickup is pending or active.
     * Resume with the previously remaining time once pickup work is done.
     * Also propagates hold/resume to every other Warning_Theft state in the same group so
     * an NPC called in by another does not time out while the the other is picking up the item.
     */
    void UpdateComplianceHoldState()
    {
        bool bShouldHold = bPickingUpStuff || !ItemPickupQueue.IsEmpty();
        if (bShouldHold)
        {
            if (!bComplianceOnHold)
            {
                float Remaining = ComplianceDeadline.AgeInRealtimeSeconds;
                ComplianceSecondsRemainingWhenHeld = Math::Max(0.0f, -Remaining);
                bComplianceOnHold = true;
                PropagateComplianceHoldToGroupMembers(bHold = true);
            }
            return;
        }

        if (bComplianceOnHold && AnyWarningTheftGroupPeerNeedsComplianceHold())
            return;

        if (!bComplianceOnHold)
            return;

        float ResumeSeconds = Math::Max(0.5f, ComplianceSecondsRemainingWhenHeld);
        ComplianceDeadline = FInGameTime::XRealtimeSecondsFromNow(ResumeSeconds);
        bComplianceOnHold = false;
        ComplianceSecondsRemainingWhenHeld = 0.0f;
        PropagateComplianceHoldToGroupMembers(bHold = false);
    }

    /** Iterate the active Warning_Theft group containing this state and hold/resume all other members. */
    void PropagateComplianceHoldToGroupMembers(bool bHold)
    {
        if (!IsValid(ThiefCharacterState))
            return;

        auto AllTheftGroups = UGothicAIGroup::GetAllActiveGroupsOfClass(UAIGroup_Warning_Theft);
        for (auto Group : AllTheftGroups)
        {
            auto SEG = Cast<UAIGroup_StateEvent>(Group);
            if (!IsValid(SEG))
                continue;
            if (!SEG.TargetedCharacterStates.Contains(ThiefCharacterState))
                continue;

            for (auto Member : SEG.JoinedCharacters)
            {
                if (!IsValid(Member) || !IsValid(Member.CharacterState))
                    continue;
                if (Member.CharacterState == CharacterState)
                    continue;

                auto MemberAI = Cast<UGameplayAbility_CharacterAI_Gothic>(Member.CharacterState.AI);
                if (!IsValid(MemberAI))
                    continue;

                auto MemberTheftState = Cast<UAIState_Warning_Crime_Human_Theft>(MemberAI.CurrentState);
                if (!IsValid(MemberTheftState))
                    continue;

                if (bHold)
                    MemberTheftState.HoldComplianceTimer();
                else
                    MemberTheftState.ResumeComplianceTimer();
            }
        }
    }

    void OnItemPickedUp(Warning_Crime_Theft::FItemPickupHandle ItemPickupHandle)
    {
        // Returned stolen item: forgive and exit.
        if (ItemPickupHandle.Reason == Warning_Crime_Theft::EItemPickupReason::Return &&
            ItemPickupHandle.Class == StolenItemDefaultObject.Class)
        {
            AI.Say(GameplayTag::Sound_Voice_Reaction_Crime_WiseMove, EPerceptionNoiseLoudness::Moderate, ItemPickupHandle.DroppedBy.Character);
            ForgiveTheft();
            ExitWarningAfterReturn();
            return;
        }

        // If there are still items to pick up, do nothing.
        if (!ItemPickupQueue.IsEmpty())
            return;

        // Bribe or exchange: suppress or forgive and exit.
        switch (ItemPickupHandle.Reason)
        {
            case Warning_Crime_Theft::EItemPickupReason::Bribe:
            {
                AI.Say(GameplayTag::Sound_Voice_Mumble_Idle_Whistle, EPerceptionNoiseLoudness::Moderate, ItemPickupHandle.DroppedBy.Character);
                SuppressTheft();
                ExitWarningAfterReturn();
                break;
            }
            case Warning_Crime_Theft::EItemPickupReason::Exchange:
            {
                AI.CharacterState.Voiceline.SayVoicelineWithContext(
                    GameplayTag::Sound_Voice_Reaction_Crime_Thief_OkayToo, ItemPickupHandle.DroppedBy,
                    WarningVoicelineContext,
                    EPerceptionNoiseLoudness::Moderate);
                ForgiveTheft();
                ExitWarningAfterReturn();
                break;
            }
            default:
            {
                break;
            }
        }
    }

    void SuppressTheft()
    {
        UCrimeProcessingSubsystem CrimeProcessingSubsystem = AI.CrimeProcessingSubsystem;
        CrimeProcessingSubsystem.SuppressWitnessRelativeCrimes(AI.CharacterState, ThiefCharacterState, GameplayTag::Crime_Theft, bLatestOnly = true);
    }

    void CleanupWitnessAfterTheftForgive(AGothicCharacterState Witness, AGothicCharacterState Criminal)
    {
        if (!IsValid(Witness) || !IsValid(Criminal))
            return;

        // Mirror the generic forgiveness response cleanup so forgiven witnesses drop stale conflict memory.
        auto Memories = Witness.LongTermMemory.GetLongTermMemoriesMatching(
            GameplayTag::Memory_WasInPartyBeforeConflict,
            Witness,   // Instigator (Self)
            Criminal   // Affected (Target)
        );
        if (Memories.Num() > 0)
        {
            Witness.JoinPartyOf(Criminal);

            FMemoryFilter RejoinFilter = Witness.LongTermMemory.FilterEventsCausedByMe(GameplayTag::Memory_WasInPartyBeforeConflict)
                .Affecting(Criminal.CharacterGlobalId);
            Witness.LongTermMemory.ForgetEventsMatchingFilter(RejoinFilter);
        }

        FMemoryFilter CombatFilter = Witness.LongTermMemory.FilterEventsAffectingMe(GameplayTag::Memory_Combat_WasDamaged)
            .CausedBy(Criminal.CharacterGlobalId);
        Witness.LongTermMemory.ForgetEventsMatchingFilter(CombatFilter);
    }

    /**
     * Force another witness to peacefully leave their independent Warning_Theft state
     * when this NPC has forgiven the thief. A Guard's own crime memory is typically empty because
     * they were called in via AIEvent_Guard_ConfrontedCriminalAtCrimeScene handoff, so ForgiveCrimesRelevantToWitness
     * is a no-op and their compliance deadline would still escalate to combat.
     */
    void ForcePeacefulExitOfTheftWarningFor(AGothicCharacterState OtherWitness, AGothicCharacterState Criminal)
    {
        if (!IsValid(OtherWitness) || !IsValid(Criminal))
            return;
        if (OtherWitness == CharacterState)
            return; // Self handles its own exit in ExitWarningAfterReturn.

        auto OtherAI = Cast<UGameplayAbility_CharacterAI_Gothic>(OtherWitness.AI);
        if (!IsValid(OtherAI))
            return;

        auto OtherTheftState = Cast<UAIState_Warning_Crime_Human_Theft>(OtherAI.CurrentState);
        if (IsValid(OtherTheftState) && OtherTheftState.ThiefCharacterState == Criminal)
        {
            OtherTheftState.ExitWarningAfterReturn();
        }
    }

    void ForgiveTheft()
    {
        UCrimeProcessingSubsystem CrimeProcessingSubsystem = AI.CrimeProcessingSubsystem;
        if (!IsValid(CrimeProcessingSubsystem) || !IsValid(ThiefCharacterState))
            return;

        CrimeProcessingSubsystem.ForgiveCrimesRelevantToWitness(AI.CharacterState, ThiefCharacterState, GameplayTag::Crime_Theft, bLatestOnly = true);
        CleanupWitnessAfterTheftForgive(AI.CharacterState, ThiefCharacterState);

        // Every active theft-warning group that targets this thief (guard may be in a different instance than the victim).
        auto AllTheftGroups = UGothicAIGroup::GetAllActiveGroupsOfClass(UAIGroup_Warning_Theft);
        for (auto Group : AllTheftGroups)
        {
            auto SEG = Cast<UAIGroup_StateEvent>(Group);
            if (!IsValid(SEG))
                continue;
            if (!SEG.TargetedCharacterStates.Contains(ThiefCharacterState))
                continue;

            auto TheftGroupMembersSnapshot = SEG.JoinedCharacters;
            for (auto Member : TheftGroupMembersSnapshot)
            {
                if (!IsValid(Member) || !IsValid(Member.CharacterState))
                    continue;
                if (Member.CharacterState == ThiefCharacterState)
                    continue;

                CrimeProcessingSubsystem.ForgiveCrimesRelevantToWitness(Member.CharacterState, ThiefCharacterState, GameplayTag::Crime_Theft, bLatestOnly = true);
                CleanupWitnessAfterTheftForgive(Member.CharacterState, ThiefCharacterState);
                ForcePeacefulExitOfTheftWarningFor(Member.CharacterState, ThiefCharacterState);
            }
        }

        // Guards who already left UAIGroup_Warning_Theft may still share a conflict instance with the thief.
        auto AllConflicts = UGothicAIGroup::GetAllActiveGroupsOfClass(UAIGroup_ConflictInstance);
        for (auto CGroup : AllConflicts)
        {
            if (!IsValid(CGroup))
                continue;

            bool bThiefInThisConflict = false;
            auto ConflictMembersSnapshot = CGroup.JoinedCharacters;
            for (auto M : ConflictMembersSnapshot)
            {
                if (IsValid(M) && IsValid(M.CharacterState) && M.CharacterState == ThiefCharacterState)
                {
                    bThiefInThisConflict = true;
                    break;
                }
            }
            if (!bThiefInThisConflict)
                continue;

            for (auto M : ConflictMembersSnapshot)
            {
                if (!IsValid(M) || !IsValid(M.CharacterState))
                    continue;
                if (M.CharacterState == ThiefCharacterState)
                    continue;
                if (!M.HasGameplayTag(GameplayTag::CampRole_Guard))
                    continue;

                CrimeProcessingSubsystem.ForgiveCrimesRelevantToWitness(M.CharacterState, ThiefCharacterState, GameplayTag::Crime_Theft, bLatestOnly = true);
                CleanupWitnessAfterTheftForgive(M.CharacterState, ThiefCharacterState);
                ForcePeacefulExitOfTheftWarningFor(M.CharacterState, ThiefCharacterState);
            }
        }
    }

    void ExitWarningAfterReturn()
    {
        if (bHasExitedWarning)
            return;
        bHasExitedWarning = true;
        bPickingUpStuff = false;
        PickUpTask = nullptr;
        ClearActivePickupTargetTracking();
        AI.LeaveGroupsWithClass(UAIGroup_Warning_Base);
        AI.LeaveGroupsWithClass(UAIGroup_ConflictInstance);
        AI.UpdateCrimeSeverityTowardsPlayer();
        AI.SwitchToDailyRoutine();
    }

    void SelectWarningCharacterOfInterest() override
    {
        AGothicCharacter WarningCharacterOfInterest = nullptr;

        if (IsValid(ThiefCharacterState))
        {
            for (auto OtherCharacter : AI.GetSensedLivingHostiles())
            {
                if (!IsValid(OtherCharacter))
                    continue;
                if (OtherCharacter.CharacterState != ThiefCharacterState)
                    continue;
                WarningCharacterOfInterest = OtherCharacter;
                break;
            }
        }

        if (!IsValid(WarningCharacterOfInterest) && IsValid(CharacterOfInterest) &&
            IsValid(ThiefCharacterState) && CharacterOfInterest.CharacterState == ThiefCharacterState)
        {
            if (AI.Character.Perception.CanSee(CharacterOfInterest))
            {
                WarningCharacterOfInterest = CharacterOfInterest;
            }
            else
            {
                if (bCharacterOfInterestVisible)
                {
                    TimeLastCharacterOfInterestWasVisible = FInGameTime::Now();
                }

                bCharacterOfInterestVisible = false;

                if (MaximumTimeSecondsWithoutVisibleHostile >= TimeLastCharacterOfInterestWasVisible.AgeInRealtimeSeconds)
                {
                    WarningCharacterOfInterest = CharacterOfInterest;
                }
            }
        }

        bool bHadTarget = IsValid(CharacterOfInterest);
        CharacterOfInterest = WarningCharacterOfInterest;

        if (bHadTarget && !IsValid(CharacterOfInterest))
        {
            EmitEscalationEvent(GameplayTag::AIEvent_Crime_Theft_WarningFledAway);
            return;
        }

        if (!IsValid(CharacterOfInterest))
            return;

        if (!AI.Character.Perception.CanSee(CharacterOfInterest))
            return;

        bCharacterOfInterestVisible = true;
        // Avoid TargetCharacterOfInterest vs StopTargetingEnemy oscillation while pickup task moves the NPC.
        if (bPickingUpStuff)
        {
            return;
        }
        AI.TargetCharacterOfInterest(FocusPriority, this);
    }

    void DoInLoopIfCharacterNotStillWarning() override
    {
        if (bHasExitedWarning)
            return;

        Super::DoInLoopIfCharacterNotStillWarning();

        if (!bPickingUpStuff && IsValid(CharacterOfInterest))
        {
            AI.TargetCharacterOfInterest(FocusPriority, this);
        }
        else
        {
            AI.StopTargetingEnemy(FocusPriority);
        }

        UpdatePrudentFollow();

        // Play InsistGiveBack if it's time.
        if (bInsistGiveBackPending && TimeForInsistGiveBack.IsTimeInThePast())
        {
            bInsistGiveBackPending = false;
            if (AI.CharacterState.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Reaction_Warning_Thief_InsistGiveBack))
                AI.CharacterState.Voiceline.SayVoicelineWithContext(
                    GameplayTag::Sound_Voice_Reaction_Warning_Thief_InsistGiveBack,
                    IsValid(CharacterOfInterest) ? CharacterOfInterest.CharacterState : nullptr,
                    WarningVoicelineContext,
                    EPerceptionNoiseLoudness::Loud);
        }

        // Play InsistGiveBack again if it's in the half-life of the compliance deadline.
        if (bHalfLifeInsistPending && TimeForHalfLifeInsist.IsTimeInThePast())
        {
            bHalfLifeInsistPending = false;
            if (!bInsistGiveBackPending &&
                IsValid(CharacterOfInterest) &&
                AI.CharacterState.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Reaction_Warning_Thief_InsistGiveBack))
            {
                AI.CharacterState.Voiceline.SayVoicelineWithContext(
                    GameplayTag::Sound_Voice_Reaction_Warning_Thief_InsistGiveBack, 
                    IsValid(CharacterOfInterest) ? CharacterOfInterest.CharacterState : nullptr,
                    WarningVoicelineContext,
                    EPerceptionNoiseLoudness::Loud);
            }
        }

        EvaluateFleeLeash();
        if (bHasExitedWarning)
            return;

        UpdateComplianceHoldState();

        // Compliance timeout: emit WarningTimedOut.
        if (!bComplianceOnHold && ComplianceDeadline.IsTimeInThePast())
        {
            EmitEscalationEvent(GameplayTag::AIEvent_Crime_Theft_WarningTimedOut);
            return;
        }

        GoPickUpItem();
    }

    void UpdatePrudentFollow()
    {
        if (bPickingUpStuff)
        {
            // Pickup task has its own movement; stop the follow so we don't fight it.
            AI.StopFollowingActor();
            return;
        }

        if (!IsValid(CharacterOfInterest))
            return;

        float Reach   = IsValid(Tuning) ? Tuning.PrudentFollowDistanceCm       : 500.0f;
        float Sprint  = IsValid(Tuning) ? Tuning.PrudentFollowSprintDistanceCm  : 1200.0f;
        AI.StartFollowingActor(CharacterOfInterest, Reach, true, Sprint);
    }

    void EvaluateFleeLeash()
    {
        // If we're picking up stuff, don't evaluate the flee leash.
        if (bPickingUpStuff)
            return;

        if (!IsValid(Tuning))
            return;

        // Track LoS transitions.
        bool bVisibleNow = IsValid(CharacterOfInterest) && AI.Character.Perception.CanSee(CharacterOfInterest);
        if (bWasVisibleLastTick && !bVisibleNow)
            TimeLoSFirstLost = FInGameTime::Now();
        bWasVisibleLastTick = bVisibleNow;
        float LoSLostSec = bVisibleNow ? 0.0f : TimeLoSFirstLost.AgeInRealtimeSeconds;

        // Distance the thief is from the original theft position.
        float DistFromTheft = MAX_flt;
        if (IsValid(ThiefCharacterState) && IsValid(ThiefCharacterState.Character))
            DistFromTheft = ThiefCharacterState.Character.ActorLocation.Distance(OriginalTheftLocation);

        // Peaceful suppress-exit takes precedence: thief truly got away and is far enough.
        if (LoSLostSec >= Tuning.LoSLostSecondsForSuppress &&
            DistFromTheft >= Tuning.FleeDistanceForSuppress)
        {
            SuppressTheft();
            ExitWarningAfterReturn();
            return;
        }

        // Combat-chase exit: thief ran far enough from the scene, or broke LoS enough time.
        if (DistFromTheft >= Tuning.FleeDistanceForCombat ||
            LoSLostSec    >= Tuning.LoSLostSecondsForCombat)
        {
            EmitEscalationEvent(GameplayTag::AIEvent_Crime_Theft_WarningFledAway);
        }
    }

    private void ClearActivePickupTargetTracking()
    {
        bHaveActivePickupTargetWorldLocation = false;
        ActivePickupTargetWorldLocation = FVector::ZeroVector;
        ActivePickupTargetItemClass = nullptr;
    }

    void GoPickUpItem()
    {
        if (bHasExitedWarning)
            return;

        if (ItemPickupQueue.IsEmpty())
                return;

        auto ItemHandle = ItemPickupQueue[0];
        // Invalid world actor: must dequeue or we never hit compliance timeout (queue stuck non-empty).
        if (!ItemHandle.Class.IsValid() || !IsValid(ItemHandle.ItemVisualWorld))
        {
            bool bOurTaskSucceeded = IsValid(PickUpTask) && PickUpTask.HasBeenActivated() &&
                PickUpTask.TaskResult == EGenericTaskResult::Success;
            if (bOurTaskSucceeded)
            {
                ItemPickupQueue.RemoveAt(0);
                PickUpTask = nullptr;
                bPickingUpStuff = false;
                OnItemPickedUp(ItemHandle);
                return;
            }

            bool bBribeOrExchange = ItemHandle.Reason == Warning_Crime_Theft::EItemPickupReason::Bribe ||
                ItemHandle.Reason == Warning_Crime_Theft::EItemPickupReason::Exchange;
            if (bBribeOrExchange && bHaveActivePickupTargetWorldLocation && ItemHandle.Class.IsValid() &&
                ItemHandle.Class == ActivePickupTargetItemClass)
            {
                float BribeStaleAcceptRadiusCm = IsValid(Tuning) ? Tuning.BribeStaleAcceptRadiusCm : 550.0f;
                float DistToDrop = Self.GetFeetLocation().Distance(ActivePickupTargetWorldLocation);
                if (DistToDrop <= BribeStaleAcceptRadiusCm)
                {
                    ItemPickupQueue.RemoveAt(0);
                    PickUpTask = nullptr;
                    bPickingUpStuff = false;
                    OnItemPickedUp(ItemHandle);
                    return;
                }
            }

            bool bHeadClassIsStolenItem = ItemHandle.Class.IsValid() && IsValid(StolenItemDefaultObject) &&
                ItemHandle.Class.GetDefaultObject() == StolenItemDefaultObject;
            ItemPickupQueue.RemoveAt(0);
            if (ItemHandle.Reason == Warning_Crime_Theft::EItemPickupReason::Return &&
                bHeadClassIsStolenItem)
            {
                if (IsValid(ItemHandle.DroppedBy) && IsValid(ItemHandle.DroppedBy.Character))
                    AI.Say(GameplayTag::Sound_Voice_Reaction_Crime_WiseMove, EPerceptionNoiseLoudness::Moderate, ItemHandle.DroppedBy.Character);
                ForgiveTheft();
                ExitWarningAfterReturn();
            }
            else
            {
                bPickingUpStuff = false;
                PickUpTask = nullptr;
                ClearActivePickupTargetTracking();
            }
            return;
        }

        if (Self.CanWalk())
        {
            if (!bPickingUpStuff)
            {
                bPickingUpStuff = true;
                ActivePickupTargetWorldLocation = ItemHandle.ItemVisualWorld.ActorLocation;
                bHaveActivePickupTargetWorldLocation = true;
                ActivePickupTargetItemClass = ItemHandle.Class;

                if (!IsValid(PickUpTaskTemplate))
                {
                    PickUpTaskTemplate = UAITask_PickUpItem();
                }

                PickUpTaskTemplate.ItemClass = ItemHandle.Class;
                PickUpTaskTemplate.Location = ItemHandle.ItemVisualWorld.ActorLocation;
                PickUpTaskTemplate.Item = ItemHandle.ItemVisualWorld;

                PickUpTask = Cast<UAITask_PickUpItem>(PickUpTaskTemplate.DuplicateTask(AI, this));
                PickUpTask.ReadyForActivation();
            }

            if (PickUpTask == nullptr)
                return;

            if (!PickUpTask.HasBeenActivated() || !PickUpTask.IsFinished())
                return;

            if (PickUpTask.TaskResult == EGenericTaskResult::Success)
            {
                ItemPickupQueue.RemoveAt(0);
                OnItemPickedUp(ItemHandle);
            }
            else if (PickUpTask.TaskResult == EGenericTaskResult::Failed && !IsValid(ItemHandle.ItemVisualWorld))
            {
                bool bFailClassIsStolenItem = ItemHandle.Class.IsValid() && IsValid(StolenItemDefaultObject) &&
                    ItemHandle.Class.GetDefaultObject() == StolenItemDefaultObject;
                ItemPickupQueue.RemoveAt(0);
                if (ItemHandle.Reason == Warning_Crime_Theft::EItemPickupReason::Return &&
                    bFailClassIsStolenItem)
                {
                    if (IsValid(ItemHandle.DroppedBy) && IsValid(ItemHandle.DroppedBy.Character))
                        AI.Say(GameplayTag::Sound_Voice_Reaction_Crime_WiseMove, EPerceptionNoiseLoudness::Moderate, ItemHandle.DroppedBy.Character);
                    ForgiveTheft();
                    ExitWarningAfterReturn();
                    return;
                }
            }

            PickUpTask = nullptr;            
            bPickingUpStuff = false;
        }
    }

    void EmitEscalationEvent(FGameplayTag EventTag)
    {
        // If the thief is defeated or dead, forgive the crime and exit the warning.
        if (IsValid(ThiefCharacterState) && (ThiefCharacterState.IsDefeated() || ThiefCharacterState.IsDead()))
        {
            // Defer theft + pickpocket-success forgiveness to GA_Human_Loot reclaim pass.
            // Forgiving here would clobber bIsForgiven globally and prevent any looter
            // (incl. the alive personal victim) from reclaiming items.
            if (IsValid(AI) && IsValid(AI.CrimeProcessingSubsystem))
                AI.CrimeProcessingSubsystem.ForgiveCrimesRelevantToWitness(AI.CharacterState, ThiefCharacterState, FGameplayTag::Empty, false, bSkipTheftAndPickpocketSuccessForLootReclaim = true);
            AI.LeaveGroupsWithClass(UAIGroup_Warning_Base);
            AI.LeaveGroupsWithClass(UAIGroup_ConflictInstance);
            AI.UpdateCrimeSeverityTowardsPlayer();
            AI.SwitchToDailyRoutine();
            return;
        }

        FRememberedPerception Perception;
        Perception.Instigator.CharacterState = ThiefCharacterState;
        if (IsValid(ThiefCharacterState))
            Perception.Instigator.Character = ThiefCharacterState.Character;
        AI.AssessEvent(EventTag, Perception);
        bEndAssessmentDone = true;
    }
}

UCLASS()
class UAITask_PickUpItem : UGothicCharacterAITask
{
    UAITask_PickUpItem(TSubclassOf<UItemDefinition> InItemClass, FVector InLocation, AItemVisualWorld InItem = nullptr)
    {
        ItemClass = InItemClass;
        Location = InLocation;
        Item = InItem;
    }

    UPROPERTY()
    TSubclassOf<UItemDefinition> ItemClass;

    UPROPERTY()
    FVector Location = FVector::ZeroVector;

    UPROPERTY()
    AItemVisualWorld Item = nullptr;

    UFUNCTION(BlueprintOverride)
    void DoTask()
    {
        if (!IsValid(ItemClass) || Location.IsZero())
        {
            EndTaskAsFailure();
            return;
        }

        int Count = AI.CharacterState.Inventory.CountItemsOfClass(ItemClass);

        AI.TurnToPosition(Location);
        AI.WaitSeconds(0.75f);

        if (IsValid(Item))
            AI.PickUpSpecificItem(Item);
        else
            AI.FindAndPickUpItem(ItemClass, Location);

        AI.WaitSeconds(0.2f);

        int CountAfter = AI.CharacterState.Inventory.CountItemsOfClass(ItemClass);

        if (CountAfter == Count)
        {
            EndTaskAsFailure();
            return;
        }

        EndTaskAsSuccess();
    }
}

UCLASS()
class UAIState_Warning_Crime_Human_Pickpocket : UAIState_Warning_Crime_Human
{
    default OwnedGameplayTags.AddTag(GameplayTag::AIState_Conflict_Warning_Pickpocket);
    default AIStateTag = GameplayTag::AIState_Conflict_Warning_Pickpocket;
    default StateGroupClass = UAIGroup_Warning_Threat;

    default DefaultWarningVoicelineTag = GameplayTag::Sound_Voice_Reaction_Crime_Thief_HandsOff;

    AGothicCharacterState ThiefCharacterState;

    UCrimeTuningConfig_Pickpocket Tuning;
    FInGameTime ComplianceDeadline;

    FInGameTime TimeLoSFirstLost;
    bool bWasVisibleLastTick = true;

    bool bHasExitedWarning = false;

    FString GetDisplayName() const override
    {
        return "Pickpocket - Human Warning";
    }

    bool ShouldFollowCharacterOfInterestWhenNotVisible() const override
    {
        return false;
    }

    float GetForwardDotTowardsThiefFeet() const
    {
        if (!IsValid(CharacterOfInterest))
            return 1.0f;
        FVector ToThief = (CharacterOfInterest.GetFeetLocation() - Self.GetFeetLocation()).GetSafeNormal2D();
        if (ToThief.IsNearlyZero())
            return 1.0f;
        return Self.ActorForwardVector.GetSafeNormal2D().DotProduct(ToThief);
    }

    float GetSkipTurnForwardDotThreshold() const
    {
        if (IsValid(Tuning))
            return Tuning.SkipTurnTowardsThiefIfForwardDotAbove;
        return 0.94f;
    }

    bool ShouldIssueTurnTowardsPickpocketThief() const
    {
        return GetForwardDotTowardsThiefFeet() < GetSkipTurnForwardDotThreshold();
    }

    void AfterSelectWarningCharacterOfInterest() override
    {
        if (bHasExitedWarning)
            return;
        if (!IsValid(CharacterOfInterest))
            return;
        if (!ShouldIssueTurnTowardsPickpocketThief())
            return;
        AI.TurnToCharacter(CharacterOfInterest);
    }

    bool ShouldUseWeapon() override
    {
        if (IsValid(Tuning))
            return Tuning.bUseWeapon && CanEquipWeapons();
        return false;
    }

    void BeginWarning() override
    {
        Tuning = AI.CrimeProcessingSubsystem.PickpocketTuning;

        float IntroDist = 200.0f;
        float IntroTimeLimit = 3.0f;
        if (IsValid(Tuning))
        {
            NumWarningsBeforeCombat = Tuning.NumWarningsBeforeCombat;
            InitialMinimumDistance = Tuning.MinimumDistance;
            ThreatApproachedTooMuchDistance = Tuning.ThreatApproachedTooMuchDistance;
            ThreatGoneDistance = Tuning.ThreatGoneDistanceThreshold;
            bRequireHostiles = Tuning.bRequireHostiles;
            bRequireAwarenessOfInitialTarget = Tuning.bRequireAwarenessOfInitialTarget;
            IntroDist = Tuning.IntroRetreatDistance;
            IntroTimeLimit = Tuning.IntroRetreatTimeLimitSeconds;
        }

        InitialTarget = CharacterOfInterest;

        // Disable base TooClose / Threat_IsTooClose until intro done; proximity uses tuning + custom check.
        TooCloseDistance = MAX_flt;

        // Retreat from thief, then face using locomotion-friendly turns.
        if (IsValid(CharacterOfInterest))
        {
            SetWalkSpeed(EWalkSpeed::Walking);
            FVector ThiefFeet = CharacterOfInterest.GetFeetLocation();
            FVector SelfFeet = Self.GetFeetLocation();
            FVector DirAway = (SelfFeet - ThiefFeet).GetSafeNormal2D();
            if (!DirAway.IsNearlyZero())
            {
                if (AI.Self.CanStrafe())
                    AI.GoIntoDirection(DirAway, 600.0f, TimeLimitSeconds = IntroTimeLimit, MinimumMoveDistance = IntroDist);
                else
                    AI.DodgeAwayFromTarget();
            }

            FInGameTime FaceDeadline = FInGameTime::XRealtimeSecondsFromNow(IntroTimeLimit + 1.0f);
            while (IsValid(CharacterOfInterest))
            {
                if (FaceDeadline.IsTimeInThePast())
                    break;
                if (Self.IsFacingOtherCharacter(CharacterOfInterest))
                    break;
                if (GetForwardDotTowardsThiefFeet() >= GetSkipTurnForwardDotThreshold())
                    break;
                AI.TurnToCharacter(CharacterOfInterest);
                WaitOneTick();
            }
        }

        Super::BeginWarning();

        // Keep base distance checks from firing spurious Threat_IsTooClose for unarmed thief.
        TooCloseDistance = MAX_flt;

        EnableStrafeMovementAndTurnToTargetMode();

        ThiefCharacterState = RememberedPerception.Instigator.CharacterState;

        float ComplianceSeconds = IsValid(Tuning) ? Tuning.WarningComplianceSeconds : 15.0f;
        ComplianceDeadline = FInGameTime::XRealtimeSecondsFromNow(ComplianceSeconds);
    }

    void DoInLoopIfCharacterNotStillWarning() override
    {
        if (bHasExitedWarning)
            return;

        Super::DoInLoopIfCharacterNotStillWarning();

        EvaluatePickpocketWarningTransitions();
    }

    void EvaluatePickpocketWarningTransitions()
    {
        if (bHasExitedWarning || !IsValid(Tuning))
            return;

        // Post-intro proximity → combat (AIARM handles fists / execute marker).
        if (IsValid(CharacterOfInterest) && _bBeginWarningFinished)
        {
            float ProxGap = Tuning.ProximityEscalateDistance;
            if (Self.GetFeetLocation().Distance(CharacterOfInterest.GetFeetLocation())
                <= ProxGap + Self.SimpleCollisionRadius + CharacterOfInterest.SimpleCollisionRadius)
            {
                EmitEscalationEvent(GameplayTag::AIEvent_Crime_Pickpocket_WarningTimedOut);
                return;
            }
        }

        EvaluatePickpocketPeacefulAndSuppress();
    }

    void EvaluatePickpocketPeacefulAndSuppress()
    {
        if (!IsValid(Tuning) || bHasExitedWarning)
            return;

        bool bVisibleNow = IsValid(CharacterOfInterest) && AI.Character.Perception.CanSee(CharacterOfInterest);
        if (bWasVisibleLastTick && !bVisibleNow)
            TimeLoSFirstLost = FInGameTime::Now();
        bWasVisibleLastTick = bVisibleNow;
        float LoSLostSec = bVisibleNow ? 0.0f : TimeLoSFirstLost.AgeInRealtimeSeconds;

        float DistVictimThief = MAX_flt;
        if (IsValid(CharacterOfInterest))
            DistVictimThief = Self.GetFeetLocation().Distance(CharacterOfInterest.GetFeetLocation());

        if (LoSLostSec >= Tuning.LoSLostSecondsForSuppress &&
            DistVictimThief >= Tuning.FleeDistanceForSuppress)
        {
            SuppressPickpocket();
            ExitWarningPeacefully();
            return;
        }

        if (DistVictimThief >= Tuning.PeacefulEndDistanceFromVictim)
        {
            ExitWarningPeacefully();
            return;
        }

        if (!bVisibleNow && LoSLostSec >= Tuning.PeacefulEndLoSGraceSeconds)
        {
            ExitWarningPeacefully();
            return;
        }

        if (ComplianceDeadline.IsTimeInThePast())
        {
            ExitWarningPeacefully();
            return;
        }
    }

    void SuppressPickpocket()
    {
        if (!IsValid(AI.CrimeProcessingSubsystem) || !IsValid(ThiefCharacterState))
            return;
        AI.CrimeProcessingSubsystem.SuppressWitnessRelativeCrimes(AI.CharacterState, ThiefCharacterState, GameplayTag::Crime_Pickpocket, bLatestOnly = true);
    }

    void ExitWarningPeacefully()
    {
        if (bHasExitedWarning)
            return;
        bHasExitedWarning = true;
        DisableStrafeMovementAndTurnToTargetMode();
        AI.LeaveGroupsWithClass(UAIGroup_Warning_Base);
        AI.LeaveGroupsWithClass(UAIGroup_ConflictInstance);
        AI.UpdateCrimeSeverityTowardsPlayer();
        AI.SwitchToDailyRoutine();
    }

    void EmitEscalationEvent(FGameplayTag EventTag)
    {
        // If the thief is defeated or dead, forgive the crime and exit peacefully.
        if (IsValid(ThiefCharacterState) && (ThiefCharacterState.IsDefeated() || ThiefCharacterState.IsDead()))
        {
            // Defer theft + pickpocket-success forgiveness to GA_Human_Loot reclaim pass.
            if (IsValid(AI) && IsValid(AI.CrimeProcessingSubsystem))
                AI.CrimeProcessingSubsystem.ForgiveCrimesRelevantToWitness(AI.CharacterState, ThiefCharacterState, FGameplayTag::Empty, false, bSkipTheftAndPickpocketSuccessForLootReclaim = true);
            ExitWarningPeacefully();
            return;
        }

        DisableStrafeMovementAndTurnToTargetMode();

        FRememberedPerception Perception;
        Perception.Instigator.CharacterState = ThiefCharacterState;
        if (IsValid(ThiefCharacterState))
            Perception.Instigator.Character = ThiefCharacterState.Character;
        AI.AssessEvent(EventTag, Perception);
        bEndAssessmentDone = true;
    }
}

/**
 * Creeping warning (enforcer-only escalation from observe to a fists-out warning).
 */
UCLASS()
class UAIState_Warning_Crime_Human_Creeping : UAIState_Warning_Crime_Human
{
    default OwnedGameplayTags.AddTag(GameplayTag::AIState_Conflict_Warning_Creeping);
    default AIStateTag = GameplayTag::AIState_Conflict_Warning_Creeping;
    default StateGroupClass = UAIGroup_Warning_Threat;

    default DefaultWarningVoicelineTag = GameplayTag::Sound_Voice_Reaction_Warning;

    AGothicCharacterState CreeperCharacterState;

    UCrimeTuningConfig_Creeping Tuning;

    FInGameTime BeatUpDeadline;

    FInGameTime TimeLoSFirstLost;
    bool bWasVisibleLastTick = true;

    bool bHasExitedWarning = false;
    bool bHasEmittedEscalation = false;

    FString GetDisplayName() const override
    {
        return "Creeping - Human Warning";
    }

    bool ShouldFollowCharacterOfInterestWhenNotVisible() const override
    {
        return false;
    }

    bool ShouldUseWeapon() override
    {
        return CanEquipWeapons();
    }

    float GetForwardDotTowardsCriminal() const
    {
        if (!IsValid(CharacterOfInterest))
            return 1.0f;
        FVector ToCriminal = (CharacterOfInterest.GetFeetLocation() - Self.GetFeetLocation()).GetSafeNormal2D();
        if (ToCriminal.IsNearlyZero())
            return 1.0f;
        return Self.ActorForwardVector.GetSafeNormal2D().DotProduct(ToCriminal);
    }

    bool ShouldIssueTurnTowardsCriminal() const
    {
        float Threshold = IsValid(Tuning) ? Tuning.SkipTurnTowardsCriminalForwardDot : 0.6f;
        return GetForwardDotTowardsCriminal() < Threshold;
    }

    void AfterSelectWarningCharacterOfInterest() override
    {
        if (bHasExitedWarning)
            return;
        if (!IsValid(CharacterOfInterest))
            return;
        if (!ShouldIssueTurnTowardsCriminal())
            return;
        AI.TurnToCharacter(CharacterOfInterest);
    }

    void BeginWarning() override
    {
        Tuning = AI.CrimeProcessingSubsystem.CreepingTuning;

        InitialTarget = CharacterOfInterest;

        if (IsValid(Tuning))
        {
            NumWarningsBeforeCombat = Tuning.NumWarningsBeforeCombat;
            InitialMinimumDistance = Tuning.MinimumDistance;
            ThreatApproachedTooMuchDistance = Tuning.ThreatApproachedTooMuchDistance;
            ThreatGoneDistance = Tuning.ThreatGoneDistanceThreshold;
            bRequireHostiles = false;
            bRequireAwarenessOfInitialTarget = true;
        }

        TooCloseDistance = MAX_flt;

        Super::BeginWarning();

        EnableStrafeMovementAndTurnToTargetMode();

        CreeperCharacterState = RememberedPerception.Instigator.CharacterState;

        float BeatUpSeconds = IsValid(Tuning) ? Tuning.WarningSecondsBeforeBeatUp : 5.0f;
        BeatUpDeadline = FInGameTime::XRealtimeSecondsFromNow(BeatUpSeconds);
    }

    bool IsCreeperCrouching() const
    {
        if (!IsValid(CreeperCharacterState))
            return false;
        return CreeperCharacterState.HasGameplayTag(GameplayTag::State_Movement_Crouching);
    }

    void DoInLoopIfCharacterNotStillWarning() override
    {
        if (bHasExitedWarning)
            return;

        Super::DoInLoopIfCharacterNotStillWarning();

        EvaluateCreepingWarningTransitions();
    }

    void EvaluateCreepingWarningTransitions()
    {
        if (bHasExitedWarning || bHasEmittedEscalation || !IsValid(Tuning))
            return;

        if (_bBeginWarningFinished && BeatUpDeadline.IsTimeInThePast())
        {
            EmitEscalationEvent(GameplayTag::AIEvent_Crime_Creeping_WarningTimedOut);
            return;
        }

        EvaluateCreepingPeaceful();
    }

    void EvaluateCreepingPeaceful()
    {
        if (!IsValid(Tuning) || bHasExitedWarning)
            return;

        if (!IsCreeperCrouching())
        {
            ExitWarningPeacefully();
            return;
        }

        bool bVisibleNow = IsValid(CharacterOfInterest) && AI.Character.Perception.CanSee(CharacterOfInterest);
        if (bWasVisibleLastTick && !bVisibleNow)
            TimeLoSFirstLost = FInGameTime::Now();
        bWasVisibleLastTick = bVisibleNow;

        float DistVictimCreeper = MAX_flt;
        if (IsValid(CharacterOfInterest))
            DistVictimCreeper = Self.GetFeetLocation().Distance(CharacterOfInterest.GetFeetLocation());

        if (DistVictimCreeper >= Tuning.PeacefulEndDistance)
        {
            ExitWarningPeacefully();
            return;
        }

        if (!bVisibleNow && TimeLoSFirstLost.TotalSeconds > 0.0f &&
            TimeLoSFirstLost.AgeInRealtimeSeconds >= Tuning.PeacefulEndLoSGraceSeconds)
        {
            ExitWarningPeacefully();
            return;
        }
    }

    void ExitWarningPeacefully()
    {
        if (bHasExitedWarning)
            return;
        bHasExitedWarning = true;
        DisableStrafeMovementAndTurnToTargetMode();
        AI.LeaveGroupsWithClass(UAIGroup_Warning_Base);
        AI.LeaveGroupsWithClass(UAIGroup_ConflictInstance);

        // Stamp re-creep grace so a fast resume routes straight back to warning.
        if (IsValid(AI))
            CreepingContext::StampPeacefulResolution(AI);

        AI.UpdateCrimeSeverityTowardsPlayer();
        AI.SwitchToDailyRoutine();
    }

    void EmitEscalationEvent(FGameplayTag EventTag)
    {
        if (bHasEmittedEscalation)
            return;
        bHasEmittedEscalation = true;

        if (IsValid(CreeperCharacterState) && (CreeperCharacterState.IsDefeated() || CreeperCharacterState.IsDead()))
        {
            ExitWarningPeacefully();
            return;
        }

        DisableStrafeMovementAndTurnToTargetMode();

        FRememberedPerception Perception;
        Perception.Instigator.CharacterState = CreeperCharacterState;
        if (IsValid(CreeperCharacterState))
            Perception.Instigator.Character = CreeperCharacterState.Character;
        Perception.ContextTags.AddTag(GameplayTag::Crime_Creeping);
        AI.AssessEvent(EventTag, Perception);
        bEndAssessmentDone = true;
    }
}