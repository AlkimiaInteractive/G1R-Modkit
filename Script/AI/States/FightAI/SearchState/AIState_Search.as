UCLASS(Abstract)
class UAIState_Search : UAIState_Conflict
{
    default IsTickingTask = true;
    default AssessmentModuleClass = UAIARM_State_Investigate;
    default DefaultConflictType = EConflictType::None;

    // This npc will not lose awareness of any character it perceives as long as it stays in this state
    default OwnedGameplayTags.AddTag(GameplayTag::Perception_KeepAwareness_Sight);
    default OwnedGameplayTags.AddTag(GameplayTag::Perception_KeepAwareness_Smell);

    // Other npcs perceiving this npc will not lose awareness of it
    default OwnedGameplayTags.AddTag(GameplayTag::Perception_KeepAttention_Sight);
    default OwnedGameplayTags.AddTag(GameplayTag::Perception_KeepAttention_Smell);

    UFUNCTION(BlueprintOverride)
    void TickTask(float DeltaTimeSecs)
    {
        // EvaluateDisengage();
    }

    UFUNCTION(BlueprintOverride)
    void DoTask()
    {
        Super::DoTask();

        AI.EndAnyOngoingInteractionQuick();
    }

    FString GetDisplayName() const override
    {
        return "Search";
    }

    UFUNCTION(BlueprintOverride)
    bool PrefersGracefulExit() const
    {
        return false;
    }
}

/** State in which the AI will chase and search for a hiding enemy */
UCLASS()
class UAIState_ChaseAndLookForHidingCharacter : UAIState_Search
{
    default AssessmentModuleClass = UAIARM_State_ChaseAndLookForHidingCharacter;
    default OwnedGameplayTags.AddTag(GameplayTag::AIState_Conflict_ChaseAndLookForHidingCharacter);
    default AIStateTag = GameplayTag::AIState_Conflict_ChaseAndLookForHidingCharacter;

    UFUNCTION(BlueprintOverride)
    void DoTask() final
    {
        Super::DoTask();

        if (!IsValid(RememberedPerception.Origin.CharacterState) || 
            RememberedPerception.Origin.CharacterState.IsDead())
        {
            AI.AssessEvent(GameplayTag::AIEvent_State_Done, FRememberedPerception());
        }

        bool bLocationFound = false;
        auto LocationOfInterest = Self.NavAgentLocation;

        if (IsValid(RememberedPerception.Origin.Character))
        {
            LocationOfInterest = RememberedPerception.Origin.Character.NavAgentLocation;
        }
        
        VLog::Location(Self, "Last known location", LocationOfInterest + FVector::UpVector * 10.0f, 10.0f, FColor::Blue);
        float32 PathLength = 0;
        bool bHasFoundPath = UNavigationSystemV1::DoesPathExistWithinLengthLimit(Self, Self.NavAgentLocation, LocationOfInterest, MAX_flt, PathLength);

        if (!bHasFoundPath || PathLength < 5.0f)
        {            
            AI.AssessEvent(GameplayTag::AIEvent_State_Done, FRememberedPerception());
            bShouldExitState = true;
            return;
        }

        //AI.StopTargetingEnemy(EGothicFocusPriority::PerceptionResponse);

        if (Self.CanWalk())
        {
            if (!Self.IsMoving())
            {
                SetWalkSpeedBasedOnDistance(LocationOfInterest, 30.0f);
            }

            AI.GotoPosition(LocationOfInterest);
        }

        FInGameTime MaxSearchAroundDelay = FInGameTime::XRealtimeSecondsFromNow(3.0f);
        
        AI.SearchAroundHere().While(n"ShouldNotExitState");
        
        while (!MaxSearchAroundDelay.IsTimeInThePast() && ShouldNotExitState())
        {
            WaitOneTick();
        }

        AI.AssessEvent(GameplayTag::AIEvent_State_Done, FRememberedPerception());
    }

    void SetWalkSpeedBasedOnDistance(FVector TargetLocation, float ReachDistance)
    {
        EWalkSpeed NewWalkSpeed = EWalkSpeed::Walking;

        float FarDistance = Self.SimpleCollisionRadius * 10.0f;

        bool bIsClose = UNavigationSystemV1::DoesPathExistWithinCostLimit(Self, Self.ActorLocation, TargetLocation, FarDistance + ReachDistance);

        if (!bIsClose)
        {
            NewWalkSpeed = EWalkSpeed::Running;
        }

        if (Self.Velocity.Size2D() > Self.MovementComponent.MaxSpeed * 0.2f && Self.GothicMovementComponent.RequestedWalkSpeed == EWalkSpeed::Running)
            return;

        if (Self.GothicMovementComponent.RequestedWalkSpeed == NewWalkSpeed)
            return;

        SetWalkSpeed(NewWalkSpeed);
    }

    UFUNCTION()
    bool ShouldNotExitState() const
    {
        return !bShouldExitState;
    }

    FString GetDisplayName() const override
    {
        return "Chase And Look for Hiding Character";
    }
}

namespace SuspiciousSoundTheftFollowup
{
    bool TryAssessForWitness(
        UGameplayAbility_CharacterAI_Gothic AI,
        AGothicCharacterState WitnessState,
        AGothicCharacterState SuspectState,
        float LookbackSeconds,
        FVector InstigatorPos,
        FVector InstigatorNavPos)
    {
        if (!IsValid(AI) || !IsValid(WitnessState) || !IsValid(SuspectState))
            return false;

        auto CrimeProcessing = Cast<UCrimeProcessingSubsystem_Human>(UCrimeProcessingSubsystem_Human::Get());
        if (!IsValid(CrimeProcessing))
            return false;

        auto CrimeMemory = UCrimeMemorySubsystem::Get(WitnessState);
        if (!IsValid(CrimeMemory))
            return false;

        auto GlobalCrimes = CrimeProcessing.FilterGlobalCrimes(WitnessState)
            .ByCriminal(SuspectState)
            .OfCrimeType(GameplayTag::Crime_Theft)
            .WithForgivenessValue(false)
            .AffectingCharacter(WitnessState)
            .GetGlobalCrimeDataArray();

        int BestGlobalIdx = -1;
        float BestGlobalAge = MAX_flt;
        for (int i = 0; i < GlobalCrimes.Num(); ++i)
        {
            float AgeSeconds = GlobalCrimes[i].TimeCommitted.AgeInRealtimeSeconds;
            if (AgeSeconds < 0.0f || AgeSeconds > LookbackSeconds)
                continue;
            if (AgeSeconds < BestGlobalAge)
            {
                BestGlobalAge = AgeSeconds;
                BestGlobalIdx = i;
            }
        }

        if (BestGlobalIdx < 0)
            return false;

        FGlobalCrimeDataEntry ChosenGlobal = GlobalCrimes[BestGlobalIdx];
        FRelativeCrimeDataEntry ChosenRelative;
        if (!CrimeMemory.CharacterHasRelativeCrime(WitnessState, ChosenGlobal.ID))
            CrimeMemory.CreateRelativeMemoriesToCrime(WitnessState, ChosenGlobal.ID, ERelativeCrimeOrigin::Witness);
        if (!CrimeMemory.GetRelativeCrime(ChosenRelative, ChosenGlobal.ID, WitnessState))
            return false;

        FCrimeEntry CrimeEntry = FCrimeEntry(ChosenGlobal, ChosenRelative);
        if (!CrimeEntry.bIsValid)
            return false;

        float NormalizedSeverity = CrimeProcessing.EvaluateCrimeEntry(WitnessState, CrimeEntry);
        FRememberedPerception TheftPerception;
        if (!CrimeProcessing.CreateAssessmentPerceptionFromCrime(TheftPerception, CrimeEntry, NormalizedSeverity))
            return false;        

        TheftPerception.EventTag = GameplayTag::AIEvent_SuspiciousSound_PersonalTheftConfirmed;
        TheftPerception.ContextTags.AddTag(GameplayTag::Crime_Theft);

        FVector ResolvedPos    = InstigatorPos;
        FVector ResolvedNavPos = InstigatorNavPos;
        if (ResolvedPos == FVector::ZeroVector && IsValid(AI.Character))
            ResolvedPos = AI.Character.ActorLocation;
        if (ResolvedNavPos == FVector::ZeroVector && IsValid(AI.Character))
            ResolvedNavPos = AI.Character.NavAgentLocation;

        TheftPerception.Instigator.AtPosition    = ResolvedPos;
        TheftPerception.Instigator.AtNavPosition = ResolvedNavPos;
        TheftPerception.Origin.AtPosition        = ResolvedPos;
        TheftPerception.Origin.AtNavPosition     = ResolvedNavPos;

        AI.AssessEvent(GameplayTag::AIEvent_SuspiciousSound_PersonalTheftConfirmed, TheftPerception);
        return true;
    }
}

/** State in which the AI will search the cause of a suspicious sound [sound of something illegal, out of the norm or of an unauthorized character in a restricted area] */
UCLASS(Abstract)
class UAIState_InvestigateSuspiciousSound : UAIState_Search
{
    default OwnedGameplayTags.AddTag(GameplayTag::AIState_Conflict_InvestigateSuspiciousSound);
    default AIStateTag = GameplayTag::AIState_Conflict_InvestigateSuspiciousSound;
    default StateGroupClass = UAIGroup_Search_Investigate;

    /** Hard cap on the post-arrival inspect/watch-for-exit loop (real seconds). */
    UPROPERTY(EditDefaultsOnly, Category="Investigate")
    float InspectionMaxSeconds = 6.0f;

    /** After the suspect-left bark fires, how long the NPC keeps inspecting the spot. */
    UPROPERTY(EditDefaultsOnly, Category="Investigate")
    float PostBarkInspectSeconds = 2.5f;

    /** After this many seconds, the NPC will assume they slipped away. */
    UPROPERTY(EditDefaultsOnly, Category="Investigate")
    float InferenceTimeoutSeconds = 3.0f;

    /** How far back to scan personal-theft crimes by the suspect. A hit promotes the response to pursue. */
    UPROPERTY(EditDefaultsOnly, Category="Investigate")
    float PersonalTheftLookbackSeconds = 30.0f;

    /** Cached perception state captured at state entry / first sighting. */
    UPROPERTY()
    private bool bSawSuspectDuringInvestigate = false;
    UPROPERTY()
    private bool bSuspectWasIndoorAtSoundTime = false;
    UPROPERTY()
    private FGameplayTag CapturedSoundAreaTag;

    UPROPERTY()
    private bool bSuspectExitDetected = false;

    UPROPERTY()
    private FGameplayTag CachedLocationIndoorTag;

    UPROPERTY()
    private bool bSawSuspectOutsideArea = false;
    UPROPERTY()
    private FVector LastSawOutsidePos = FVector::ZeroVector;
    UPROPERTY()
    private FVector LastSawOutsideNavPos = FVector::ZeroVector;

    UFUNCTION(BlueprintOverride)
    void SetupPerceptions(UCharacterPerceptionComponent Perception)
    {
        Super::SetupPerceptions(Perception);

        CachedLocationIndoorTag = FGameplayTag::RequestGameplayTag(n"Location.Indoor", false);

        AGothicCharacterState SuspectState = RememberedPerception.Origin.CharacterState;
        if (IsValid(SuspectState))
        {
            CapturedSoundAreaTag = SuspectState.AreaTagOfLocation;
            if (CachedLocationIndoorTag.IsValid())
                bSuspectWasIndoorAtSoundTime = SuspectState.HasGameplayTag(CachedLocationIndoorTag);

            Perception.SeeSpecificCharacter(SuspectState)
                .PerceptionGained.BindUFunction(this, n"PerceptionEvent_OnSuspectSeenInArea");
        }
    }

    UFUNCTION()
    private void PerceptionEvent_OnSuspectSeenInArea(const FRememberedPerception&in Perception,
                                                     const FPerceptionShortTermMemory&in Memory)
    {
        bSawSuspectDuringInvestigate = true;

        AGothicCharacterState SuspectState = Perception.Origin.CharacterState;
        bool bOutsideNow = (IsValid(SuspectState) && HasSuspectExitedSoundArea(SuspectState));

        if (bOutsideNow && IsValid(SuspectState.Character))
        {
            bSawSuspectOutsideArea = true;
            LastSawOutsidePos    = SuspectState.Character.ActorLocation;
            LastSawOutsideNavPos = SuspectState.Character.NavAgentLocation;
        }

        if (!bSuspectExitDetected && bOutsideNow)
        {
            bSuspectExitDetected = true;
            SaySuspectLeftBark();
        }
    }

    UFUNCTION(BlueprintOverride)
    void DoTask()
    {
        Super::DoTask();

        AI.WaitUntilCanMove();

        // Always turn toward the sound source when we have valid origin
        FVector TurnTarget = GetInvestigateTurnTarget();
        if (TurnTarget != FVector::ZeroVector)
        {
            AI.TurnToPosition(TurnTarget);
            AI.WaitSeconds(1.0f);
        }

        DebugScript::DrawSphere(RememberedPerception.Origin.AtNavPosition, 50, FColor::Red, 8.f);
        
        // Group leader will go investigate
        if (Self.CanWalk() && IsValid(StateGroup) && !IsValid(StateGroup.Leader))
        {
            StateGroup.Leader = AI.CharacterState;
            AI.GotoPosition(RememberedPerception.Origin.AtNavPosition, 30.0f);
        }

        if (IsValid(StateGroup) && StateGroup.Leader != CharacterState)
        {
            while (IsValid(StateGroup.Leader))
            {
                WaitOneTick();
            }
        }

        InspectAndWatchForSuspectExit();

        if (TryEscalateToPersonalTheftFollowup())
            return;

        AI.AssessHostilesAndEnemiesAround(RememberedPerception);

        AI.AssessEvent(GameplayTag::AIEvent_State_Done, RememberedPerception);
        WaitSeconds(3.0f);
    }

    void InspectAndWatchForSuspectExit()
    {
        AGothicCharacterState SuspectState = RememberedPerception.Origin.CharacterState;
        FInGameTime HardDeadline = FInGameTime::XRealtimeSecondsFromNow(InspectionMaxSeconds);
        FInGameTime InferenceDeadline = FInGameTime::XRealtimeSecondsFromNow(InferenceTimeoutSeconds);

        FInGameTime PostBarkDeadline;
        bool bPostBarkArmed = false;

        while (!HardDeadline.IsTimeInThePast() && !bShouldExitState)
        {
            if (!bSuspectExitDetected && HasSuspectExitedSoundArea(SuspectState))
            {
                bSuspectExitDetected = true;
                SaySuspectLeftBark();
            }

            if (!bSuspectExitDetected && !bSawSuspectDuringInvestigate && InferenceDeadline.IsTimeInThePast())
            {
                bSuspectExitDetected = true;
                SaySuspectLeftBark();
            }

            if (bSuspectExitDetected && !bPostBarkArmed)
            {
                bPostBarkArmed = true;
                PostBarkDeadline = FInGameTime::XRealtimeSecondsFromNow(PostBarkInspectSeconds);
            }
            if (bPostBarkArmed && PostBarkDeadline.IsTimeInThePast())
                return;

            WaitOneTick();
        }
    }

    bool HasSuspectExitedSoundArea(AGothicCharacterState SuspectState) const
    {
        if (!IsValid(SuspectState))
            return false;

        if (CapturedSoundAreaTag.IsValid() &&
            SuspectState.AreaTagOfLocation != CapturedSoundAreaTag)
            return true;

        if (bSuspectWasIndoorAtSoundTime && CachedLocationIndoorTag.IsValid() &&
            !SuspectState.HasGameplayTag(CachedLocationIndoorTag))
            return true;

        return false;
    }

    void SaySuspectLeftBark()
    {
        if (!IsValid(AI) || !IsValid(AI.CharacterState))
            return;

        AGothicCharacterState SuspectState = RememberedPerception.Origin.CharacterState;
        if (AI.CharacterState.IsSpeaking())
            return;

        FGenericVoicelineRequestContext BarkContext;
        AI.CharacterState.Voiceline.SayVoicelineWithContext(
            GameplayTag::Sound_Voice_Reaction_Crime_Thief_WhatDidYouInThere,
            SuspectState,
            BarkContext,
            EPerceptionNoiseLoudness::Moderate);
    }

    bool TryEscalateToPersonalTheftFollowup()
    {
        AGothicCharacterState SuspectState = RememberedPerception.Origin.CharacterState;
        if (!IsValid(SuspectState))
            return false;

        FVector InstigatorPos = FVector::ZeroVector;
        FVector InstigatorNavPos = FVector::ZeroVector;
        ResolveTheftPursuitNavTarget(SuspectState, InstigatorPos, InstigatorNavPos);

        return SuspiciousSoundTheftFollowup::TryAssessForWitness(
            AI, CharacterState, SuspectState,
            PersonalTheftLookbackSeconds,
            InstigatorPos, InstigatorNavPos);
    }

    void ResolveTheftPursuitNavTarget(AGothicCharacterState SuspectState,
                                      FVector&out OutPos, FVector&out OutNavPos)
    {
        if (bSawSuspectOutsideArea)
        {
            OutPos = LastSawOutsidePos;
            OutNavPos = LastSawOutsideNavPos;
            return;
        }

        if (IsValid(SuspectState) && IsValid(SuspectState.Character) && HasSuspectExitedSoundArea(SuspectState))
        {
            OutPos = SuspectState.Character.ActorLocation;
            OutNavPos = SuspectState.Character.NavAgentLocation;
            return;
        }

        FVector LastSeenPos;
        FVector LastSeenNavPos;
        if (LastSeenPlayerContext::TryGet(AI, SuspectState, LastSeenPos, LastSeenNavPos))
        {
            OutPos = LastSeenPos;
            OutNavPos = LastSeenNavPos;
            return;
        }

        OutPos = RememberedPerception.Origin.AtPosition;
        OutNavPos = RememberedPerception.Origin.AtNavPosition;
    }

    FVector GetInvestigateTurnTarget() const
    {
        if (RememberedPerception.Origin.AtPosition != FVector::ZeroVector)
            return RememberedPerception.Origin.AtPosition;
        if (IsValid(RememberedPerception.Origin.Character))
            return RememberedPerception.Origin.Character.ActorLocation;
        return FVector::ZeroVector;
    }

    FString GetDisplayName() const override
    {
        return "Investigate suspicious Sound";
    }
}

class UAIState_InvestigateSuspiciousSound_Trespassing : UAIState_InvestigateSuspiciousSound
{
    default AIStateTag = GameplayTag::AIState_Conflict_InvestigateSuspiciousSound_Trespassing;
    default OwnedGameplayTags.AddTag(GameplayTag::AIState_Conflict_InvestigateSuspiciousSound_Trespassing);
    default StateGroupClass = UAIGroup_Search_Trespassing;
}

class UAIState_InvestigateSuspiciousSound_Item : UAIState_InvestigateSuspiciousSound
{
    default AIStateTag = GameplayTag::AIState_Conflict_InvestigateSuspiciousSound_Item;
    default OwnedGameplayTags.AddTag(GameplayTag::AIState_Conflict_InvestigateSuspiciousSound_Item);

    default OwnedGameplayTags.AddTag(GameplayTag::Debuff_Distracted);
    default OwnedGameplayTags.AddTag(GameplayTag::Debuff_ReducedSense_Hearing);
}

class UAIState_InvestigateSound_Item_NoConflict : UAIState_InvestigateSuspiciousSound
{
    default AIStateTag = GameplayTag::AIState_Conflict_InvestigateSuspiciousSound_Item;
    default OwnedGameplayTags.AddTag(GameplayTag::AIState_Conflict_InvestigateSuspiciousSound_Item);

    default OwnedGameplayTags.AddTag(GameplayTag::Debuff_Distracted);
    default OwnedGameplayTags.AddTag(GameplayTag::Debuff_ReducedSense_Hearing);
}

UCLASS()
class UAIState_InvestigateIdentifiedSound : UAIState_Search
{
    default OwnedGameplayTags.AddTag(GameplayTag::AIState_Conflict_InvestigateIdentifiedSound);
    default AIStateTag = GameplayTag::AIState_Conflict_InvestigateIdentifiedSound;

    UPROPERTY()
    const UTerritoryConfig SearchTerritory;

    UFUNCTION(BlueprintOverride)
    void DoTask()
    {
        Super::DoTask();

        SearchTerritory = AI.GetCurrentTerritory();

        AI.WaitUntilCanMove();
        AI.ItemActionScoringEntryManager.UpdateAvailableItems();

        if (Self.CanWalk())
        {
            if (CanEquipWeapons())
            {
                AI.SelectBestItemActionFromInventory();
                WaitForLastTaskToEnd(
                    AI.DrawItem(SelectedItem),
                    AI.TurnToCharacter(RememberedPerception.Origin.Character)
                );
            }
            else
            {
                AI.TurnToCharacter(RememberedPerception.Origin.Character);
            }

            SetWalkSpeed(EWalkSpeed::Running);
            AI.Follow(RememberedPerception.Origin.Character, 100.0f).TimeLimit(15.0f).While(n"IsTargetInTerritory");
        }

        AI.WaitSeconds(3.0f);

        AI.AssessEvent(GameplayTag::AIEvent_State_Done, RememberedPerception);
    }

    UFUNCTION()
    bool IsTargetInTerritory() const
    {
        if (!IsValid(RememberedPerception.Origin.Character))
            return false;

        if (!RememberedPerception.Origin.CharacterState.IsCharacterStateWithinTerritory(SearchTerritory))
            return false;

        return true;
    }

    FString GetDisplayName() const override
    {
        return "Investigate Identified Sound";
    }
}

/** State in which the AI will investigate a potential pickpocket. */
UCLASS(Abstract)
class UAIState_InvestigatePickpocket : UAIState_PerceptionResponse
{
    default OwnedGameplayTags.AddTag(GameplayTag::AIState_Conflict_InvestigatePickpocket);
    default AIStateTag = GameplayTag::AIState_Conflict_InvestigatePickpocket;

    // This npc will not lose awareness of any character it perceives as long as it stays in this state
    default OwnedGameplayTags.AddTag(GameplayTag::Perception_KeepAwareness_Sight);
    default OwnedGameplayTags.AddTag(GameplayTag::Perception_KeepAwareness_Smell);

    // Other npcs perceiving this npc will not lose awareness of it
    default OwnedGameplayTags.AddTag(GameplayTag::Perception_KeepAttention_Sight);
    default OwnedGameplayTags.AddTag(GameplayTag::Perception_KeepAttention_Smell);

    FGameplayTag InstigatorSeenTag = GameplayTag::AIEvent_Seen_PotentialThief;
    FGameplayTag InstigatorNotSeenTag;

    bool bPotentialThiefSeen = false;
    bool bCheckPouchInteraction = false;

    float CharacterLeaveDistance = 350.0f;
    
    // Perceived character / character state will be the perception origin actor for noise events, and the perception instigator actor for "sensed" events.
    AGothicCharacter GetPerceivedCharacter() const { return nullptr; }
    AGothicCharacterState GetPerceivedCharacterState() const { return nullptr; }

    bool IsCharacterStillNearby() const
    {
        if (Self.GetDistanceTo(GetPerceivedCharacter()) < Self.GetSimpleCollisionRadius() + CharacterLeaveDistance)
                return true;

        return false;
    }

    UFUNCTION(BlueprintOverride)
    void SetupPerceptions(UCharacterPerceptionComponent Perception)
    {
        Perception.SeeSpecificCharacter(GetPerceivedCharacterState())
            .WithAwareness(5.0f)
            .PerceptionGained.BindUFunction(this, n"PerceptionEvent_OnPotentialThiefSeen");
    }

    UFUNCTION(BlueprintOverride)
    void DoTask() final
    {
        Super::DoTask();

        if (bCheckPouchInteraction)
        {
            AI.CheckPouch();
        }

        if (CharacterState.IsDead() || CharacterState.IsDefeated())
        {
            EndTaskAsFailure();
            return;
        }

        auto LocationOfInterest = GetPerceivedCharacter().GetFeetLocation();
        auto SensedCharacter = GetPerceivedCharacter();

        AI.WaitUntilCanMove();
        AI.WaitUntilNoLongerBlocked();

        if (Self.CanWalk())
        {
            AI.TurnToCharacter(GetPerceivedCharacter());
        }

        AI.WaitSeconds(3.0f).While(n"HasNotSeenPotentialThief");

        if (bPotentialThiefSeen)
        {
            AI.WaitSeconds(0.3f);
            AI.WaitUntilNoLongerSpeaking();

            while (IsCharacterStillNearby())
            {
                WaitOneTick();
                continue;
            }
        }

        if (InstigatorNotSeenTag.IsValid())
        {
            AI.AssessEvent(InstigatorNotSeenTag, RememberedPerception);
            AI.WaitSeconds(1.0f);
        }

        AI.AssessHostilesAndEnemiesAround(RememberedPerception);
    }

    UFUNCTION()
    bool HasNotSeenPotentialThief() const
    {
        return !bPotentialThiefSeen;
    }

    UFUNCTION()
    private void PerceptionEvent_OnPotentialThiefSeen(const FRememberedPerception&in Perception, const FPerceptionShortTermMemory&in Memory)
    {
        bPotentialThiefSeen = true;
        AI.AssessEvent(InstigatorSeenTag, Perception);
    }

    FString GetDisplayName() const override
    {
        return "Investigate Pickpocket";
    }
}

UCLASS(Abstract)
class UAIState_InvestigatePickpocket_PercieivedCharacterInstigator : UAIState_InvestigatePickpocket
{
    AGothicCharacter GetPerceivedCharacter() const override final
    {
        return RememberedPerception.Instigator.Character;
    }

    AGothicCharacterState GetPerceivedCharacterState() const override final
    {
        return RememberedPerception.Instigator.CharacterState;
    }
}

UCLASS(Abstract)
class UAIState_InvestigatePickpocket_PerceivedCharacterOrigin : UAIState_InvestigatePickpocket
{
    AGothicCharacter GetPerceivedCharacter() const override final
    {
        return RememberedPerception.Origin.Character;
    }

    AGothicCharacterState GetPerceivedCharacterState() const override final
    {
        return RememberedPerception.Origin.CharacterState;
    }
}

UCLASS()
class UAIState_InvestigatePickpocket_Heard : UAIState_InvestigatePickpocket_PerceivedCharacterOrigin
{
    default OwnedGameplayTags.AddTag(GameplayTag::AIState_Conflict_InvestigatePickpocket_Heard);
    default AIStateTag = GameplayTag::AIState_Conflict_InvestigatePickpocket;
    default InstigatorSeenTag = GameplayTag::AIEvent_Seen_PotentialThief_Heard;
}

UCLASS()
class UAIState_InvestigatePickpocket_AttemptFailed : UAIState_InvestigatePickpocket_PercieivedCharacterInstigator
{
    default OwnedGameplayTags.AddTag(GameplayTag::AIState_Conflict_InvestigatePickpocket_AttemptFailed);
    default AIStateTag = GameplayTag::AIState_Conflict_InvestigatePickpocket_AttemptFailed;
    default InstigatorSeenTag = GameplayTag::AIEvent_Seen_PotentialThief_AttemptFailed;

    default bCheckPouchInteraction = true;
}

UCLASS()
class UAIState_InvestigatePickpocket_AttemptSucceeded : UAIState_InvestigatePickpocket_PercieivedCharacterInstigator
{
    default OwnedGameplayTags.AddTag(GameplayTag::AIState_Conflict_InvestigatePickpocket_AttemptSucceeded);
    default AIStateTag = GameplayTag::AIState_Conflict_InvestigatePickpocket_AttemptSucceeded;
    default InstigatorSeenTag = GameplayTag::AIEvent_Seen_PotentialThief_AttemptSucceeded;

    default bCheckPouchInteraction = true;
}

/** State in which the AI will investigate a pouch sound. */
UCLASS()
class UAIState_InvestigatePouch_Heard : UAIState_PerceptionResponse
{
    default OwnedGameplayTags.AddTag(GameplayTag::AIState_Conflict_InvestigatePouch_Heard);
    default AIStateTag = GameplayTag::AIState_Conflict_InvestigatePouch_Heard;

    // Other npcs perceiving this npc will not lose awareness of it
    default OwnedGameplayTags.AddTag(GameplayTag::Perception_KeepAttention_Sight);
    default OwnedGameplayTags.AddTag(GameplayTag::Perception_KeepAttention_Smell);

    UFUNCTION(BlueprintOverride)
    void DoTask() final
    {
        Super::DoTask();

        if (RememberedPerception.EventTag.MatchesTag(GameplayTag::Event_Perception_Gained_Hear)) // Event is a real perception event and doesn't have a memory event tag
        {
            RememberPouchDroppedAtLocation(RememberedPerception.Origin.Actor.ActorLocation);
        }

        if (CharacterState.IsDead() || CharacterState.IsDefeated())
        {
            EndTaskAsFailure();
            return;
        }

        AI.WaitUntilCanMove();
        AI.WaitUntilNoLongerBlocked();

        FVector Location = RememberedPerception.Origin.AtPosition;

        if (Self.CanWalk())
        {
            if (RememberedPerception.Origin.Actor != nullptr)
            {
                AI.TurnToActor(RememberedPerception.Origin.Actor);
                Location = RememberedPerception.Origin.Actor.ActorLocation;
            }

            auto PickUpTask = AI.FindAndPickUpItem(UItMi_Meta_Pouch::StaticClass(), Location, 50.0f);

            if (PickUpTask.WasSuccessful())
            {
                RememberPouchPickedUpAtLocation(Location);
            }
            else if (PickUpTask.Result == EGenericTaskResult::Failed)
            {
                RememberPouchNotFoundAtLocation(Location);
            }
        }

        AI.AssessEvent(GameplayTag::AIEvent_State_Done, RememberedPerception);
    }

    FString GetDisplayName() const override
    {
        return "Investigate Pouch Sound";
    }

    void RememberPouchDroppedAtLocation(FVector Location)
    {
        RememberEventAtLocation(GameplayTag::Memory_OwnedPouch_Dropped, Location);
    }

    void RememberPouchPickedUpAtLocation(FVector Location)
    {
        RememberEventAtLocation(GameplayTag::Memory_OwnedPouch_PickedUp, Location);
    }

    void RememberPouchNotFoundAtLocation(FVector Location)
    {
        RememberEventAtLocation(GameplayTag::Memory_OwnedPouch_NotFound, Location);
    }

    void RememberEventAtLocation(FGameplayTag EventTag, FVector Location)
    {
        FMemorizedEvent MemorizedEvent = FMemorizedEvent();
        MemorizedEvent.EventTags.AddTag(EventTag);
        MemorizedEvent.Position = Location;

        CharacterState.LongTermMemory.MemorizeEvent(MemorizedEvent);
    }
}

/** State in which the AI will search the cause of a suspicious sound [sound of something illegal, out of the norm or of an unauthorized character in a restricted area] */
UCLASS()
class UAIState_InvestigateCombatSound : UAIState_Search
{
    default OwnedGameplayTags.AddTag(GameplayTag::AIState_Conflict_InvestigateCombatSound);
    default AIStateTag = GameplayTag::AIState_Conflict_InvestigateCombatSound;
    default bMemorizeStateUsage = true;

    UPROPERTY()
    const UTerritoryConfig SearchTerritory;

    UPROPERTY(EditDefaultsOnly)
    const float RepeatedSoundTimeWindowSeconds = 15.0f;

    /** Follow distance to the live fight source (Origin.Character). */
    UPROPERTY(EditDefaultsOnly)
    const float FightSourceFollowDistance = 250.0f;

    /** Static-fallback arrival distance when Origin.Character is invalid. */
    UPROPERTY(EditDefaultsOnly)
    const float FallbackGotoArriveDistance = 150.0f;

    /** Hard cap on the live-follow task. */
    UPROPERTY(EditDefaultsOnly)
    const float FollowMaxSeconds = 15.0f;

    /** Hard cap on time spent waiting for the post-goto investigate loop. */
    UPROPERTY(EditDefaultsOnly)
    const float PostGotoMaxLoopSeconds = 4.0f;

    UFUNCTION(BlueprintOverride)
    void SetupPerceptions(UCharacterPerceptionComponent Perception)
    {
        Super::SetupPerceptions(Perception);

        // if (CharacterOfInterest != nullptr)
        // {
        //     Perception.SeeSpecificCharacter(CharacterOfInterest.CharacterState).PerceptionGained.BindUFunction(this, n"PerceptionEvent_OnCharacterOfInterestSeen");
        // }
    }

    UFUNCTION(BlueprintOverride)
    void DoTask()
    {
        Super::DoTask();

        SearchTerritory = AI.GetCurrentTerritory();

        AI.WaitUntilCanMove();

        // Go to sound when in combat OR when repeated sounds (heard before in time window)
        if (ShouldGoToSound())
        {
            GoToPositionBehavior();

            // Nudge perception once Follow returned. If the source is still
            // valid (alive, in scene) force a sight resolution so the ARM can
            // react immediately (Seen_Combat -> WatchFight/Flee/Combat) without
            // waiting for the next perception tick.
            if (IsValid(RememberedPerception.Origin.Character) &&
                IsValid(RememberedPerception.Origin.Character.CharacterState) &&
                !RememberedPerception.Origin.Character.IsDead())
            {
                AI.ForceSightPerception(RememberedPerception.Origin.Character.CharacterState);
            }

            // Bounded post-arrival loop: keep the state alive briefly so the
            // perception pipeline can see/assess the fight from the new spot,
            // but never block indefinitely.
            FInGameTime LoopDeadline = FInGameTime::XRealtimeSecondsFromNow(PostGotoMaxLoopSeconds);
            while (ShouldContinueInvestigating() && !LoopDeadline.IsTimeInThePast())
            {
                WaitOneTick();
            }

            AI.StopFollowingActor();
            SetWalkSpeed(EWalkSpeed::Walking);
        }

        // Always turn toward the sound source when we have valid origin
        FVector TurnTarget = GetInvestigateTurnTarget();
        if (TurnTarget != FVector::ZeroVector)
        {
            AI.TurnToPosition(TurnTarget);
            AI.WaitSeconds(3.0f);
        }

        AI.AssessHostilesAndEnemiesAround(RememberedPerception);

        AI.AssessEvent(GameplayTag::AIEvent_State_Done, RememberedPerception);
        WaitSeconds(3.0f);
    }

    FVector GetInvestigateTurnTarget() const
    {
        if (RememberedPerception.Origin.AtPosition != FVector::ZeroVector)
            return RememberedPerception.Origin.AtPosition;
        if (IsValid(RememberedPerception.Origin.Character))
            return RememberedPerception.Origin.Character.ActorLocation;
        return FVector::ZeroVector;
    }

    bool ShouldGoToSound()
    {
        if (ShouldContinueInvestigating())
            return true;
        // Repeated sounds: heard this state before within the time window
        return GetTimesAIStateStarted(RepeatedSoundTimeWindowSeconds) >= 2;
    }

    /** Resolve the world target for moving toward the heard sound.
     *  Order: explicit AtNavPosition, then Origin.Character.NavAgentLocation,
     *  then Origin.AtPosition. Never returns CharacterOfInterest as a target
     *  (that may be the sensed character's combat target, e.g. the player). */
    FVector ResolveSoundNavTarget() const
    {
        if (RememberedPerception.Origin.AtNavPosition != FVector::ZeroVector)
            return RememberedPerception.Origin.AtNavPosition;
        if (IsValid(RememberedPerception.Origin.Character))
            return RememberedPerception.Origin.Character.NavAgentLocation;
        if (RememberedPerception.Origin.AtPosition != FVector::ZeroVector)
            return RememberedPerception.Origin.AtPosition;
        return FVector::ZeroVector;
    }

    void GoToPositionBehavior()
    {
        if (!Self.CanWalk())
            return;

        if (!IsAnyInvolvedCharacterFriendlyOrEnemy() && !IsAnyInvolvedCreatureAngryOrWorse())
        {
            WalkToSourceWithNoWeapon();
            return;
        }

        if (CharacterState.ActsBrave())
        {
            RunToSourceWithWeaponDrawn();
            return;
        }

        if (IsEnemyStrongerCharacterInvolved())
        {
            WalkToSourceWithNoWeapon();
            return;
        }

        if (IsAnyEnforcerOrLeaderInvolved())
        {
            WalkToSourceWithNoWeapon();
            return;
        }

        WalkToSourceWithNoWeapon();
        return;
    }

    bool IsAnyInvolvedCharacterFriendlyOrEnemy()
    {
        return ConflictInstanceGroup.IsAnyInvolvedCharacterFriendlyOrEnemyOf(Self);
    }

    bool IsAnyInvolvedCreatureAngryOrWorse()
    {
        return ConflictInstanceGroup.IsAnyInvolvedCreatureAngryOrWorse(CharacterState);
    }

    bool IsEnemyStrongerCharacterInvolved()
    {
        return ConflictInstanceGroup.IsAnyInvolvedCharacterEnemyAndStrongerThan(Self);
    }

    bool IsAnyEnforcerOrLeaderInvolved()
    {
        return ConflictInstanceGroup.IsAnyInvolvedCharacterEnemyAndStrongerThan(Self);
    }

    void WalkToSourceWithNoWeapon()
    {
        SetWalkSpeed(EWalkSpeed::Walking);

        if (IsValid(RememberedPerception.Origin.Character))
        {
            AI.Follow(RememberedPerception.Origin.Character, FightSourceFollowDistance)
                .TimeLimit(FollowMaxSeconds)
                .While(n"ShouldKeepFollowingFightSource");
            return;
        }

        FVector NavTarget = ResolveSoundNavTarget();
        if (NavTarget == FVector::ZeroVector || !AI.CanGotoPosition(NavTarget))
            return;

        AI.GotoPosition(NavTarget, FallbackGotoArriveDistance);
    }

    void RunToSourceWithWeaponDrawn()
    {
        AI.ItemActionScoringEntryManager.UpdateAvailableItems();

        bool bHasLiveSource = IsValid(RememberedPerception.Origin.Character);
        FVector NavTarget = ResolveSoundNavTarget();
        bool bCanGoto = bHasLiveSource || (NavTarget != FVector::ZeroVector && AI.CanGotoPosition(NavTarget));

        if (CanEquipWeapons())
        {
            AI.SelectBestItemActionFromInventory();
            if (!bCanGoto)
            {
                WaitForLastTaskToEnd(
                    AI.DrawItem(SelectedItem),
                    AI.TurnToPosition(NavTarget)
                );
                return;
            }

            SetWalkSpeed(EWalkSpeed::Running);
            AI.DrawItem(SelectedItem);

            if (bHasLiveSource)
            {
                AI.Follow(RememberedPerception.Origin.Character, FightSourceFollowDistance)
                    .TimeLimit(FollowMaxSeconds)
                    .While(n"ShouldKeepFollowingFightSource");
            }
            else
            {
                AI.GotoPosition(NavTarget, FallbackGotoArriveDistance);
            }
        }
        else
        {
            if (!bCanGoto)
            {
                AI.TurnToPosition(NavTarget);
                return;
            }

            SetWalkSpeed(EWalkSpeed::Running);

            if (bHasLiveSource)
            {
                AI.Follow(RememberedPerception.Origin.Character, FightSourceFollowDistance)
                    .TimeLimit(FollowMaxSeconds)
                    .While(n"ShouldKeepFollowingFightSource");
            }
            else
            {
                AI.GotoPosition(NavTarget, FallbackGotoArriveDistance);
            }
        }
    }

    UFUNCTION()
    bool ShouldKeepFollowingFightSource() const
    {
        if (!IsValid(CharacterState))
            return false;

        AGothicCharacter Source = RememberedPerception.Origin.Character;
        if (!IsValid(Source) || Source.IsDead())
            return false;

        if (!Source.CharacterState.IsCharacterStateWithinTerritory(SearchTerritory))
            return false;

        if (!Source.IsInConflictFightingState() && !Source.IsInConflictWarningState())
            return false;

        if (AI.Character.Perception.CanSee(Source))
            return false;

        return true;
    }

    UFUNCTION()
    bool ShouldContinueInvestigating() const
    {
        if (!IsValid(CharacterState) || !IsValid(CharacterOfInterest) || !IsValid(CharacterOfInterest.CharacterState))
            return false;

        if (CharacterState.CanSeeCharacter(CharacterOfInterest.CharacterState))
            return false;

        auto Groups = UGothicAIGroup::GetAllActiveGroupsOfClass(UAIGroup_ConflictInstance);
        for (auto Group : Groups)
        {
            if (Group.JoinedCharacters.IsEmpty())
                continue;

            for (auto JoinedCharacter : Group.JoinedCharacters)
            {
                if (JoinedCharacter == CharacterState.Character)
                    continue;

                if (JoinedCharacter.IsInConflictFightingState() || JoinedCharacter.IsInConflictWarningState())
                    return true;
            }
        }

        return false;
    }

    UFUNCTION()
    private void PerceptionEvent_OnCharacterOfInterestSeen(const FRememberedPerception&in Perception, const FPerceptionShortTermMemory&in Memory)
    {
        if (RememberedPerception.Instigator.CharacterState == CharacterOfInterest.CharacterState)
        {
            AI.AssessEvent(GameplayTag::AIEvent_Seen_Attacker, RememberedPerception);
        }

        AI.AssessHostilesAndEnemiesAround(Perception);
    }

    FString GetDisplayName() const override
    {
        return "Investigate Combat Sound";
    }
}

/** Guard investigates a reported crime: sprints to the criminal's last known position, reacts
 *  as soon as the criminal enters sight (via SetupPerceptions), and falls back to an unconditional
 *  confront if the criminal is known but never seen during the sprint. */
UCLASS()
class UAIState_InvestigateAlarm : UAIState_Search
{
    default OwnedGameplayTags.AddTag(GameplayTag::AIState_Conflict_InvestigateAlarm);
    default AIStateTag = GameplayTag::AIState_Conflict_InvestigateAlarm;

    UPROPERTY()
    bool bConfrontedCriminal = false;

    UFUNCTION(BlueprintOverride)
    void SetupPerceptions(UCharacterPerceptionComponent Perception)
    {
        Super::SetupPerceptions(Perception);

        // Bind a one-shot "criminal seen" reaction so the guard diverts mid-approach the moment
        // the thief enters his field of view, rather than finishing the full nav to the exact spot.
        if (IsValid(RememberedPerception.Instigator.CharacterState))
        {
            Perception.SeeSpecificCharacter(RememberedPerception.Instigator.CharacterState)
                .PerceptionGained.BindUFunction(this, n"PerceptionEvent_OnCriminalSeenDuringAlarm");
        }
    }

    UFUNCTION()
    private void PerceptionEvent_OnCriminalSeenDuringAlarm(
        const FRememberedPerception&in Perception,
        const FPerceptionShortTermMemory&in Memory)
    {
        TryConfrontCriminal(Perception);
    }

    void TryConfrontCriminal(const FRememberedPerception&in SourcePerception)
    {
        if (bConfrontedCriminal || bShouldExitState)
            return;
        if (!IsValid(RememberedPerception.Instigator.CharacterState))
            return;

        bConfrontedCriminal = true;

        FRememberedPerception ConfrontPerception = SourcePerception;
        ConfrontPerception.ContextTags.AppendTags(RememberedPerception.ContextTags);
        if (RememberedPerception.EventTag.MatchesTag(GameplayTag::Crime))
            ConfrontPerception.ContextTags.AddTag(RememberedPerception.EventTag);
        ConfrontPerception.EventTag = GameplayTag::AIEvent_Guard_ConfrontedCriminalAtCrimeScene;
        ConfrontPerception.Instigator = RememberedPerception.Instigator;
        AI.AssessEventWithExtraTags(ConfrontPerception.EventTag, ConfrontPerception, ConfrontPerception.ContextTags);
    }

    UFUNCTION(BlueprintOverride)
    void DoTask()
    {
        Super::DoTask();

        AI.WaitUntilCanMove();

        // Navigate to the crime location. Prefer stored nav positions (populated by the crime
        // perception builder); fall back to Character.NavAgentLocation for synthetic perceptions
        // that may not have AtNavPosition set.
        FVector NavTarget = RememberedPerception.Instigator.AtNavPosition;
        if (NavTarget == FVector::ZeroVector)
            NavTarget = RememberedPerception.Origin.AtNavPosition;
        if (NavTarget == FVector::ZeroVector && IsValid(RememberedPerception.Instigator.Character))
            NavTarget = RememberedPerception.Instigator.Character.NavAgentLocation;
        if (NavTarget == FVector::ZeroVector && IsValid(RememberedPerception.Origin.Character))
            NavTarget = RememberedPerception.Origin.Character.NavAgentLocation;
        if (NavTarget == FVector::ZeroVector && IsValid(RememberedPerception.Affected.Character))
            NavTarget = RememberedPerception.Affected.Character.NavAgentLocation;

        if (Self.CanWalk() && NavTarget != FVector::ZeroVector && AI.CanGotoPosition(NavTarget))
        {
            AI.ItemActionScoringEntryManager.UpdateAvailableItems();
            SetWalkSpeed(EWalkSpeed::Sprinting);

            if (CanEquipWeapons())
            {
                AI.SelectBestItemActionFromInventory();
                WaitForLastTaskToEnd(
                    AI.DrawItem(SelectedItem),
                    AI.GotoPosition(NavTarget, 100.0f)
                );
            }
            else
            {
                AI.GotoPosition(NavTarget, 100.0f);
            }

            SetWalkSpeed(EWalkSpeed::Walking);
        }

        // Turn toward the criminal's last known position, then give the perception binding a
        // short window to fire (criminal may enter LOS after the turn).
        FVector TurnTarget = RememberedPerception.Instigator.AtPosition;
        if (TurnTarget == FVector::ZeroVector)
            TurnTarget = RememberedPerception.Origin.AtPosition;
        if (TurnTarget == FVector::ZeroVector && IsValid(RememberedPerception.Instigator.Character))
            TurnTarget = RememberedPerception.Instigator.Character.ActorLocation;
        if (TurnTarget == FVector::ZeroVector && IsValid(RememberedPerception.Origin.Character))
            TurnTarget = RememberedPerception.Origin.Character.ActorLocation;

        if (TurnTarget != FVector::ZeroVector)
            AI.TurnToPosition(TurnTarget);

        if (IsValid(RememberedPerception.Instigator.CharacterState))
            AI.ForceSightPerception(RememberedPerception.Instigator.CharacterState);

        AI.WaitSeconds(2.5f);

        if (IsValid(RememberedPerception.Instigator.Character))
            AI.TurnToPosition(RememberedPerception.Instigator.Character.ActorLocation);

        AI.WaitSeconds(4.0f);

        if (!bConfrontedCriminal)
            TryConfrontCriminal(RememberedPerception);

        if (!bShouldExitState)
            AI.AssessEvent(GameplayTag::AIEvent_State_Done, RememberedPerception);

        WaitSeconds(3.0f);
    }

    FString GetDisplayName() const override
    {
        return "Investigate Alarm";
    }
}

/** State for an NPC actively searching for a known but unseen theft suspect. The NPC performs
 *  an organic search around the suspect's last known position, until either the suspect is seen
 *  or a long enough time passes and exits to daily routine. */
UCLASS()
class UAIState_TheftPursuit : UAIState_Search
{
    default OwnedGameplayTags.AddTag(GameplayTag::AIState_Conflict_TheftPursuit);
    default AIStateTag = GameplayTag::AIState_Conflict_TheftPursuit;

    UPROPERTY()
    bool bConfrontedCriminal = false;

    /** Total time spent in the search before giving up and exiting to daily routine. */
    UPROPERTY()
    const float LoiterAfterFailedFindSeconds = 60.0f;

    /** Hard cap on how many actual walk steps the organic loiter performs. */
    UPROPERTY(EditDefaultsOnly, Category="TheftPursuit")
    int MaxSearchSteps = 3;

    /** Reject a candidate step if its straight-line length is below this (prevents jitter). */
    UPROPERTY(EditDefaultsOnly, Category="TheftPursuit")
    float MinSearchStepDistance = 180.0f;

    /** Random-nav-point search radius for step candidates. */
    UPROPERTY(EditDefaultsOnly, Category="TheftPursuit")
    float MaxSearchStepDistance = 450.0f;

    /** Anti-cluster guard: reject candidate if angle from previous step direction is below this. */
    UPROPERTY(EditDefaultsOnly, Category="TheftPursuit")
    float MinAngleBetweenStepsDeg = 60.0f;

    /** Anti-wall guard: reject candidate if nav path length / straight-line length exceeds this ratio. */
    UPROPERTY(EditDefaultsOnly, Category="TheftPursuit")
    float MaxStepPathDetourRatio = 2.0f;

    /** Per-step max candidate samples before giving up on this step. */
    UPROPERTY(EditDefaultsOnly, Category="TheftPursuit")
    int MaxStepCandidateAttempts = 8;

    UPROPERTY(EditDefaultsOnly, Category="TheftPursuit")
    float SearchGotoArriveDistance = 80.0f;

    UPROPERTY(EditDefaultsOnly, Category="TheftPursuit")
    float LookAroundInteractionSeconds = 3.5f;

    UPROPERTY(EditDefaultsOnly, Category="TheftPursuit")
    float ScanWaitShortSeconds = 2.0f;

    UPROPERTY(EditDefaultsOnly, Category="TheftPursuit")
    float ScanWaitLongSeconds = 4.0f;

    /** Schedule fractions (of LoiterAfterFailedFindSeconds) at which each phase starts. */
    UPROPERTY(EditDefaultsOnly, Category="TheftPursuit")
    float Phase_Step1_Fraction = 0.15f;

    UPROPERTY(EditDefaultsOnly, Category="TheftPursuit")
    float Phase_TurnAround_Fraction = 0.5f;

    UPROPERTY(EditDefaultsOnly, Category="TheftPursuit")
    float Phase_Step2_Fraction = 0.65f;

    UPROPERTY(EditDefaultsOnly, Category="TheftPursuit")
    float Phase_Step3_Fraction = 0.85f;

    /** Anti-clustering: last accepted step direction (unit, 2D). Zero = none yet. */
    private FVector LastStepDir = FVector::ZeroVector;

    /** One-shot guard for the mid-search "lost perception" bark. */
    private bool bLostPerceptionBarkPlayed = false;

    /** Cycled per look so NPC sweeps multiple bearings around scan center. */
    private int ScanLookIndex = 0;

    UPROPERTY(EditDefaultsOnly, Category="TheftPursuit")
    float ScanSweepTargetDistance = 300.0f;

    /** Per-look azimuth offsets (degrees) around scan-center bearing. Cycled by ScanLookIndex. */
    private float GetScanSweepAngleDeg(int Index) const
    {
        switch (Index % 5)
        {
            case 0:  return 0.0f;
            case 1:  return -55.0f;
            case 2:  return 60.0f;
            case 3:  return -110.0f;
            default: return 120.0f;
        }
    }

    UFUNCTION(BlueprintOverride)
    void SetupPerceptions(UCharacterPerceptionComponent Perception)
    {
        Super::SetupPerceptions(Perception);

        if (IsValid(RememberedPerception.Instigator.CharacterState))
        {
            Perception.SeeSpecificCharacter(RememberedPerception.Instigator.CharacterState)
                .PerceptionGained.BindUFunction(this, n"PerceptionEvent_OnCriminalSeenDuringPursuit");
        }
    }

    UFUNCTION()
    private void PerceptionEvent_OnCriminalSeenDuringPursuit(
        const FRememberedPerception&in Perception,
        const FPerceptionShortTermMemory&in Memory)
    {
        TryConfrontCriminal(Perception);
    }

    void SayRunCowardBark()
    {
        if (!IsValid(AI) || !IsValid(AI.CharacterState))
            return;
        if (AI.CharacterState.IsSpeaking())
            return;

        AGothicCharacterState CriminalState = RememberedPerception.Instigator.CharacterState;
        FGenericVoicelineRequestContext BarkContext;
        AI.CharacterState.Voiceline.SayVoicelineWithContext(
            GameplayTag::Sound_Voice_Reaction_Combat_End_RunCoward,
            CriminalState,
            BarkContext,
            EPerceptionNoiseLoudness::Moderate);
    }

    void SayLostPerceptionBark()
    {
        if (bLostPerceptionBarkPlayed)
            return;
        if (!IsValid(AI) || !IsValid(AI.CharacterState))
            return;
        if (AI.CharacterState.IsSpeaking())
            return;

        bLostPerceptionBarkPlayed = true;

        AGothicCharacterState CriminalState = RememberedPerception.Instigator.CharacterState;
        FGenericVoicelineRequestContext BarkContext;
        AI.CharacterState.Voiceline.SayVoicelineWithContext(
            GameplayTag::Sound_Voice_Reaction_Crime_Thief_LostPerception,
            CriminalState,
            BarkContext,
            EPerceptionNoiseLoudness::Moderate);
    }

    void TryConfrontCriminal(const FRememberedPerception&in SourcePerception)
    {
        if (bConfrontedCriminal || bShouldExitState)
            return;
        if (!IsValid(RememberedPerception.Instigator.CharacterState))
            return;

        bConfrontedCriminal = true;

        FRememberedPerception ConfrontPerception = SourcePerception;
        ConfrontPerception.ContextTags.AppendTags(RememberedPerception.ContextTags);
        if (RememberedPerception.EventTag.MatchesTag(GameplayTag::Crime))
            ConfrontPerception.ContextTags.AddTag(RememberedPerception.EventTag);
        ConfrontPerception.ContextTags.AddTag(GameplayTag::Crime_Theft);
        ConfrontPerception.EventTag = GameplayTag::AIEvent_Guard_ConfrontedCriminalAtCrimeScene;
        ConfrontPerception.Instigator = RememberedPerception.Instigator;
        AI.AssessEventWithExtraTags(ConfrontPerception.EventTag, ConfrontPerception, ConfrontPerception.ContextTags);
    }

    /** Scan center is the last-known suspect position only. */
    FVector ResolveScanCenter() const
    {
        FVector ScanCenter = RememberedPerception.Instigator.AtPosition;
        if (ScanCenter == FVector::ZeroVector)
            ScanCenter = RememberedPerception.Origin.AtPosition;
        if (ScanCenter == FVector::ZeroVector)
            ScanCenter = Self.ActorLocation;
        return ScanCenter;
    }

    bool ExitEarly() const
    {
        return bConfrontedCriminal || bShouldExitState;
    }

    /** Sleep current coroutine until either the deadline elapses or an exit condition trips.
     *  Tick-polled so confrontation flips break out within one tick. */
    void WaitUntilDeadlineOrExit(FInGameTime Deadline)
    {
        while (!Deadline.IsTimeInThePast() && !ExitEarly())
            WaitOneTick();
    }

    /** Turn target ~180 degrees from current facing so the NPC scans the space behind it. */
    FVector TurnAround180Target() const
    {
        if (!IsValid(Self))
            return FVector::ZeroVector;
        FVector Fwd = Self.GetActorForwardVector();
        Fwd.Z = 0.0f;
        if (Fwd.IsNearlyZero())
            Fwd = FVector(1.0f, 0.0f, 0.0f);
        return Self.ActorLocation - Fwd.GetSafeNormal() * 300.0f;
    }

    /** Sweeps multiple bearings around the scan-center bearing so the NPC never stares at the same point twice in a row. */
    FVector GetSweptScanTarget()
    {
        FVector Center = ResolveScanCenter();
        FVector ToCenter = Center - Self.ActorLocation;
        ToCenter.Z = 0.0f;
        FVector BaseDir = ToCenter.GetSafeNormal();
        if (BaseDir.IsNearlyZero())
        {
            BaseDir = Self.GetActorForwardVector();
            BaseDir.Z = 0.0f;
            BaseDir = BaseDir.GetSafeNormal();
            if (BaseDir.IsNearlyZero())
                BaseDir = FVector(1.0f, 0.0f, 0.0f);
        }

        float AngleDeg = GetScanSweepAngleDeg(ScanLookIndex);
        ++ScanLookIndex;

        FVector Rotated = BaseDir.RotateAngleAxis(AngleDeg, FVector::UpVector);
        return Self.ActorLocation + Rotated * ScanSweepTargetDistance;
    }

    /** Pick a reachable and far enough navigable step that. */
    bool TryPickOrganicStep(FVector&out OutNavPoint)
    {
        if (!IsValid(CharacterState) || !IsValid(Self))
            return false;

        float MinAngleCos = Math::Cos(MinAngleBetweenStepsDeg * (PI / 180.0f));

        for (int Attempt = 0; Attempt < MaxStepCandidateAttempts; ++Attempt)
        {
            FVector Cand;
            if (!UNavigationSystemV1::TryGetRandomNavigablePointInRadius(
                    CharacterState, Self.NavAgentLocation, MaxSearchStepDistance, Cand))
                continue;

            FVector Dir = Cand - Self.ActorLocation;
            Dir.Z = 0.0f;
            float Len = Dir.Size();
            if (Len < MinSearchStepDistance)
                continue;

            FVector DirN = Dir.GetSafeNormal();
            if (!LastStepDir.IsNearlyZero())
            {
                float Dot = DirN.DotProduct(LastStepDir);
                if (Dot > MinAngleCos)
                    continue;
            }

            if (!AI.CanGotoPosition(Cand, SearchGotoArriveDistance))
                continue;

            float DetourThreshold = Len * MaxStepPathDetourRatio;
            float32 PathDistance = 0.0f;
            bool bWithinDetour = UNavigationSystemV1::DoesPathExistWithinLengthLimit(
                Self, Self.NavAgentLocation, Cand, DetourThreshold, PathDistance);
            if (!bWithinDetour)
                continue;

            OutNavPoint = Cand;
            LastStepDir = DirN;
            return true;
        }

        return false;
    }

    /** Walk one organic step (if pickable), then turn back toward scan center and look around. */
    bool TryStepAndScan()
    {
        if (!Self.CanWalk())
            return false;

        FVector NavPoint;
        if (!TryPickOrganicStep(NavPoint))
            return false;

        AI.GotoPosition(NavPoint, SearchGotoArriveDistance);
        if (ExitEarly())
            return true;

        AI.TurnToPosition(GetSweptScanTarget());
        AI.TryInteractionWithoutSpot(
            GameplayTag::Action_Ambient_LookAround,
            LookAroundInteractionSeconds);
        return true;
    }

    /** Scheduled organic search loiter. */
    void PerformActiveSearchLoiter()
    {
        AI.UndrawWeapon();
        SetWalkSpeed(EWalkSpeed::Walking);

        LastStepDir = FVector::ZeroVector;
        bLostPerceptionBarkPlayed = false;
        ScanLookIndex = 0;

        const float Total = LoiterAfterFailedFindSeconds;
        FInGameTime LoiterDeadline = FInGameTime::XRealtimeSecondsFromNow(Total);
        FInGameTime DeadlineStep1  = FInGameTime::XRealtimeSecondsFromNow(Total * Phase_Step1_Fraction);
        FInGameTime DeadlineTurn   = FInGameTime::XRealtimeSecondsFromNow(Total * Phase_TurnAround_Fraction);
        FInGameTime DeadlineStep2  = FInGameTime::XRealtimeSecondsFromNow(Total * Phase_Step2_Fraction);
        FInGameTime DeadlineStep3  = FInGameTime::XRealtimeSecondsFromNow(Total * Phase_Step3_Fraction);

        int StepsTaken = 0;

        // Phase A: settle, look toward scan center, short wait.
        if (ExitEarly()) return;
        AI.TurnToPosition(GetSweptScanTarget());
        AI.TryInteractionWithoutSpot(
            GameplayTag::Action_Ambient_LookAround,
            LookAroundInteractionSeconds);
        if (ExitEarly()) return;
        AI.WaitSeconds(ScanWaitShortSeconds);

        // Phase B: first walk step.
        WaitUntilDeadlineOrExit(DeadlineStep1);
        if (ExitEarly()) return;
        if (StepsTaken < MaxSearchSteps && TryStepAndScan())
            ++StepsTaken;

        // Phase C: turn around, bark LostPerception once, search anim, long wait.
        WaitUntilDeadlineOrExit(DeadlineTurn);
        if (ExitEarly()) return;
        AI.TurnToPosition(TurnAround180Target());
        SayLostPerceptionBark();
        AI.TryInteractionWithoutSpot(
            GameplayTag::Action_Ambient_SearchAround,
            LookAroundInteractionSeconds);
        if (ExitEarly()) return;
        AI.WaitSeconds(ScanWaitLongSeconds);

        // Phase D: second walk step.
        WaitUntilDeadlineOrExit(DeadlineStep2);
        if (ExitEarly()) return;
        if (StepsTaken < MaxSearchSteps && TryStepAndScan())
            ++StepsTaken;

        // Phase E: optional third walk step.
        WaitUntilDeadlineOrExit(DeadlineStep3);
        if (ExitEarly()) return;
        if (StepsTaken < MaxSearchSteps && TryStepAndScan())
            ++StepsTaken;

        // Drain whatever budget remains; sight binding can still fire during this idle tail.
        WaitUntilDeadlineOrExit(LoiterDeadline);
    }

    UFUNCTION(BlueprintOverride)
    void DoTask()
    {
        Super::DoTask();

        AI.WaitUntilCanMove();

        // Navigate to the suspect's last known position.
        FVector NavTarget = RememberedPerception.Instigator.AtNavPosition;
        if (NavTarget == FVector::ZeroVector)
            NavTarget = RememberedPerception.Origin.AtNavPosition;

        if (Self.CanWalk() && NavTarget != FVector::ZeroVector && AI.CanGotoPosition(NavTarget))
        {
            AI.ItemActionScoringEntryManager.UpdateAvailableItems();
            SetWalkSpeed(EWalkSpeed::Sprinting);

            if (CanEquipWeapons())
            {
                AI.SelectBestItemActionFromInventory();
                WaitForLastTaskToEnd(
                    AI.DrawItem(SelectedItem),
                    AI.GotoPosition(NavTarget, 100.0f)
                );
            }
            else
            {
                AI.GotoPosition(NavTarget, 100.0f);
            }

            SetWalkSpeed(EWalkSpeed::Walking);
        }

        // Turn toward the last-known position.
        FVector TurnTarget = RememberedPerception.Instigator.AtPosition;
        if (TurnTarget == FVector::ZeroVector)
            TurnTarget = RememberedPerception.Origin.AtPosition;
        if (TurnTarget != FVector::ZeroVector)
            AI.TurnToPosition(TurnTarget);

        AI.WaitSeconds(2.5f);

        if (TurnTarget != FVector::ZeroVector)
            AI.TurnToPosition(TurnTarget);

        AI.WaitSeconds(4.0f);

        if (!bConfrontedCriminal)
        {
            SayRunCowardBark();
            PerformActiveSearchLoiter();

            if (!bConfrontedCriminal)
            {
                auto CrimeProcessing = Cast<UCrimeProcessingSubsystem_Human>(UCrimeProcessingSubsystem_Human::Get());
                AGothicCharacterState CriminalState = RememberedPerception.Instigator.CharacterState;
                if (IsValid(CrimeProcessing) && IsValid(CharacterState) && IsValid(CriminalState))
                {
                    CrimeProcessing.SuppressWitnessRelativeCrimes(
                        CharacterState,
                        CriminalState,
                        GameplayTag::Crime_Theft,
                        bAnyCriminal = false,
                        bLatestOnly = false);
                }
            }
        }

        if (!bShouldExitState)
            AI.AssessEvent(GameplayTag::AIEvent_State_Done, RememberedPerception);

        WaitSeconds(3.0f);
    }

    FString GetDisplayName() const override
    {
        return "Theft Pursuit";
    }
}

/** State in which the AI will turn to the non sensed instigator of an attack */
UCLASS()
class UAIState_TurnToAttacker : UAIState_Conflict
{
    default AssessmentModuleClass = UAIARM_State_TurnToAttacker;

    default OwnedGameplayTags.AddTag(GameplayTag::AIState_Conflict_TurnToAttacker);
    default AIStateTag = GameplayTag::AIState_Conflict_TurnToAttacker;
    default OwnedGameplayTags.AddTag(GameplayTag::State_HighAlert);

    default SwitchAIStateMode = ESwitchAIStateMode::EndState_Cancel;
    default EndInteractionMode = ESwitchAIStateEndInteractionMode::EndAnyOngoingInteraction_Instant;

    default DefaultConflictType = EConflictType::None;

    default bMemorizeStateUsage = true;

    UPROPERTY()
    const float PercentDamageThreshold = 20.0f;

    UPROPERTY()
    const float PercentHPLeftThreshold = 50.0f;

    UPROPERTY()
    const bool bAlwaysDisengageOnUnreachable = true;

    bool bSeenAttacker = false;

    UPROPERTY()
    private bool bExitAssessmentDone = false;

    UFUNCTION(BlueprintOverride)
    void SetupPerceptions(UCharacterPerceptionComponent Perception)
    {
        Super::SetupPerceptions(Perception);
        
        Perception.HitOnSelf().PerceptionGained.BindUFunction(this, n"PerceptionEvent_Hit");
        Perception.SeeSpecificCharacter(RememberedPerception.Instigator.CharacterState).PerceptionGained.BindUFunction(this, n"PerceptionEvent_OnAttackerSeen");
    }

    UFUNCTION(BlueprintOverride)
    void DoTask() final
    {
        Super::DoTask();

        if (CharacterState.IsDead() || CharacterState.IsDefeated())
        {
            EndTaskAsFailure();
            return;
        }

        /// If bAlwaysDisengageOnUnreachable and unreachable, Disengage
        /// If (damage > %dmgthreshold OR currentHP < %hpthreshold) AND unreachable, Disengage
        /// If hit again during this state and unreachable, Disengage

        /// Go to attacker if possible
        /// If no path or attaker not found, go to daily routine
        /// If attacker found, go to combat (unreachable will be taken care of by combat behavior set)        

        // TODO account for range options without weapon like throwing stones
        AssessInitialHitDisengage();

        if (!bExitAssessmentDone)
        {
            auto LocationOfInterest = RememberedPerception.Instigator.Character.GetNavAgentLocation();
            auto InstigatorCharacter = RememberedPerception.Instigator.Character;

            AI.WaitUntilCanMove();
            AI.WaitUntilNoLongerBlocked();

            AI.ItemActionScoringEntryManager.UpdateAvailableItems();

            if (CanEquipWeapons())
            {
                AI.SelectBestItemActionFromInventory();
                WaitForLastTaskToEnd(
                        AI.DrawItem(SelectedItem),
                        AI.TurnToPosition(LocationOfInterest)
                );
            }
            else
            {
                AI.TurnToPosition(LocationOfInterest);
            }

            AI.TargetCharacter(InstigatorCharacter, FocusPriority, this);

            if (Self.CanWalk())
            {
                // AI.Character.FocalPointComponent.SetFocalPoint(LocationOfInterest, EGothicFocusPriority::PerceptionResponse, EGothicFocalPointMode::PointOfInterest);

                WaitSeconds(0.2f);
                if (AI.Character.Perception.CanSee(InstigatorCharacter))
                {
                    WaitSeconds(1.0f);
                }

                SetWalkSpeed(EWalkSpeed::Running);

                if (CanReachCharacter(InstigatorCharacter.CharacterState, LocationOfInterest))
                {
                    AI.GotoPosition(LocationOfInterest, 200.0f).While(n"HasNotSeenAttacker");
                }
            
                WaitSeconds(2.0f);
                // AI.Character.FocalPointComponent.ClearFocalPoint(EGothicFocusPriority::PerceptionResponse);
            }
            else
            {
                // AI.Character.FocalPointComponent.SetFocalPoint(LocationOfInterest, EGothicFocusPriority::PerceptionResponse, EGothicFocalPointMode::PointOfInterest);
                WaitSeconds(3.5f);
                // AI.Character.FocalPointComponent.ClearFocalPoint(EGothicFocusPriority::PerceptionResponse);
            }

            auto Enemies = AI.GetSensedLivingEnemies();
            auto Hostiles = AI.GetSensedLivingHostiles();

            if (Hostiles.Num() > 0 && Enemies.IsEmpty())
            {
                AI.AssessEvent(GameplayTag::AIEvent_Sensed_NoEnemiesSomeHostile, RememberedPerception);
            }
            else if (Enemies.IsEmpty() && bAlwaysDisengageOnUnreachable && 
                !CanCharacterBeReachedBy(RememberedPerception.Affected.CharacterState, RememberedPerception.Instigator.CharacterState, LocationOfInterest) &&
                !CanReachCharacter(InstigatorCharacter.CharacterState, LocationOfInterest))
            {
                RememberedPerception.Instigator.Character = InstigatorCharacter;
                RememberedPerception.Instigator.AtPosition = LocationOfInterest;
                AI.AssessEvent(GameplayTag::AIEvent_Disengage_Sprinting, RememberedPerception);
            }
            else if (Enemies.IsEmpty())
            {
                AI.AssessEvent(GameplayTag::AIEvent_Sensed_NoEnemiesNoHostiles, RememberedPerception);
            }
        }

        // Wait until assessment takes us out of the state
        WaitSeconds(3.0f);
    }

    UFUNCTION()
    void AssessInitialHitDisengage()
    {
        /// If bAlwaysDisengageOnUnreachable and unreachable / not same territory, Disengage
        /// If (damage > %dmgthreshold OR currentHP < %hpthreshold) AND unreachable / not same territory, Disengage
        /// If already done turn to attacker state in the last 30 seconds AND unreachable / not same territory, Disengage

        // If reachable && same territory, no disengage
        FVector Location;
        if ((CanCharacterBeReachedBy(RememberedPerception.Affected.CharacterState, RememberedPerception.Instigator.CharacterState, Location) || AI.Character.Inventory.HasUsableRangedWeaponInInventory()) &&
            AI.IsInSameTerritoryOrCombatRadiusAsOtherCharacter(RememberedPerception.Instigator.Character))
            return;

        /// If !bAlwaysDisengageOnUnreachable and not done turn to attacker (30s) and no threshold is met, no disengage
        if (!bAlwaysDisengageOnUnreachable &&
            GetTimesAIStateStarted(30.0f) <= 1 &&
            Self.GetHealthAttribute() / Self.GetMaxHealthAttribute() * 100.0f >= PercentHPLeftThreshold &&
            RememberedPerception.Magnitude / Self.GetMaxHealthAttribute() * 100.0f < PercentDamageThreshold)
            return;

        AI.AssessEvent(GameplayTag::AIEvent_Disengage_Sprinting, RememberedPerception);
        bExitAssessmentDone = true;
    }

    UFUNCTION()
    void AssessSecondHitDisengage()
    {
        FVector Location;
        if ((CanCharacterBeReachedBy(RememberedPerception.Affected.CharacterState, RememberedPerception.Instigator.CharacterState, Location) || AI.Character.Inventory.HasUsableRangedWeaponInInventory()) &&
            AI.IsInSameTerritoryOrCombatRadiusAsOtherCharacter(RememberedPerception.Instigator.Character))
            return;

        AI.AssessEvent(GameplayTag::AIEvent_Disengage_Sprinting, RememberedPerception);
        bExitAssessmentDone = true;
    }

    UFUNCTION()
    bool HasNotSeenAttacker() const
    {
        return !bSeenAttacker;
    }

    UFUNCTION()
    private void PerceptionEvent_Hit(const FRememberedPerception&in Perception,
                                     const FPerceptionShortTermMemory&in Memory)
    {
        AssessSecondHitDisengage();
    }

    UFUNCTION()
    private void PerceptionEvent_OnAttackerSeen(const FRememberedPerception&in Perception, const FPerceptionShortTermMemory&in Memory)
    {
        if (!IsValid(Perception.Origin.CharacterState))
            return;

        if (Perception.Origin.CharacterState.IsDead())
        {
            bSeenAttacker = true;
            AI.AssessEvent(GameplayTag::AIEvent_State_Done, RememberedPerception);
            bExitAssessmentDone = true;
            return;
        }

        bSeenAttacker = true;
        FGameplayTagContainer EventExtraTags;
        EventExtraTags.AddTag(StartingAssessmentTag);
        AI.AssessEventWithExtraTags(GameplayTag::AIEvent_Seen_Attacker, RememberedPerception, EventExtraTags);
        bExitAssessmentDone = true;
    }

    UFUNCTION()
    bool CanReachCharacter(AGothicCharacterState OtherCharacterState, FVector&out Location)
    {
        return CanCharacterBeReachedBy(OtherCharacterState, AI.CharacterState, Location);
    }

    UFUNCTION()
    bool CanCharacterBeReachedBy(AGothicCharacterState TargetCharacterState, AGothicCharacterState ByCharacterState, FVector&out Location)
    {
        if (!IsValid(TargetCharacterState.Character) || !IsValid(ByCharacterState.Character))
            return false;

        float HorizontalReach = 150.0f;
        float VerticalReach = ByCharacterState.Character.SimpleCollisionHalfHeight * 3;
        if (AI.MaximumRangedAttackHorizontalDistance > 0.0f &&
            (!AI.bRangedAttackRequiresRangedWeapon ||
             ByCharacterState.Inventory.HasRangedWeaponInInventory() ||
             ByCharacterState.Character.HasDrawnRangedWeapon()))
        {
            HorizontalReach = AI.MaximumRangedAttackHorizontalDistance;
            VerticalReach = 1000.0f;
        }

        if (UNavigationSystemV1::CanTargetBeReached3D(
                ByCharacterState.Character, 
                TargetCharacterState.Character, 
                HorizontalReach, 
                VerticalReach, 
                false, Location))
        {
            return true;
        }

        return false;
    }

    FString GetDisplayName() const override
    {
        return "Turn to Attacker";
    }
}

UCLASS()
class UAIState_TurnToAttacker_Creature : UAIState_TurnToAttacker
{

}

UCLASS()
class UAIState_TurnToAttacker_NoDisengage : UAIState_TurnToAttacker_Creature
{
    default bAlwaysDisengageOnUnreachable = false;
}

UCLASS()
class UAIState_TurnToAttacker_HumanOrc : UAIState_TurnToAttacker
{
    default bAlwaysDisengageOnUnreachable = false;
}

class UAIState_IdentifySmell : UAIState_Search
{
    default AssessmentModuleClass = UAIARM_State_Investigate;
    default OwnedGameplayTags.AddTag(GameplayTag::AIState_Conflict_IdentifySmell);
    default AIStateTag = GameplayTag::AIState_Conflict_IdentifySmell;

    UPROPERTY()
    const UTerritoryConfig SearchTerritory;

    FVector LastKnownPosition;

    UFUNCTION(BlueprintOverride)
    void DoTask()
    {
        Super::DoTask();
        SearchTerritory = AI.GetCurrentTerritory();
        if (!IsValid(SearchTerritory))
        {
            AssessStateDone();
            return;
        }            

        if (AI.CanSmellHere())
        {
            AI.SmellHere();
        }
        else
        {
            WaitSeconds(0.5f);
        }

        if (CharacterState.HasGameplayTag(GameplayTag::Debuff_Blind))
        {
            AssessStateDone();
            return;
        }

        if (IsValid(RememberedPerception.PerceivedObject.ItemDefinition))
        {
            // Smelled Item

            AI.TurnToPosition(RememberedPerception.Origin.AtPosition);
            AI.WaitSeconds(1.0f);
            AI.GotoPosition(RememberedPerception.Origin.AtPosition);
            AI.WaitSeconds(2.0f);
        }
        else if (IsValid(RememberedPerception.Origin.CharacterState))
        {
            LastKnownPosition = RememberedPerception.Origin.Character.ActorLocation;

            // Smelled character
            if (AI.CharacterState.Relationship.GetHostilityTowards(RememberedPerception.Origin.CharacterState) == ERelationshipHostility::Prey)
            {
                AI.AssessEvent(GameplayTag::AIEvent_Smelled_Predator, RememberedPerception);
                WaitSeconds(2.0f);
                EndTaskAsSuccess();
                return;
            }

            AI.TurnToPosition(RememberedPerception.Origin.AtPosition);
            AI.WaitSeconds(1.0f);
            AI.StartFollowingActor(RememberedPerception.Origin.Character, 100.0f);

            while (!AI.Character.Perception.CanSee(RememberedPerception.Origin.Character) && 
                AI.Character.Perception.GetAwarenessToCharacter(RememberedPerception.Origin.Character, EPerceptionSense::Smell) > 60.0f &&
                RememberedPerception.Origin.CharacterState.IsCharacterStateWithinTerritory(SearchTerritory))
            {
                WaitOneTick();
            }

            AI.StopFollowingActor();
        }

        AssessStateDone();
    }

    void AssessStateDone()
    {
        AI.AssessEvent(GameplayTag::AIEvent_State_Done, RememberedPerception);
        WaitSeconds(3.0f);
    }

    void MoveToSource()
    {

    }

    UFUNCTION(BlueprintOverride)
    void HandleStateEnded(EGenericTaskResult Result)
    {
        if (RememberedPerception.Origin.Character == nullptr)
            return;
        
        if (!AI.IsFollowingActor(RememberedPerception.Origin.Character))
            return;

        AI.StopFollowingActor(RememberedPerception.Origin.Character);  
    }

    FString GetDisplayName() const override
    {
        return "Identify Smell";
    }
}

class UAIState_IdentifySmell_NoConflict : UAIState_IdentifySmell
{
    default OwnedGameplayTags.AddTag(GameplayTag::AIState_IdentifySmell);
    default AIStateTag = GameplayTag::AIState_IdentifySmell;

    default OwnedGameplayTags.AddTag(GameplayTag::Debuff_Distracted);
    default OwnedGameplayTags.AddTag(GameplayTag::Debuff_ReducedSense_Hearing);
}