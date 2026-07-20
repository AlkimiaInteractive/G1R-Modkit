/** Phase of guide behavior when the following character has abandoned. */
enum EGuideAbandonPhase
{
    /** Normal guiding or just returned. */
    Guiding = 0,
    /** Waiting at current spot before returning to terminus. */
    WaitingAtPlace = 1,
    /** Walking back to path start or end. */
    ReturningToTerminus = 2,
    /** At path start/end; either waiting for player or about to switch routine. */
    AtTerminus = 3
};

class UAIValueSet_Guide : UAIValueSet
{
    UPROPERTY(SaveGame)
    EGuideAbandonPhase AbandonPhase = EGuideAbandonPhase::Guiding;

    UPROPERTY(SaveGame)
    int PersistedSpotIdx = 0;

    UPROPERTY(SaveGame)
    int PersistedMaxSpotIdx = 0;
}

/**
 * Guides the given character to the given waypoint. Stops when the destination is reached or will return to either start or end location when following actor abandons guide
 */
UCLASS()
class UAIState_GuideCharacter : UAIState_GoToAlongFreepoints 
{
    default OwnedGameplayTags.AddLeafTag(GameplayTag::AIState_Guide);
    default OwnedGameplayTags.AddTag(GameplayTag::State_NeverMumble);
    default OwnedGameplayTags.AddTag(GameplayTag::Smalltalk_Blocked);
    
    default AssessmentModuleClass = UAIARM_GuidingCharacter;

    UAIState_GuideCharacter(TArray<FGoToFreepoint> InGoAlongFreepoints, FName InFollowCharacterUniqueName, float InCloseDistance = 500.f, float InWaitingDistance = 1000.f, 
    float InAbandonDistance = 3000.f, TSubclassOf<UItemDefinition> InTryTakeOutItemIfPossible = nullptr)
    {
        GoAlongFreepoints = InGoAlongFreepoints;
        FollowCharacterUniqueName = InFollowCharacterUniqueName;
        CloseDistance = InCloseDistance;
        WaitDistance = InWaitingDistance;
        AbandonDistance = InAbandonDistance;
        TryTakeOutItemIfPossible = InTryTakeOutItemIfPossible;
    }

    /** The unique name of the character that should follow the guide */
    UPROPERTY()
    FName FollowCharacterUniqueName;

    /** When the guide is waiting for the following character, the latter must be within this distance for both to contine their journey */
    UPROPERTY()
    float CloseDistance = 500.f;

    /** When following character leaves this distace, the guide will start waiting for him */
    UPROPERTY()
    float WaitDistance = 1200.f;

    /** When following character leaves this distance, the guide considers him lost and will start walking the chain of freepoints backwards. */
    UPROPERTY()
    float AbandonDistance = 2500.f;

    /** Distance at which the guide will proactively engage hostile creatures (Solution 3 & 5) */
    UPROPERTY()
    float ThreatDetectionDistance = 1500.f;

    /** Real-time seconds to wait at current spot after follower abandons. If <= 0, guide returns immediately. */
    UPROPERTY()
    float WaitAtPlaceDurationSeconds = 0.f;

    /** State to run while waiting at place. */
    UPROPERTY()
    TSubclassOf<UCharacterAIState> WaitAtPlaceAction = UAIState_StandAround::StaticClass();

    /** If true, wen follower abandons, the guide will return to path start (index 0); if false, continue to path end (last index). */
    UPROPERTY()
    bool bReturnToPathStart = true;

    /** Movement speed when the guide is going to terminus after the player abandons. */
    UPROPERTY()
    EWalkSpeed ReturnWalkSpeed = EWalkSpeed::Running;

    UPROPERTY()
    protected AGothicCharacterState CharacterToGuide;

    /** Getter for assessment conditions to access the character being guided */
    UFUNCTION()
    AGothicCharacterState GetCharacterToGuide() const
    {
        return CharacterToGuide;
    }

    /** Highest forward waypoint index reached while guiding; used so we resume from furthest progress when player returns during wait or abandon. */
    UPROPERTY()
    protected int32 MaxGuidedSpotIdx = 0;

    UPROPERTY()
    bool bLostFollowingCharacter = false;

    /** Current abandon phase; used when player has left. Restored from persistence on load. */
    UPROPERTY()
    protected EGuideAbandonPhase AbandonPhase = EGuideAbandonPhase::Guiding;

    /** Wait-at-place ends at this time (realtime). Used only in-session; after load we treat wait as expired. */
    UPROPERTY()
    protected FInGameTime WaitAtPlaceEndTime = FInGameTime::Invalid();

    /** Take out this item at the beginning and put it back when reached the goal. If it's not present in inventory it will be added */
    UPROPERTY()
	TSubclassOf<UItemDefinition> TryTakeOutItemIfPossible;

    UFUNCTION(BlueprintOverride)
    void SetupPerceptions(UCharacterPerceptionComponent Perception)
    {
        // React when our follower is being attacked (via seen attack hits)
        Perception.JustSeenAttackHitOtherWithMeleeWeapon()
            .PerceptionGained.BindUFunction(this, n"HandleFollowerAttacked");
        Perception.JustSeenAttackHitOtherWithFists()
            .PerceptionGained.BindUFunction(this, n"HandleFollowerAttacked");
        Perception.JustSeenAttackHitOtherWithRangedWeapon()
            .PerceptionGained.BindUFunction(this, n"HandleFollowerAttacked");
    }

    /** Called when someone else is hit and check if it's the follower being attacked by a hostile/enemy CREATURE */
    UFUNCTION()
    private void HandleFollowerAttacked(const FRememberedPerception&in Perception,
                                         const FPerceptionShortTermMemory&in Memory)
    {
        if (!IsValid(AI) || !IsValid(CharacterToGuide))
            return;

        // Check if the affected character is our follower
        if (!IsValid(Perception.Affected.CharacterState) || 
            Perception.Affected.CharacterState != CharacterToGuide)
            return;

        // Only defend the follower against CREATURES, not humans
        // For human attackers, normal faction/guild rules should apply
        if (!IsValid(Perception.Instigator.CharacterState))
            return;

        if (!Perception.Instigator.CharacterState.HasGameplayTag(GameplayTag::Species_Creature))
            return;

        // Only defend against HOSTILE or ENEMY creatures
        // This handles: summoned creatures attacking follower (shouldn't happen but safety), neutral creatures, etc.
        ERelationship Relationship = AI.CharacterState.Relationship.GetRelationshipTowards(Perception.Instigator.CharacterState);
        if (Relationship == ERelationship::Neutral || Relationship == ERelationship::Friend)
            return;

        AI.AssessEvent(GameplayTag::AIEvent_Seen_AttackHit_OnOther, Perception);
    }

    UFUNCTION(BlueprintOverride, meta=(NoSuperCall))
    void DoTask()
    {
        if(!InitTask())
        {
            EndTaskAsFailure();
            return;
        }

        if (IsOnTerminusSpot())
        {
            HandleAtTerminus();
            return;
        }

        RestoreAbandonPhaseFromPersistence();

        TryTakeOutItem();

        bLostFollowingCharacter = FollowingCharacterHasAbandoned();
        if (!bLostFollowingCharacter)
        {
            if (AbandonPhase == EGuideAbandonPhase::ReturningToTerminus && !FollowingCharacterIsNotWithinResumeDistance())
            {
                AbandonPhase = EGuideAbandonPhase::Guiding;
                // TargetSpotIdx will be set by DetermineCurrentGoalIdx below.
            }
            else if (AbandonPhase != EGuideAbandonPhase::ReturningToTerminus && AbandonPhase != EGuideAbandonPhase::AtTerminus)
            {
                AbandonPhase = EGuideAbandonPhase::Guiding;
            }
        }

        // Use forward index whenever we're guiding or about to wait, so resume-from-wait keeps the correct "next" waypoint. Only when returning/at terminus do we rely on persisted TargetSpotIdx from Restore.
        if (AbandonPhase != EGuideAbandonPhase::ReturningToTerminus && AbandonPhase != EGuideAbandonPhase::AtTerminus)
        {
            TargetSpotIdx = DetermineCurrentGoalIdx(true);
            MaxGuidedSpotIdx = TargetSpotIdx;
        }

        while (GoAlongFreepoints.IsValidIndex(TargetSpotIdx))
        {
            RestoreAbandonPhaseFromPersistence();

            bLostFollowingCharacter = FollowingCharacterHasAbandoned();
            if (!bLostFollowingCharacter)
            {
                // Handle abandon phase transitions
                if (AbandonPhase == EGuideAbandonPhase::ReturningToTerminus && !FollowingCharacterIsNotWithinResumeDistance())
                {
                    // Player returned while we were returning to terminus; resume guiding forward from the correct next waypoint.
                    AbandonPhase = EGuideAbandonPhase::Guiding;
                    TargetSpotIdx = Math::Min(MaxGuidedSpotIdx, GoAlongFreepoints.Num() - 1);
                    if (IsValid(AI))
                    {
                        auto GuideStorage = AI.PermanentStorage(UAIValueSet_Guide);
                        GuideStorage.AbandonPhase = EGuideAbandonPhase::Guiding;
                        GuideStorage.PersistedSpotIdx = 0;
                        GuideStorage.PersistedMaxSpotIdx = 0;
                    }
                }
                else if (AbandonPhase != EGuideAbandonPhase::ReturningToTerminus && AbandonPhase != EGuideAbandonPhase::AtTerminus)
                {
                    AbandonPhase = EGuideAbandonPhase::Guiding;
                }
            }

            if (CheckAndHandleNearbyThreats())
                return;

            SetPreferredLocationToCurrentTarget();
            SetWalkSpeedCurrentGoal(TargetSpotIdx);

            if (bLostFollowingCharacter)
            {
                if (AbandonPhase == EGuideAbandonPhase::AtTerminus)
                {
                    HandleAtTerminus();
                    return;
                }
                if (AbandonPhase == EGuideAbandonPhase::Guiding && WaitAtPlaceDurationSeconds > 0.f)
                {
                    RunWaitAtPlacePhase();
                    if (bShouldExitState)
                        return;
                    if (AbandonPhase == EGuideAbandonPhase::WaitingAtPlace)
                    {
                        AbandonPhase = EGuideAbandonPhase::ReturningToTerminus;
                        AdjustTargetSpotIdxForReturn();
                    }
                }
                else if (AbandonPhase == EGuideAbandonPhase::Guiding)
                {
                    AbandonPhase = EGuideAbandonPhase::ReturningToTerminus;
                    AdjustTargetSpotIdxForReturn();
                }

                if (AbandonPhase == EGuideAbandonPhase::ReturningToTerminus)
                {
                    GoToTerminus();
                    if (bShouldExitState)
                        return;
                }
            }
            else if (AbandonPhase == EGuideAbandonPhase::ReturningToTerminus)
            {
                GoToTerminus();
                if (bShouldExitState)
                    return;
            }
            else
            {
                GuideCharacterForward();
            }
        }

        if (IsOnTerminusSpot())
        {
            HandleAtTerminus();
        }
        else
        {
            EndTaskAsCancelled();
        }
    }

    UFUNCTION(BlueprintOverride)
    void HandleAvatarChanged()
    {
        if (IsOnTerminusSpot())
        {
            TryPutAwayItem();
        }
        else
        {
            TryTakeOutItem();
        }
    }

    /** Adjust TargetSpotIdx so it points toward the terminus when starting the return walk.
     *  When returning to start: step backward from the current forward target.
     *  When continuing to end: TargetSpotIdx already points forward, no adjustment needed. */
    void AdjustTargetSpotIdxForReturn()
    {
        if (bReturnToPathStart)
            TargetSpotIdx = Math::Max(0, TargetSpotIdx - 1);
    }

    UFUNCTION()
    void RestoreAbandonPhaseFromPersistence()
    {
        if (!IsValid(AI))
            return;

        auto GuideStorage = AI.PermanentStorage(UAIValueSet_Guide);
        EGuideAbandonPhase PersistedPhase = GuideStorage.AbandonPhase;
        int32 PersistedSpotIdx = GuideStorage.PersistedSpotIdx;
        int32 PersistedMaxSpotIdx = GuideStorage.PersistedMaxSpotIdx;
        if (PersistedPhase == EGuideAbandonPhase::Guiding)
            return;
        AbandonPhase = PersistedPhase;
        MaxGuidedSpotIdx = Math::Max(MaxGuidedSpotIdx, Math::Clamp(PersistedMaxSpotIdx, 0, GoAlongFreepoints.Num() - 1));
        if (PersistedPhase == EGuideAbandonPhase::WaitingAtPlace)
        {
            AbandonPhase = EGuideAbandonPhase::ReturningToTerminus;
            TargetSpotIdx = Math::Clamp(PersistedSpotIdx, 0, GoAlongFreepoints.Num() - 1);
        }
        else if (PersistedPhase == EGuideAbandonPhase::ReturningToTerminus || PersistedPhase == EGuideAbandonPhase::AtTerminus)
        {
            TargetSpotIdx = Math::Clamp(PersistedSpotIdx, 0, GoAlongFreepoints.Num() - 1);
        }
    }

    UFUNCTION()
    bool ShouldContinueWaitAtPlace() const
    {
        if (!IsValid(CharacterToGuide) || !IsValid(CharacterState))
            return false;
        if (!FollowingCharacterIsNotClose())
            return false;
        if (!WaitAtPlaceEndTime.IsValid() || !FInGameTime::IsBefore(FInGameTime::Now(), WaitAtPlaceEndTime))
            return false;
        return true;
    }

    /** Wait at current spot for WaitAtPlaceDurationSeconds (real time); run WaitAtPlaceAction as substate.
     *  After load/LOD, RestoreAbandonPhaseFromPersistence converts WaitingAtPlace to ReturningToTerminus,
     *  so we never resume inside the substate. */
    UFUNCTION()
    void RunWaitAtPlacePhase()
    {
        AbandonPhase = EGuideAbandonPhase::WaitingAtPlace;
        if (IsValid(AI))
        {
            auto GuideStorage = AI.PermanentStorage(UAIValueSet_Guide);
            GuideStorage.AbandonPhase = AbandonPhase;
            GuideStorage.PersistedSpotIdx = TargetSpotIdx;
            GuideStorage.PersistedMaxSpotIdx = MaxGuidedSpotIdx;
        }

        WaitAtPlaceEndTime = FInGameTime::XRealtimeSecondsFromNow(WaitAtPlaceDurationSeconds);

        while (!bShouldExitState && FollowingCharacterHasAbandoned())
        {
            if (!IsValid(CharacterToGuide) || !IsValid(CharacterState))
            {
                AbandonPhase = EGuideAbandonPhase::ReturningToTerminus;
                if (IsValid(AI))
                {
                    auto GuideStorage = AI.PermanentStorage(UAIValueSet_Guide);
                    GuideStorage.AbandonPhase = AbandonPhase;
                    GuideStorage.PersistedSpotIdx = TargetSpotIdx;
                    GuideStorage.PersistedMaxSpotIdx = MaxGuidedSpotIdx;
                }
                return;
            }

            EGuideAbandonPhase PersistedPhase = EGuideAbandonPhase::Guiding;
            int32 PersistedSpotIdx = 0;
            int32 PersistedMaxSpotIdx = 0;
            if (IsValid(AI))
            {
                auto GuideStorage = AI.PermanentStorage(UAIValueSet_Guide);
                PersistedPhase = GuideStorage.AbandonPhase;
                PersistedSpotIdx = GuideStorage.PersistedSpotIdx;
                PersistedMaxSpotIdx = GuideStorage.PersistedMaxSpotIdx;
                if (PersistedPhase != EGuideAbandonPhase::WaitingAtPlace)
                {
                    AbandonPhase = PersistedPhase;
                    TargetSpotIdx = Math::Clamp(PersistedSpotIdx, 0, GoAlongFreepoints.Num() - 1);
                    MaxGuidedSpotIdx = Math::Max(MaxGuidedSpotIdx, Math::Clamp(PersistedMaxSpotIdx, 0, GoAlongFreepoints.Num() - 1));
                    break;
                }
            }

            if (CheckAndHandleNearbyThreats())
                return;
            if (!WaitAtPlaceEndTime.IsValid() || !FInGameTime::IsBefore(FInGameTime::Now(), WaitAtPlaceEndTime))
                break;
            if (!FollowingCharacterIsNotClose())
            {
                bLostFollowingCharacter = false;
                AbandonPhase = EGuideAbandonPhase::Guiding;
                TargetSpotIdx = Math::Min(MaxGuidedSpotIdx, GoAlongFreepoints.Num() - 1);
                if (IsValid(AI))
                {
                    auto GuideStorage = AI.PermanentStorage(UAIValueSet_Guide);
                    GuideStorage.AbandonPhase = EGuideAbandonPhase::Guiding;
                    GuideStorage.PersistedSpotIdx = 0;
                    GuideStorage.PersistedMaxSpotIdx = 0;
                }
                return;
            }

            TSubclassOf<UCharacterAIState> ActionClass = WaitAtPlaceAction;
            if (ActionClass == nullptr)
                ActionClass = UAIState_StandAround::StaticClass();
            DoSubstate(ActionClass).While(n"ShouldContinueWaitAtPlace");
        }

        if (!FollowingCharacterHasAbandoned())
        {
            bLostFollowingCharacter = false;
            AbandonPhase = EGuideAbandonPhase::Guiding;
            TargetSpotIdx = Math::Min(MaxGuidedSpotIdx, GoAlongFreepoints.Num() - 1);
            if (IsValid(AI))
            {
                auto GuideStorage = AI.PermanentStorage(UAIValueSet_Guide);
                GuideStorage.AbandonPhase = EGuideAbandonPhase::Guiding;
                GuideStorage.PersistedSpotIdx = 0;
                GuideStorage.PersistedMaxSpotIdx = 0;
            }
            return;
        }
    }

    /** Check for nearby threats and handle them proactively. */
    UFUNCTION()
    protected bool CheckAndHandleNearbyThreats()
    {
        if (!IsValid(AI) || !IsValid(AI.Character))
            return false;

        // Get ALL sensed characters, filter for creatures
        FGameplayTagContainer RequireTags;
        RequireTags.AddTag(GameplayTag::Species_Creature);
        
        FGameplayTagContainer ExcludeTags;
        ExcludeTags.AddTag(GameplayTag::State_Dead);
        ExcludeTags.AddTag(GameplayTag::State_Defeated);
        ExcludeTags.AddTag(GameplayTag::AIState_Conflict_Disengage);
        ExcludeTags.AddTag(GameplayTag::AIState_Conflict_Flee);
        ExcludeTags.AddTag(GameplayTag::Species_Creature_Scavenger_Adult_Rideable);

        TArray<AGothicCharacter> AllCreatures = AI.Self.Perception.GetAllSensedCharacters(RequireTags, ExcludeTags);

        // Check for HOSTILE or ENEMY creatures within threat detection distance
        for (auto Creature : AllCreatures)
        {
            if (!IsValid(Creature) || !IsValid(Creature.CharacterState))
                continue;

            // Only engage HOSTILE or ENEMY creatures and skip Friend, Neutral, and Angry
            ERelationship Relationship = AI.CharacterState.Relationship.GetRelationshipTowards(Creature.CharacterState);
            if (Relationship == ERelationship::Neutral || Relationship == ERelationship::Friend)
                continue;

            float Distance = Creature.GetDistanceTo(AI.Character);
            if (Distance <= ThreatDetectionDistance)
            {
                // Create a perception event and trigger assessment
                FRememberedPerception ThreatPerception;
                ThreatPerception.Origin.Character = Creature;
                ThreatPerception.Origin.CharacterState = Creature.CharacterState;
                ThreatPerception.Origin.Relationship = Relationship;
                ThreatPerception.Origin.Hostility = AI.CharacterState.Relationship.GetHostilityTowards(Creature.CharacterState);

                // Use a custom event for guiding threat
                AI.AssessEvent(GameplayTag::AIEvent_Seen_Hostile_Enter_WarningRange, ThreatPerception);
                return true;
            }
        }

        return false;
    }

    /** Guides the follow actor to each GuideFreepoint one by one */
    UFUNCTION()
    void GuideCharacterForward()
    {
        for (int32 Tries = 0; Tries < MaxGoToTries; Tries++)
        {
            EGenericTaskResult GuideResult = AI.GuideActorToLocation(AI.PreferredLocation.CenterPoint, CharacterToGuide, InterstationReachedDistance, CloseDistance, WaitDistance, AbandonDistance).Result;
            
            if (GuideResult == EGenericTaskResult::Success)
            {
                TargetSpotIdx += 1;
                MaxGuidedSpotIdx = Math::Max(MaxGuidedSpotIdx, TargetSpotIdx);
                return;
            }
            else if (GuideResult == EGenericTaskResult::Cancelled)
            {
                bLostFollowingCharacter = FollowingCharacterHasAbandoned();
                if (bLostFollowingCharacter)
                {
                    TargetSpotIdx = Math::Max(0, TargetSpotIdx - 1);
                    return;
                }
            }
         
            WaitSeconds(2.f);
        }

        PrintWarning(f"Failed. Cannot guide to {GoAlongFreepoints[TargetSpotIdx].FreepointName}");
        EndTaskAsFailure();
    }

    /** Walk toward path start or end (terminus); if player gets close, resume guiding. When at terminus, wait or switch to RoutineToReturnTo. */
    UFUNCTION()
    void GoToTerminus()
    {
        int32 TerminusIdx = GetTerminusSpotIdx();
        if (IsValid(AI))
        {
            auto GuideStorage = AI.PermanentStorage(UAIValueSet_Guide);
            GuideStorage.AbandonPhase = EGuideAbandonPhase::ReturningToTerminus;
            GuideStorage.PersistedSpotIdx = TargetSpotIdx;
            GuideStorage.PersistedMaxSpotIdx = MaxGuidedSpotIdx;
        }

        SetPreferredLocationToCurrentTarget();
        SetWalkSpeed(ReturnWalkSpeed);

        EGenericTaskResult GoToResult = AI.GotoPreferredLocation().While(n"FollowingCharacterIsNotWithinResumeDistance").Result;

        if (!FollowingCharacterIsNotWithinResumeDistance())
        {
            bLostFollowingCharacter = false;
            AbandonPhase = EGuideAbandonPhase::Guiding;
            TargetSpotIdx = Math::Min(MaxGuidedSpotIdx, GoAlongFreepoints.Num() - 1);
            SetPreferredLocationToCurrentTarget();
            if (IsValid(AI))
            {
                auto GuideStorage = AI.PermanentStorage(UAIValueSet_Guide);
                GuideStorage.AbandonPhase = EGuideAbandonPhase::Guiding;
                GuideStorage.PersistedSpotIdx = 0;
                GuideStorage.PersistedMaxSpotIdx = 0;
            }
            return;
        }
        if (GoToResult == EGenericTaskResult::Success)
        {
            if (TargetSpotIdx == TerminusIdx)
            {
                AbandonPhase = EGuideAbandonPhase::AtTerminus;
                if (IsValid(AI))
                {
                    auto GuideStorage = AI.PermanentStorage(UAIValueSet_Guide);
                    GuideStorage.AbandonPhase = AbandonPhase;
                    GuideStorage.PersistedSpotIdx = TargetSpotIdx;
                    GuideStorage.PersistedMaxSpotIdx = MaxGuidedSpotIdx;
                }
                HandleAtTerminus();
            }
            else
            {
                if (!FollowingCharacterIsNotWithinResumeDistance())
                {
                    bLostFollowingCharacter = false;
                    AbandonPhase = EGuideAbandonPhase::Guiding;
                    TargetSpotIdx = Math::Min(MaxGuidedSpotIdx, GoAlongFreepoints.Num() - 1);
                    SetPreferredLocationToCurrentTarget();
                    if (IsValid(AI))
                    {
                        auto GuideStorage = AI.PermanentStorage(UAIValueSet_Guide);
                        GuideStorage.AbandonPhase = EGuideAbandonPhase::Guiding;
                        GuideStorage.PersistedSpotIdx = 0;
                        GuideStorage.PersistedMaxSpotIdx = 0;
                    }
                    return;
                }
                if (bReturnToPathStart)
                    TargetSpotIdx = Math::Max(0, TargetSpotIdx - 1);
                else
                    TargetSpotIdx = Math::Min(GoAlongFreepoints.Num() - 1, TargetSpotIdx + 1);
                if (IsValid(AI))
                {
                    auto GuideStorage = AI.PermanentStorage(UAIValueSet_Guide);
                    GuideStorage.AbandonPhase = EGuideAbandonPhase::ReturningToTerminus;
                    GuideStorage.PersistedSpotIdx = TargetSpotIdx;
                    GuideStorage.PersistedMaxSpotIdx = MaxGuidedSpotIdx;
                }
            }
        }
        else if (GoToResult == EGenericTaskResult::Failed)
        {
            PrintWarning("Failed. Navigation in Go back Task failed");
            if (bReturnToPathStart)
                TargetSpotIdx = Math::Max(0, TargetSpotIdx - 1);
            else
                TargetSpotIdx = Math::Min(GoAlongFreepoints.Num() - 1, TargetSpotIdx + 1);
            if (IsValid(AI))
            {
                auto GuideStorage = AI.PermanentStorage(UAIValueSet_Guide);
                GuideStorage.AbandonPhase = EGuideAbandonPhase::ReturningToTerminus;
                GuideStorage.PersistedSpotIdx = TargetSpotIdx;
                GuideStorage.PersistedMaxSpotIdx = MaxGuidedSpotIdx;
            }
            WaitSeconds(2.f);
        }
        else
        {
            PrintWarning("Canceled. Navigation in Go back Task failed");
            if (bReturnToPathStart)
                TargetSpotIdx = Math::Max(0, TargetSpotIdx - 1);
            else
                TargetSpotIdx = Math::Min(GoAlongFreepoints.Num() - 1, TargetSpotIdx + 1);
            if (IsValid(AI))
            {
                auto GuideStorage = AI.PermanentStorage(UAIValueSet_Guide);
                GuideStorage.AbandonPhase = EGuideAbandonPhase::ReturningToTerminus;
                GuideStorage.PersistedSpotIdx = TargetSpotIdx;
                GuideStorage.PersistedMaxSpotIdx = MaxGuidedSpotIdx;
            }
            WaitSeconds(2.f);
        }
    }

    UFUNCTION(meta=(NoSuperCall))
    void HandleAtTerminus() override
    {
        if (IsValid(AI))
        {
            auto GuideStorage = AI.PermanentStorage(UAIValueSet_Guide);
            GuideStorage.AbandonPhase = EGuideAbandonPhase::Guiding;
            GuideStorage.PersistedSpotIdx = 0;
            GuideStorage.PersistedMaxSpotIdx = 0;
        }

        if (RoutineToReturnTo != nullptr)
        {
            AGothicNPCState OwnerNPCState = Cast<AGothicNPCState>(AI.CharacterState);
            if (IsValid(OwnerNPCState))
            {
                OwnerNPCState.ExchangeDailyRoutineToClass(RoutineToReturnTo);
                EndTaskAsSuccess();
                return;
            }
        }

        while (!bShouldExitState)
        {
            if (CheckAndHandleNearbyThreats())
                return;

            if (!FollowingCharacterIsNotClose())
            {
                bLostFollowingCharacter = false;
                AbandonPhase = EGuideAbandonPhase::Guiding;
                TargetSpotIdx = DetermineCurrentGoalIdx(true);
                return;
            }

            if (TargetSpotIdx == 0)
            {
                TryTakeOutItem();
            }
            else if (TargetSpotIdx == GoAlongFreepoints.Num() - 1)
            {
                TryPutAwayItem();
            }

            DoSubstate(UAIState_StandAround()).While(n"FollowingCharacterIsNotClose");
            WaitSeconds(1.f);
        }
    }

    bool InitTask() override
    {
        if (!Super::InitTask())
            return false;

        if (CloseDistance > WaitDistance)
        {
            PrintError(f"{this.GetName()}: CloseDistance has to be smaller than WaitDistance", 6.f);
            return false;
        }

        if (WaitDistance > AbandonDistance)
        {
            PrintError(f"{this.GetName()}: WaitDistance has to be smaller than AbandonDistance", 6.f);
            return false;
        }

        if (CloseDistance > AbandonDistance)
        {
            PrintError(f"{this.GetName()}: CloseDistance has to be smaller than AbandonDistance", 6.f);
            return false;
        }

        CharacterToGuide = AGothicCharacterState::FindByUniqueName(FollowCharacterUniqueName);

        if (CharacterToGuide == nullptr)
        {
            PrintError(f"{this.GetName()}: Failed to find CharacterToGuide. Please check the name: {FollowCharacterUniqueName}", 6.f);
            return false;
        }

        return true;
    }

    UFUNCTION()
    bool FollowingCharacterIsNotClose() const 
    {
        if(CharacterToGuide == nullptr)
            return false;

        return CharacterToGuide.GetDistanceTo(CharacterState) > CloseDistance;
    }

    UFUNCTION()
    bool FollowingCharacterIsNotWithinResumeDistance() const
    {
        if (CharacterToGuide == nullptr)
            return false;

        return CharacterToGuide.GetDistanceTo(CharacterState) > WaitDistance;
    }

    UFUNCTION()
    bool FollowingCharacterHasAbandoned() const 
    {
        if(CharacterToGuide == nullptr)
            return false;

        return CharacterToGuide.GetDistanceTo(CharacterState) > AbandonDistance;
    }

    UFUNCTION()
    int32 GetTerminusSpotIdx() const
    {
        if (GoAlongFreepoints.Num() == 0)
            return 0;

        return bReturnToPathStart ? 0 : (GoAlongFreepoints.Num() - 1);
    }
    
    UFUNCTION(BlueprintOverride)
    void OnDestroy(bool bInOwnerFinished)
    {
        if (IsValid(AI))
        {
            auto GuideStorage = AI.PermanentStorage(UAIValueSet_Guide);
            GuideStorage.AbandonPhase = EGuideAbandonPhase::Guiding;
            GuideStorage.PersistedSpotIdx = 0;
            GuideStorage.PersistedMaxSpotIdx = 0;
        }
        LogInvalidLocations();
    }

    void TryTakeOutItem()
    {
        if (!IsValid(TryTakeOutItemIfPossible))
            return;

        if (IsInDailyRoutineSimulation())
        {
            if (TryTakeOutItemIfPossible.GetDefaultObject().MatchesItemType(GameplayTag::Item_Weapon_Torch))
            {
                GetNPCState().DailyRoutineSimulation.EnableLightsource(n"Torch");
            }
            return;
        }
        
        if (Self.CarryComponent.GetEquippedItemDefinition() == TryTakeOutItemIfPossible.GetDefaultObject())
            return;

        if (!Self.Inventory.HasItemOfClass(TryTakeOutItemIfPossible))
        {
            Self.Inventory.AddItemOfClass(TryTakeOutItemIfPossible);
        }

        Self.Inventory.TakeOutItemOfKind(TryTakeOutItemIfPossible);
    }

    void TryPutAwayItem()
    {
        if (!IsValid(TryTakeOutItemIfPossible))
            return;

        if (IsInDailyRoutineSimulation())
        {
            if (TryTakeOutItemIfPossible.GetDefaultObject().MatchesItemType(GameplayTag::Item_Weapon_Torch))
            {
                GetNPCState().DailyRoutineSimulation.DisableLightsource();
            }
            return;
        }
        
        if (Self.CarryComponent.GetEquippedItemDefinition() != TryTakeOutItemIfPossible.GetDefaultObject())
            return;

        Self.Inventory.UnEquipItem();
    }

    
    FGothicPathfollowSettings CreateCustomPathfollowSetting() override
    {
        FGothicPathfollowSettings Settings = Super::CreateCustomPathfollowSetting();
        Settings.DebugOwnerName = "AIState_GuideCharacter";
        return Settings;
    }
}

UFUNCTION(BlueprintCallable)
mixin bool HasReachedGuidingDestination(const UGameplayAbility_AI AI)
{
    return AI.HasReachedGoAlongFreepointsDestination();
}