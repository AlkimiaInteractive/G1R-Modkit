/**
 * UAIState_WatchFight
 *
 * Spatial layout:
 *  - Watchers register in a shared UAIGroup_WatchFight per observed fight.
 *  - When >=3 watchers, each gets a deterministic angular slot around the
 *    fight anchor at IdealRadius (slot-mode).
 *  - When <3 watchers, a local boids-style force blend is used instead
 *    (anchor pull + neighbour repulsion + fighter danger force).
 *
 * Reactivity:
 *  - DangerStep runs every tick: if any fighter is too close or is charging
 *    toward this watcher, strafe perpendicular + away.
 *  - RepositionStep runs throttled (~0.30s): recomputes target, projects
 *    onto navmesh, avoids crossing the fight zone, walks/runs to spot.
 */
UCLASS()
class UAIState_WatchFight : UAIState_Conflict
{
    default OwnedGameplayTags.AddTag(GameplayTag::AIState_Conflict_WatchFight);
    default AIStateTag = GameplayTag::AIState_Conflict_WatchFight;
    default SwitchAIStateMode = ESwitchAIStateMode::Interrupt;
    default EndInteractionMode = ESwitchAIStateEndInteractionMode::None;
    default FocusPriority = EGothicFocusPriority::WatchFight;
    default DefaultConflictType = EConflictType::None;

    default AssessmentModuleClass = UAIARM_State_WatchFight;

    default IsTickingTask = true;

    // -----------------------------------------------------------------------
    // Cheer system
    // -----------------------------------------------------------------------
    FInGameTime TimeUntilGenericCheerIsAllowed;
    FInGameTime TimeUntilHitCheerIsAllowed;
    FInGameTime TimeUntilDefeatCheerIsAllowed;
    FInGameTime TimeUntilKillCheerIsAllowed;

    float MinimumTimeSecondsBetweenGenericCheers = 6.5f;
    float MaximumTimeSecondsBetweenGenericCheers = 15.0f;

    float TimeSecondsBetweenHitCheers = 6.0f;
    float HitCheerDamagePercentThreshold = 0.05f;

    float TimeSecondsBetweenDefeatCheers = 1.0f;
    float TimeSecondsBetweenKillCheers = 1.0f;

    bool bDoingGenericCheer = true;
    bool bDoingHitCheer = false;
    bool bDoingDefeatCheer = false;
    bool bDoingKillCheer = false;

    // -----------------------------------------------------------------------
    // Spatial config (per-watcher).
    // -----------------------------------------------------------------------
    /** Pivot of the desired arc around the fight anchor. */
    UPROPERTY()
    float32 IdealRadius = 700.0f;

    /** Hard danger threshold; closer than this triggers strafe-away. */
    UPROPERTY()
    float32 DistanceTooClose = 400.0f;

    /** Below this we walk back gently. */
    UPROPERTY()
    float32 DistanceSoftMin = 650.0f;

    /** Above this we walk forward gently. */
    UPROPERTY()
    float32 DistanceSoftMax = 1000.0f;

    /** Above this we run to close in. */
    UPROPERTY()
    float32 DistanceTooFar = 1400.0f;

    /** Minimum acceptable safety distance. */
    UPROPERTY()
    float32 TrueMinimumDistance = 500.0f;

    /** Dot(F.velocity_norm, toMe) >= this counts as charging at us. */
    UPROPERTY()
    float32 DangerChargeDotThreshold = 0.6f;

    /** Lookahead horizon for predictive danger response. */
    UPROPERTY()
    float32 DangerLookaheadSeconds = 0.6f;

    /** Mutual avoidance radius among watchers (boids mode). */
    UPROPERTY()
    float32 NeighbourRepulsionRadius = 200.0f;

    /** Half-width of the fight-zone capsule to avoid crossing during movement. */
    UPROPERTY()
    float32 FighterAvoidanceLateralBand = 180.0f;

    /** Distance buffer to declare we've reached the target spot. */
    UPROPERTY()
    float32 ArrivalDistance = 60.0f;

    /** Reposition throttle in seconds. */
    UPROPERTY()
    float32 RepositionTickIntervalSeconds = 0.60f;

    /** Max Z delta (cm) between candidate spot and fight anchor; rejects different-floor projections. */
    UPROPERTY()
    float32 MaxLevelZDelta = 150.0f;

    /** Max ratio of navmesh path length over XY straight distance; rejects huge detours. */
    UPROPERTY()
    float32 MaxPathRatio = 1.8f;

    /** Absolute hard cap on navmesh path length (cm) to a candidate spot. */
    UPROPERTY()
    float32 MaxAbsPathLen = 2500.0f;

    /** Angular step (degrees) used to probe neighbour slots when primary is rejected. */
    UPROPERTY()
    float32 AngularRetryStepDeg = 22.5f;

    /** Max neighbour slots to try per side (total candidates = 1 + 2 * this). */
    UPROPERTY()
    int MaxAngularRetriesPerSide = 2;

    // -----------------------------------------------------------------------
    // No-cross-the-circle + hysteresis tunables
    // -----------------------------------------------------------------------
    /** Inner forbidden ring radius as a fraction of IdealRadius. */
    UPROPERTY()
    float32 InnerForbiddenFactor = 0.85f;

    /** Arc step (degrees) used when rerouting tangentially around the ring. */
    UPROPERTY()
    float32 ArcStepDeg = 30.0f;

    /** Radial deviation (cm) within which a watcher enters settle. */
    UPROPERTY()
    float32 SettleRadiusBand = 120.0f;

    /** Radial deviation (cm) above which a settled watcher leaves settle. */
    UPROPERTY()
    float32 BreakRadiusBand = 420.0f;

    /** Slot-mode angle tolerance (deg) to enter settle. */
    UPROPERTY()
    float32 SettleAngleToleranceDeg = 20.0f;

    /** Slot-mode angle tolerance (deg) to leave settle. */
    UPROPERTY()
    float32 BreakAngleToleranceDeg = 50.0f;

    /** Anchor displacement (cm) since settling that forces re-evaluation. */
    UPROPERTY()
    float32 AnchorDriftThreshold = 450.0f;

    /** Max extra random delay (s) per reposition tick (anti-unison). */
    UPROPERTY()
    float32 RepositionJitterMaxSeconds = 0.60f;

    /** Minimum target delta before issuing a fresh move order. */
    UPROPERTY()
    float32 MinimumRetargetDistance = 220.0f;

    /** Minimum time before replacing a similar move target. */
    UPROPERTY()
    float32 MinimumRetargetSeconds = 1.25f;

    /** Candidate targets must stay at least this far from fighters. */
    UPROPERTY()
    float32 FighterSafetyRadius = 520.0f;

    /** Movement segments must not cut closer than this to fighters. */
    UPROPERTY()
    float32 FighterPathSafetyRadius = 460.0f;

    /** Minimum time between emergency danger strafes. */
    UPROPERTY()
    float32 DangerMoveCooldownSeconds = 0.75f;

    /** Distance of one emergency strafe step. */
    UPROPERTY()
    float32 DangerStepDistance = 180.0f;

    /** Ignore tiny emergency move probes. */
    UPROPERTY()
    float32 DangerMinimumMoveDistance = 80.0f;

    /** Below this, escape immediately instead of using normal watch-ring strafe. */
    UPROPERTY()
    float32 EmergencyEscapeDistance = 260.0f;

    /** Hard-overlap escape step distance. */
    UPROPERTY()
    float32 EmergencyEscapeStepDistance = 380.0f;

    /** Minimum time between hard-overlap escape moves. */
    UPROPERTY()
    float32 EmergencyEscapeCooldownSeconds = 0.15f;

    /** Emergency escape must increase distance from closest fighter by this much. */
    UPROPERTY()
    float32 EmergencyEscapeMinDistanceGain = 120.0f;

    // -----------------------------------------------------------------------
    // LoS-from-anchor and side-lock tunables
    // -----------------------------------------------------------------------
    /** Vertical offset from anchor (cm) when tracing LoS to a candidate spot. */
    UPROPERTY()
    float32 LoSEyeHeight = 150.0f;

    /** Vertical offset from candidate ground (cm) when tracing LoS. */
    UPROPERTY()
    float32 LoSCandidateOffset = 100.0f;

    /** Enables anchor->candidate visibility trace as a rejection criterion. */
    UPROPERTY()
    bool bRequireLoSFromAnchor = true;

    /** Enforces that watcher targets stay on its starting side of the fight axis. */
    UPROPERTY()
    bool bRequireSideLock = true;

    /** Seconds on opposite side before PreferredSideSign is allowed to flip. */
    UPROPERTY()
    float32 SideStickyTimeoutSeconds = 4.0f;

    /** Inset from axis line (cm) for boids-mode side clamp. */
    UPROPERTY()
    float32 SideClampInset = 80.0f;

    // -----------------------------------------------------------------------
    // Spatial runtime state
    // -----------------------------------------------------------------------
    UAIGroup_WatchFight WatchGroup;

    UAIGroup_ConflictInstance ObservedConflict;

    FInGameTime NextRepositionAt;

    /** Cached most recent reposition decision, for debug. */
    UPROPERTY()
    FString LastRepositionReason = "init";

    /** Cached values for ImGui visualisation (set each reposition). */
    UPROPERTY()
    FVector LastTargetSpot = FVector::ZeroVector;

    UPROPERTY()
    FVector LastFightAnchor = FVector::ZeroVector;

    UPROPERTY()
    FVector LastFightAxis = FVector::ForwardVector;

    UPROPERTY()
    bool bLastWasSlotMode = false;

    UPROPERTY()
    AGothicCharacterState LastClosestFighter;

    UPROPERTY()
    bool bLastDangerActive = false;

    /** Debug toggles. */
    UPROPERTY()
    bool bForceSlotMode = false;

    UPROPERTY()
    bool bForceBoidsMode = false;

    UPROPERTY()
    bool bDisableSpread = false;

    UPROPERTY()
    bool bDisableDanger = false;

    // Hysteresis runtime state
    UPROPERTY()
    bool bSettled = false;

    UPROPERTY()
    FVector SettledAtAnchor = FVector::ZeroVector;

    float SettledAtAngleRad = 0.0f;
    int LastWatcherCount = 0;
    bool bLastForceSlot = false;
    bool bLastForceBoids = false;
    bool bLastDisableSpread = false;

    /** Cached anchor used by DangerStep for tangent escapes. */
    FVector LastAnchorRef = FVector::ZeroVector;

    /** Last arc-detour debug state. */
    UPROPERTY()
    bool bLastArcDetour = false;

    UPROPERTY()
    FVector LastArcWaypoint = FVector::ZeroVector;

    /** Side state: -1 / 0 / +1. Sign of (Self - Anchor).Dot(Perp(FightAxis)). */
    UPROPERTY()
    int PreferredSideSign = 0;

    /** Started counting time on opposite side; reset when back on own side. */
    FInGameTime SideMismatchSince;

    UPROPERTY()
    bool bLastLoSBypassedAnchor = false;

    UPROPERTY()
    FVector LastIssuedMoveTarget = FVector::ZeroVector;

    UPROPERTY()
    bool bHasIssuedMoveTarget = false;

    FInGameTime LastMoveOrderAt;

    FInGameTime NextDangerMoveAt;

    FInGameTime NextEmergencyEscapeAt;

    // -----------------------------------------------------------------------
    // Fight lifecycle
    // -----------------------------------------------------------------------
    UPROPERTY()
    bool bFightIsOver = false;

    /** Gates WatchFight_End_Run for RunCoward*/
    bool bObservedMultipleFightParticipants = false;

    /** True if we entered without any sensed fighter (hearing-only path). */
    bool bEnteredWithoutSensedFighter = false;

    /** Time of state activation; used to bound hearing-only approach. */
    FInGameTime ActivationTime;

    /** Hard cap on how long to walk toward perception origin without sensing anyone. */
    UPROPERTY()
    float HearingApproachTimeoutSeconds = 8.0f;

    bool ShouldCountCharacterAsWatchFightParticipant(AGothicCharacter Character) const
    {
        auto GASC = Character.GetGothicAbilitySystemComponent();
        if (!GASC.HasGameplayTag(GameplayTag::AIState_Conflict))
            return false;

        // Mirror exclusions from JustSeenCharacterInFightingState_NonCreature.
        if (GASC.HasGameplayTag(GameplayTag::AIState_Conflict_CombatEndActions))
            return false;
        if (GASC.HasGameplayTag(GameplayTag::AIState_Conflict_Warning))
            return false;
        if (GASC.HasGameplayTag(GameplayTag::AIState_Conflict_WatchFight))
            return false;
        if (GASC.HasGameplayTag(GameplayTag::AIState_Conflict_WatchHostile))
            return false;
        if (GASC.HasGameplayTag(GameplayTag::AIState_Conflict_InvestigateCombatSound))
            return false;
        if (GASC.HasGameplayTag(GameplayTag::AIState_Conflict_InvestigateAlarm))
            return false;
        if (GASC.HasGameplayTag(GameplayTag::AIState_Conflict_InvestigateIdentifiedSound))
            return false;
        if (GASC.HasGameplayTag(GameplayTag::AIState_Conflict_InvestigatePickpocket))
            return false;
        if (GASC.HasGameplayTag(GameplayTag::AIState_Conflict_InvestigatePouch))
            return false;
        if (GASC.HasGameplayTag(GameplayTag::AIState_Conflict_InvestigateSuspiciousSound))
            return false;
        if (GASC.HasGameplayTag(GameplayTag::AIState_Conflict_ChaseAndLookForHidingCharacter))
            return false;
        if (GASC.HasGameplayTag(GameplayTag::AIState_Conflict_GoGetGuard))
            return false;

        return true;
    }

    bool IsAnyCheerFlagTrue()
    {
        return bDoingGenericCheer || bDoingHitCheer || bDoingDefeatCheer || bDoingKillCheer;
    }

    void ResetCheerFlags()
    {
        bDoingGenericCheer = true;
        bDoingHitCheer = false;
        bDoingDefeatCheer = false;
        bDoingKillCheer = false;
    }

    UFUNCTION(BlueprintOverride)
    void SetupPerceptions(UCharacterPerceptionComponent Perception)
    {
        Super::SetupPerceptions(Perception);

        Perception.JustSeenAttackHitOtherWithMeleeWeapon().PerceptionGained.BindUFunction(this, n"OnOtherHit");
        Perception.JustSeenAttackHitOtherWithFists().PerceptionGained.BindUFunction(this, n"OnOtherHit");
        Perception.JustSeenAttackHitOtherWithRangedWeapon().PerceptionGained.BindUFunction(this, n"OnOtherHit");

        Perception.OnSomeoneElseGotKnockedOut().PerceptionGained.BindUFunction(this, n"OnOtherDefeated");

        Perception.OnSomeoneIsExecuting().PerceptionGained.BindUFunction(this, n"OnOtherKilled");
    }

    UFUNCTION(BlueprintOverride)
    void DoTask()
    {
        Super::DoTask();

        // Observers must not appear as fight members. Super may have joined a
        // conflict group on entry; explicitly leave so we are pure observer.
        AI.LeaveGroupsWithClass(UAIGroup_ConflictInstance);

        // Locate the conflict we are observing and create-or-join the
        // shared watch group for it.
        SetupWatchGroup();

        if (IsValid(CharacterOfInterest) && !AI.CharacterState.CanSeeCharacter(CharacterOfInterest.CharacterState))
        {
            AI.TurnToCharacter(CharacterOfInterest);
        }

        // Detect hearing-only entry: no fighter visible right now.
        bEnteredWithoutSensedFighter = !HasAnySensedFighter();

        if (!Self.IsSitting())
        {
            AI.EndAnyOngoingInteractionQuick();

            while (Self.Inventory.HasItemOfClass(UWatchFightWeapon) && !Self.HasDrawnWeaponOfClass(UWatchFightWeapon) && Self.HasAbility(UGameplayAbility_EquipItem::StaticClass()))
            {
                if (CharacterState.HasGameplayTag(GameplayTag::State_ItemDraw) && !CharacterState.HasGameplayTag(GameplayTag::State_ItemInHand))
                {
                    WaitOneTick();
                    continue;
                }

                if (!AI.Self.IsSwimming() && !AI.Self.IsDiving() && !AI.Self.IsClimbingLadderOrWall())
                {
                    AI.DrawWeaponOfClass(UWatchFightWeapon);
                }

                WaitOneTick();
            }
        }

        NextRepositionAt = FInGameTime::XRealtimeSecondsFromNow(Math::RandRange(0.0f, RepositionJitterMaxSeconds));
        ActivationTime = FInGameTime::Now();
        bSettled = false;
        SettledAtAnchor = FVector::ZeroVector;
        LastWatcherCount = 0;
        bLastForceSlot = bForceSlotMode;
        bLastForceBoids = bForceBoidsMode;
        bLastDisableSpread = bDisableSpread;
        PreferredSideSign = 0;
        bLastLoSBypassedAnchor = false;
        bHasIssuedMoveTarget = false;
        LastIssuedMoveTarget = FVector::ZeroVector;
        LastMoveOrderAt = FInGameTime();
        NextDangerMoveAt = FInGameTime();
        NextEmergencyEscapeAt = FInGameTime();

        while (!bFightIsOver)
        {
            CheckCheerTimers();
            AssessGenericCheerEvent();

            if (!bDisableDanger)
                DangerStep();

            if (!NextRepositionAt.IsValid() || !FInGameTime::IsBefore(FInGameTime::Now(), NextRepositionAt))
            {
                RepositionStep();
                SetNextRepositionWithJitter();
            }

            WaitOneTick();
        }
    }

    UFUNCTION(BlueprintOverride)
    void OnDestroy(bool bInOwnerFinished)
    {
        if (!bInOwnerFinished)
        {
            AI.LeaveGroupsWithClass(UAIGroup_WatchFight);
        }

        Super::OnDestroy(bInOwnerFinished);
    }

    // -----------------------------------------------------------------------
    // Group setup
    // -----------------------------------------------------------------------
    void SetupWatchGroup()
    {
        // Leave any stale watch group from a previous WatchFight cycle.
        AI.LeaveGroupsWithClass(UAIGroup_WatchFight);

        ObservedConflict = FindConflictForSensedFighter();
        if (!IsValid(ObservedConflict))
        {
            // Hearing-only entry: try to resolve from perception origin
            ObservedConflict = FindConflictForCharacter(RememberedPerception.Origin.Character);
        }

        if (!IsValid(ObservedConflict))
            return;

        WatchGroup = FindOrCreateWatchFightGroupForConflict(ObservedConflict, Self);
    }

    UAIGroup_ConflictInstance FindConflictForSensedFighter() const
    {
        for (auto Character : GetSensedLivingCharacters())
        {
            if (!IsValid(Character))
                continue;

            if (!Character.IsPlayerControlled() && !ShouldCountCharacterAsWatchFightParticipant(Character))
                continue;

            auto Conflict = FindConflictForCharacter(Character);
            if (IsValid(Conflict))
                return Conflict;
        }
        return nullptr;
    }

    UAIGroup_ConflictInstance FindConflictForCharacter(AGothicCharacter Character) const
    {
        if (!IsValid(Character))
            return nullptr;

        auto AllConflicts = UGothicAIGroup::GetAllActiveGroupsOfClass(UAIGroup_ConflictInstance);
        for (auto Group : AllConflicts)
        {
            auto Conflict = Cast<UAIGroup_ConflictInstance>(Group);
            if (!IsValid(Conflict))
                continue;

            if (Conflict.IsCharacterInvolved(Character))
                return Conflict;
        }
        return nullptr;
    }

    bool HasAnySensedFighter() const
    {
        for (auto Character : GetSensedLivingCharacters())
        {
            if (!IsValid(Character))
                continue;

            if (Character.IsPlayerControlled() && Character.HasDrawnWeapon())
                return true;

            if (!Character.IsPlayerControlled() && ShouldCountCharacterAsWatchFightParticipant(Character))
                return true;
        }
        return false;
    }

    // -----------------------------------------------------------------------
    // Cheer logic
    // -----------------------------------------------------------------------
    void CheckCheerTimers()
    {
        if (AI.CharacterState.IsSpeaking())
            return;

        if (bDoingGenericCheer)
        {
            bDoingGenericCheer = false;
            float Seconds = Math::RandRange(MinimumTimeSecondsBetweenGenericCheers, MaximumTimeSecondsBetweenGenericCheers);
            TimeUntilGenericCheerIsAllowed = FInGameTime::XRealtimeSecondsFromNow(Seconds);
            return;
        }

        if (bDoingHitCheer)
        {
            bDoingHitCheer = false;
            TimeUntilHitCheerIsAllowed = FInGameTime::XRealtimeSecondsFromNow(TimeSecondsBetweenHitCheers);
            return;
        }

        if (bDoingDefeatCheer)
        {
            bDoingDefeatCheer = false;
            TimeUntilDefeatCheerIsAllowed = FInGameTime::XRealtimeSecondsFromNow(TimeSecondsBetweenDefeatCheers);
            return;
        }

        if (bDoingKillCheer)
        {
            bDoingKillCheer = false;
            TimeUntilKillCheerIsAllowed = FInGameTime::XRealtimeSecondsFromNow(TimeSecondsBetweenKillCheers);
            return;
        }
    }

    void AssessGenericCheerEvent()
    {
        if (AI.CharacterState.IsSpeaking())
            return;

        if (TimeUntilGenericCheerIsAllowed.IsValid() && FInGameTime::IsBefore(FInGameTime::Now(), TimeUntilGenericCheerIsAllowed))
            return;

        bDoingGenericCheer = true;

        FRememberedPerception Perception;
        Perception.Origin.Character = CharacterOfInterest;
        AI.AssessEvent(GameplayTag::AIEvent_WatchFight_Cheer_Generic, Perception);
    }

    UFUNCTION()
    void OnOtherHit(const FRememberedPerception&in Perception, const FPerceptionShortTermMemory&in Memory)
    {
        if (IsAnyCheerFlagTrue())
            return;

        if (AI.CharacterState.IsSpeaking())
            return;

        if (TimeUntilHitCheerIsAllowed.IsValid() && FInGameTime::IsBefore(FInGameTime::Now(), TimeUntilHitCheerIsAllowed))
            return;

        if (Perception.Affected.CharacterState == nullptr)
            return;

        if (Perception.Instigator.CharacterState == nullptr)
            return;

        if (Perception.Magnitude < Perception.Affected.CharacterState.GetMaxHealthAttribute() * HitCheerDamagePercentThreshold)
            return;

        bDoingHitCheer = true;
        AI.AssessEvent(GameplayTag::AIEvent_WatchFight_Cheer_Hit, Perception);
    }

    UFUNCTION()
    void OnOtherDefeated(const FRememberedPerception&in Perception, const FPerceptionShortTermMemory&in Memory)
    {
        if (!bDoingHitCheer && AI.CharacterState.IsSpeaking())
            return;

        if (!bDoingHitCheer && IsAnyCheerFlagTrue())
            return;

        if (TimeUntilDefeatCheerIsAllowed.IsValid() && FInGameTime::IsBefore(FInGameTime::Now(), TimeUntilDefeatCheerIsAllowed))
            return;

        if (bDoingHitCheer)
        {
            ResetCheerFlags();
        }

        bDoingDefeatCheer = true;
        AI.AssessEvent(GameplayTag::AIEvent_WatchFight_Cheer_Defeat, Perception);
    }

    UFUNCTION()
    void OnOtherKilled(const FRememberedPerception&in Perception, const FPerceptionShortTermMemory&in Memory)
    {
        if (bDoingKillCheer)
            return;

        if (TimeUntilKillCheerIsAllowed.IsValid() && FInGameTime::IsBefore(FInGameTime::Now(), TimeUntilKillCheerIsAllowed))
            return;

        if (AI.CharacterState.IsSpeaking())
        {
            ResetCheerFlags();
        }

        bDoingKillCheer = true;
        AI.AssessEvent(GameplayTag::AIEvent_WatchFight_Cheer_Kill, Perception);
    }

    // -----------------------------------------------------------------------
    // Spatial logic
    // -----------------------------------------------------------------------

    /**
     * Per-tick lightweight danger check. Strafe perpendicular + away when a
     * fighter is too close or charging toward us.
     */
    void DangerStep()
    {
        bLastDangerActive = false;

        if (Self.IsSitting())
            return;

        AGothicCharacterState ClosestFighter = nullptr;
        float ClosestDist = MAX_flt;
        TArray<AGothicCharacter> Fighters = GatherSensedFighters();
        for (auto F : Fighters)
        {
            if (!IsValid(F) || !IsValid(F.CharacterState))
                continue;

            float D = Self.FeetLocation.Distance(F.FeetLocation);
            if (D < ClosestDist)
            {
                ClosestDist = D;
                ClosestFighter = F.CharacterState;
            }
        }

        LastClosestFighter = ClosestFighter;

        if (!IsValid(ClosestFighter) || !IsValid(ClosestFighter.Character))
            return;

        FVector ToMe = (Self.FeetLocation - ClosestFighter.Character.FeetLocation);
        ToMe.Z = 0.0f;
        FVector ToMeDir = ToMe.GetSafeNormal();

        FVector FVel = ClosestFighter.Character.GetVelocity();
        FVel.Z = 0.0f;
        float FSpeed = FVel.Size();
        FVector FVelDir = FVel.GetSafeNormal();

        bool bCharging = FSpeed > 200.0f
            && FVelDir.DotProduct(ToMeDir) > DangerChargeDotThreshold;

        float PredictedDist = ClosestDist - FSpeed * DangerLookaheadSeconds;
        bool bWillBeTooClose = bCharging && PredictedDist < DistanceSoftMin;
        bool bIsTooClose = ClosestDist < DistanceTooClose;

        if (!bIsTooClose && !bWillBeTooClose)
            return;

        bLastDangerActive = true;
        bSettled = false;
        LastRepositionReason = bIsTooClose ? "strafe-too-close" : "strafe-charge";

        if (ClosestDist < EmergencyEscapeDistance
            && TryEmergencyEscapeFromFighter(ClosestFighter.Character, ToMeDir))
        {
            return;
        }

        if (NextDangerMoveAt.IsValid() && FInGameTime::IsBefore(FInGameTime::Now(), NextDangerMoveAt))
            return;

        // Tangent escapes along the watch ring come first so a watcher pinned
        // at the navmesh edge slides sideways instead of freezing or being
        // pushed into the circle.
        FVector AnchorForTangent = !LastAnchorRef.IsNearlyZero()
            ? LastAnchorRef
            : (!LastFightAnchor.IsNearlyZero() ? LastFightAnchor : ClosestFighter.Character.FeetLocation);

        FVector RadialOut = (Self.FeetLocation - AnchorForTangent);
        RadialOut.Z = 0.0f;
        if (RadialOut.IsNearlyZero())
            RadialOut = ToMeDir.IsNearlyZero() ? Self.GetActorForwardVector() : ToMeDir;
        RadialOut = RadialOut.GetSafeNormal();

        FVector TangentR = RadialOut.CrossProduct(FVector::UpVector).GetSafeNormal();
        FVector TangentL = -TangentR;

        FVector Right = ToMeDir.CrossProduct(FVector::UpVector).GetSafeNormal();
        FVector StrafeA = (Right + ToMeDir * 0.5f).GetSafeNormal();
        FVector StrafeB = (-Right + ToMeDir * 0.5f).GetSafeNormal();

        TArray<FVector> Candidates;
        Candidates.Add(TangentR);
        Candidates.Add(TangentL);
        Candidates.Add((TangentR + ToMeDir * 0.5f).GetSafeNormal());
        Candidates.Add((TangentL + ToMeDir * 0.5f).GetSafeNormal());
        Candidates.Add(StrafeA);
        Candidates.Add(StrafeB);

        FVector Chosen = TangentR;
        float Distance = Math::Clamp(DistanceTooClose - ClosestDist + DangerMinimumMoveDistance,
            DangerMinimumMoveDistance, DangerStepDistance);
        bool bFoundClear = false;
        for (int i = 0; i < Candidates.Num(); ++i)
        {
            FVector ProbeEnd = Self.FeetLocation + Candidates[i] * DangerStepDistance;
            if (DoesMoveSegmentStaySafeFromFighters(Self.FeetLocation, ProbeEnd, FighterPathSafetyRadius)
                && AI.CanMoveIntoDirection(Candidates[i], DangerStepDistance, -1.0f, DangerMinimumMoveDistance))
            {
                Chosen = Candidates[i];
                bFoundClear = true;
                break;
            }
        }

        // Fall back to shortest tangent nudge if every probe failed; better
        // than freezing in the fighter's path.
        if (!bFoundClear)
        {
            Chosen = TangentR;
            Distance = DangerMinimumMoveDistance;
            LastRepositionReason = LastRepositionReason + "-no-clear";
        }

        SetWalkSpeed(EWalkSpeed::Running);
        AI.GoIntoDirection(Chosen, Distance, MinimumMoveDistance = DangerMinimumMoveDistance);
        bHasIssuedMoveTarget = false;
        NextDangerMoveAt = FInGameTime::XRealtimeSecondsFromNow(DangerMoveCooldownSeconds);

        // Avoid fighting with the reposition step right after a danger move.
        NextRepositionAt = FInGameTime::XRealtimeSecondsFromNow(RepositionTickIntervalSeconds * 0.5f);
    }

    bool TryEmergencyEscapeFromFighter(AGothicCharacter Fighter, FVector ToMeDir)
    {
        if (!IsValid(Fighter))
            return false;

        if (NextEmergencyEscapeAt.IsValid() && FInGameTime::IsBefore(FInGameTime::Now(), NextEmergencyEscapeAt))
            return true;

        FVector Away = ToMeDir;
        Away.Z = 0.0f;
        if (Away.IsNearlyZero())
        {
            FVector AnchorRef = !LastAnchorRef.IsNearlyZero()
                ? LastAnchorRef
                : (!LastFightAnchor.IsNearlyZero() ? LastFightAnchor : Fighter.FeetLocation);
            Away = Self.FeetLocation - AnchorRef;
            Away.Z = 0.0f;
        }
        if (Away.IsNearlyZero())
            Away = Self.GetActorForwardVector();
        Away.Z = 0.0f;
        Away = Away.GetSafeNormal();

        TArray<FVector> Candidates;
        Candidates.Add(Away);
        Candidates.Add(Away.RotateAngleAxis(35.0f, FVector::UpVector).GetSafeNormal());
        Candidates.Add(Away.RotateAngleAxis(-35.0f, FVector::UpVector).GetSafeNormal());
        Candidates.Add(Away.RotateAngleAxis(70.0f, FVector::UpVector).GetSafeNormal());
        Candidates.Add(Away.RotateAngleAxis(-70.0f, FVector::UpVector).GetSafeNormal());

        FVector RadialOut = Self.FeetLocation - (!LastAnchorRef.IsNearlyZero() ? LastAnchorRef : Fighter.FeetLocation);
        RadialOut.Z = 0.0f;
        if (!RadialOut.IsNearlyZero())
        {
            RadialOut = RadialOut.GetSafeNormal();
            Candidates.Add(RadialOut.CrossProduct(FVector::UpVector).GetSafeNormal());
            Candidates.Add((-RadialOut).CrossProduct(FVector::UpVector).GetSafeNormal());
        }

        for (int i = 0; i < Candidates.Num(); ++i)
        {
            if (Candidates[i].IsNearlyZero())
                continue;

            FVector ProbeEnd = Self.FeetLocation + Candidates[i] * EmergencyEscapeStepDistance;
            if (!DoesEmergencyEscapeImproveDistance(Self.FeetLocation, ProbeEnd, Fighter))
                continue;

            if (!AI.CanMoveIntoDirection(Candidates[i], EmergencyEscapeStepDistance, -1.0f, DangerMinimumMoveDistance))
                continue;

            LastRepositionReason = "emergency-escape";
            SetWalkSpeed(EWalkSpeed::Running);
            AI.GoIntoDirection(Candidates[i], EmergencyEscapeStepDistance, MinimumMoveDistance = DangerMinimumMoveDistance);
            bHasIssuedMoveTarget = false;
            NextEmergencyEscapeAt = FInGameTime::XRealtimeSecondsFromNow(EmergencyEscapeCooldownSeconds);
            NextDangerMoveAt = FInGameTime::XRealtimeSecondsFromNow(EmergencyEscapeCooldownSeconds);
            NextRepositionAt = FInGameTime::XRealtimeSecondsFromNow(RepositionTickIntervalSeconds * 0.25f);
            return true;
        }

        LastRepositionReason = "emergency-escape-blocked";
        return false;
    }

    /**
     * Throttled reposition: recompute fight centroid, run slot or boids,
     * detour around fight zone if needed, run/walk to target.
     */
    void RepositionStep()
    {
        TArray<AGothicCharacter> Fighters = GatherSensedFighters();

        // Update group anchor/axis when we have any fighters.
        if (IsValid(WatchGroup) && Fighters.Num() > 0)
        {
            WatchGroup.UpdateAnchorAndAxis(Fighters);
            WatchGroup.IdealRadius = IdealRadius;
            LastFightAnchor = WatchGroup.AnchorLocation;
            LastFightAxis = WatchGroup.FightAxisXY;
        }
        else if (Fighters.Num() > 0)
        {
            // Group missing: compute local anchor only.
            FVector Sum = FVector::ZeroVector;
            for (auto F : Fighters)
                Sum += F.GetActorLocation();
            LastFightAnchor = Sum / Math::Max(1, Fighters.Num());
        }

        if (Fighters.Num() >= 1)
        {
            bObservedMultipleFightParticipants = bObservedMultipleFightParticipants || Fighters.Num() >= 2;
        }

        // Hearing-only entry that hasn't yet confirmed a 2-fighter fight.
        // While in this mode we either approach the perception origin (if no
        // fighter sensed yet) or hold timeout-bounded.
        if (bEnteredWithoutSensedFighter && !bObservedMultipleFightParticipants)
        {
            float Elapsed = ActivationTime.IsValid() ? ActivationTime.AgeInRealtimeSeconds : 0.0f;
            if (Elapsed >= HearingApproachTimeoutSeconds)
            {
                LastRepositionReason = "hearing-timeout";
                HandleFightEnded();
                return;
            }

            if (Fighters.Num() == 0 && IsValid(RememberedPerception.Origin.Character))
            {
                LastRepositionReason = "approach-perception-origin";
                SetWalkSpeed(EWalkSpeed::Running);
                AI.GotoPosition(RememberedPerception.Origin.Character.GetActorLocation(), DistanceSoftMax);
                return;
            }

            // Else (1 fighter sensed): fall through to normal positioning so we
            // at least face/distance them while waiting for a second sense.
        }

        // For sight-entry the original behaviour applies: drop below 2 -> end.
        // For hearing-entry that has now observed the fight, same rule applies.
        bool bConsideredEngaged = !bEnteredWithoutSensedFighter || bObservedMultipleFightParticipants;
        if (Fighters.Num() < 2 && bConsideredEngaged)
        {
            HandleFightEnded();
            return;
        }

        if (Fighters.Num() == 0)
        {
            LastRepositionReason = "hold-no-fighters";
            return;
        }

        // Choose facing target: closest fighter.
        AGothicCharacter ClosestFighter = SelectClosestFighter(Fighters);
        if (IsValid(ClosestFighter))
        {
            AI.TargetCharacter(ClosestFighter, FocusPriority, this);
        }

        if (Self.IsSitting())
            return;

        if (bDisableSpread)
        {
            LastRepositionReason = "spread-disabled";
            return;
        }

        // Decide mode.
        int Watchers = IsValid(WatchGroup) ? WatchGroup.MemberCount : 1;
        bool bUseSlot = (Watchers >= 3) || bForceSlotMode;
        if (bForceBoidsMode)
            bUseSlot = false;
        bLastWasSlotMode = bUseSlot;

        FVector AnchorRef = IsValid(WatchGroup) && !WatchGroup.AnchorLocation.IsNearlyZero()
            ? WatchGroup.AnchorLocation
            : LastFightAnchor;
        LastAnchorRef = AnchorRef;

        // Side-lock + LoS bypass refresh (run before any candidate validation).
        RefreshPreferredSide(AnchorRef);
        RefreshLoSBypassIfAnchorIndoors(AnchorRef);

        // Hysteresis: if watcher is settled, only re-enter movement when an
        // exit threshold is crossed. If unsettled, allow entering settle as
        // soon as the watcher is within enter bands.
        InvalidateSettleIfToggled();
        if (Watchers != LastWatcherCount)
        {
            bSettled = false;
            LastWatcherCount = Watchers;
        }

        if (bSettled)
        {
            if (!ShouldLeaveSettle(AnchorRef, bUseSlot))
            {
                LastRepositionReason = "settled";
                bLastArcDetour = false;
                return;
            }
            bSettled = false;
        }

        FVector NavTarget = FVector::ZeroVector;
        bool bAccepted = false;

        if (bUseSlot && IsValid(WatchGroup) && !WatchGroup.AnchorLocation.IsNearlyZero())
        {
            // Slot mode: try primary slot, then AngularRetryStepDeg neighbours.
            float ThetaBase = WatchGroup.GetSlotAngleForMember(Self);
            float StepRad = AngularRetryStepDeg * (PI / 180.0f);

            int MaxRetries = Math::Max(0, MaxAngularRetriesPerSide);
            int TotalSteps = 1 + 2 * MaxRetries;
            for (int K = 0; K < TotalSteps && !bAccepted; ++K)
            {
                int Index = (K == 0) ? 0 : ((K % 2 == 1) ? Math::IntegerDivisionTrunc(K + 1, 2) : -Math::IntegerDivisionTrunc(K, 2));
                float Theta = ThetaBase + Index * StepRad;
                FVector Candidate = AnchorRef
                    + FVector(Math::Cos(Theta), Math::Sin(Theta), 0.0f) * IdealRadius;
                Candidate.Z = AnchorRef.Z;

                if (!IsCandidateOnPreferredSide(Candidate, AnchorRef))
                {
                    DebugScript::DrawSphere(Candidate + FVector::UpVector * 20.0f, 12.0f, FColor::Orange, 0.3f);
                    continue;
                }

                FVector AcceptedNav;
                if (ValidateNavCandidate(Candidate, AnchorRef, AcceptedNav))
                {
                    NavTarget = AcceptedNav;
                    LastRepositionReason = f"slot[{Index}]";
                    bAccepted = true;
                    break;
                }

                DebugScript::DrawSphere(Candidate + FVector::UpVector * 20.0f, 15.0f, FColor::Red, 0.3f);
            }

            if (!bAccepted)
            {
                LastRepositionReason = "slot-all-rejected-hold";
                AI.AIController.StopMovement();
                bHasIssuedMoveTarget = false;
                return;
            }
        }
        else
        {
            // Boids mode: single candidate; if rejected, hold (no retries).
            FVector BoidsTarget = ComputeBoidsTarget(Fighters, LastFightAnchor);
            BoidsTarget.Z = AnchorRef.Z;

            // Side-clamp: keep the boids target on the watcher's side of the
            // fight axis. If candidate ends up on the wrong side, mirror it to
            // the preferred side with SideClampInset.
            if (bRequireSideLock && PreferredSideSign != 0
                && !IsCandidateOnPreferredSide(BoidsTarget, AnchorRef))
            {
                BoidsTarget = ClampToPreferredSide(BoidsTarget, AnchorRef);
            }

            FVector AcceptedNav;
            if (!ValidateNavCandidate(BoidsTarget, AnchorRef, AcceptedNav)
                || !IsCandidateOnPreferredSide(AcceptedNav, AnchorRef))
            {
                LastRepositionReason = "boids-rejected-hold";
                DebugScript::DrawSphere(BoidsTarget + FVector::UpVector * 20.0f, 15.0f, FColor::Red, 0.3f);
                AI.AIController.StopMovement();
                bHasIssuedMoveTarget = false;
                return;
            }

            NavTarget = AcceptedNav;
            LastRepositionReason = "boids";
        }

        // Avoid crossing the fight zone capsule. If detour fails, hold instead
        // of letting the nav path cut between fighters.
        if (IsValid(WatchGroup) && SegmentIntersectsFightZone(Self.FeetLocation, NavTarget,
            WatchGroup.AnchorLocation, WatchGroup.FightAxisXY, WatchGroup.FightAxisHalfLength,
            FighterAvoidanceLateralBand))
        {
            FVector DetourWp = ComputeDetourWaypoint(Self.FeetLocation, NavTarget,
                WatchGroup.AnchorLocation, WatchGroup.FightAxisXY,
                WatchGroup.FightAxisHalfLength, FighterAvoidanceLateralBand);

            FVector DetourNav;
            if (ValidateNavCandidate(DetourWp, AnchorRef, DetourNav))
            {
                NavTarget = DetourNav;
                LastRepositionReason = LastRepositionReason + "+detour";
            }
            else
            {
                LastRepositionReason = LastRepositionReason + "+detour-rejected-hold";
                DebugScript::DrawSphere(DetourWp + FVector::UpVector * 20.0f, 15.0f, FColor::Red, 0.3f);
                AI.AIController.StopMovement();
                bHasIssuedMoveTarget = false;
                return;
            }
        }

        // If the straight path enters the inner forbidden ring and the watcher
        // itself is outside it, reroute via an arc-tangent waypoint along the ring.
        // Watchers already inside the ring are exempt so they can step out radially.
        bLastArcDetour = false;
        float InnerRadius = IdealRadius * InnerForbiddenFactor;
        FVector AnchorXY = AnchorRef; AnchorXY.Z = 0.0f;
        FVector SelfXY = Self.FeetLocation; SelfXY.Z = 0.0f;
        bool bSelfOutsideInner = (SelfXY - AnchorXY).Size() > InnerRadius;
        if (bSelfOutsideInner
            && SegmentEntersInnerRing(Self.FeetLocation, NavTarget, AnchorRef, InnerRadius))
        {
            FVector ArcWp = ComputeArcTangentWaypoint(Self.FeetLocation, NavTarget, AnchorRef, IdealRadius, ArcStepDeg);
            LastArcWaypoint = ArcWp;

            FVector ArcNav;
            if (IsCandidateOnPreferredSide(ArcWp, AnchorRef)
                && ValidateNavCandidate(ArcWp, AnchorRef, ArcNav)
                && IsCandidateOnPreferredSide(ArcNav, AnchorRef)
                && !SegmentEntersInnerRing(Self.FeetLocation, ArcNav, AnchorRef, InnerRadius))
            {
                NavTarget = ArcNav;
                LastRepositionReason = LastRepositionReason + "+arc";
                bLastArcDetour = true;
            }
            else
            {
                // Refuse the original chord-crossing target outright. Hold this
                // tick; next tick re-evaluates and may try the opposite arc
                // direction after the anchor or slot shifts.
                LastRepositionReason = LastRepositionReason + "+arc-rejected-hold";
                DebugScript::DrawSphere(ArcWp + FVector::UpVector * 20.0f, 15.0f, FColor::Red, 0.3f);
                AI.AIController.StopMovement();
                bHasIssuedMoveTarget = false;
                return;
            }
        }

        // After all reroutes, try entering settle.
        if (ShouldEnterSettle(AnchorRef, bUseSlot))
        {
            bSettled = true;
            SettledAtAnchor = AnchorRef;
            float AngErr = 0.0f;
            if (ComputeSlotAngleErrorRad(AnchorRef, AngErr))
                SettledAtAngleRad = AngErr;
            LastRepositionReason = LastRepositionReason + "+enter-settle";
            AI.AIController.StopMovement();
            bHasIssuedMoveTarget = false;
            return;
        }

        LastTargetSpot = NavTarget;

        // Execute movement at appropriate speed.
        float DistToTarget = Self.FeetLocation.Distance(NavTarget);
        if (DistToTarget <= ArrivalDistance)
        {
            AI.AIController.StopMovement();
            bHasIssuedMoveTarget = false;
            return;
        }

        // Distance tier decides run vs walk.
        float DistToClosest = MAX_flt;
        if (IsValid(ClosestFighter))
        {
            DistToClosest = Self.FeetLocation.Distance(ClosestFighter.FeetLocation);
        }

        bool bShouldRun = (DistToClosest < DistanceTooClose)
            || (DistToClosest > DistanceTooFar)
            || (DistToTarget > 400.0f);

        SetWalkSpeed(bShouldRun ? EWalkSpeed::Running : EWalkSpeed::Walking);
        if (ShouldKeepCurrentMoveOrder(NavTarget))
        {
            LastRepositionReason = LastRepositionReason + "+keep-move";
            return;
        }

        AI.GotoPosition(NavTarget, ArrivalDistance);
        LastIssuedMoveTarget = NavTarget;
        LastMoveOrderAt = FInGameTime::Now();
        bHasIssuedMoveTarget = true;
    }

    void HandleFightEnded()
    {
        bFightIsOver = true;
        bSettled = false;

        FRememberedPerception Perception;

        FMemorizedEvent ReasonEvent;
        if (!FindMemoryEventWatchfightEndReason(ReasonEvent))
        {
            if (bObservedMultipleFightParticipants)
                AI.AssessEvent(GameplayTag::AIEvent_WatchFight_End_Run, Perception);
        }
        else
        {
            if (ReasonEvent.AffectedCharacterGlobalId == ReasonEvent.InstigatorGlobalId)
            {
               // Same ID for instigator + affected: no end event wired yet.
            }
            else if (ReasonEvent.EventTags.HasTag(GameplayTag::Memory_Combat_WasKilled))
            {
                if (AI.CharacterState.IsOfSpecies(GameplayTag::Species_Orc))
                {
                    AI.AssessEvent(GameplayTag::AIEvent_WatchFight_End_Killed_Good, Perception);
                }
                else if (!AI.CharacterState.IsFriendlyTowards(ReasonEvent.GetAffectedCharacterState()) &&
                    !AI.CharacterState.IsProtecting(ReasonEvent.GetAffectedCharacterState()) &&
                    !AI.CharacterState.IsNeutralTowards(ReasonEvent.GetAffectedCharacterState()))
                {
                    AI.AssessEvent(GameplayTag::AIEvent_WatchFight_End_Killed_Good, Perception);
                }
                else
                {
                    AI.AssessEvent(GameplayTag::AIEvent_WatchFight_End_Killed_Bad, Perception);
                }
            }
            else if (ReasonEvent.EventTags.HasTag(GameplayTag::Memory_Combat_WasDefeated))
            {
                if (AI.CharacterState.IsOfSpecies(GameplayTag::Species_Orc))
                {
                    AI.AssessEvent(GameplayTag::AIEvent_WatchFight_End_Defeated_Good, Perception);
                }
                else if (AI.CharacterState.IsFriendlyTowards(ReasonEvent.GetInstigatorCharacterState()))
                {
                    if (AI.CharacterState.IsFriendlyTowards(ReasonEvent.GetAffectedCharacterState()))
                    {
                        AI.AssessEvent(GameplayTag::AIEvent_WatchFight_End_Defeated_Neutral, Perception);
                    }
                    else
                    {
                        AI.AssessEvent(GameplayTag::AIEvent_WatchFight_End_Defeated_Good, Perception);
                    }
                }
                else if (AI.CharacterState.IsFriendlyTowards(ReasonEvent.GetAffectedCharacterState()))
                {
                    AI.AssessEvent(GameplayTag::AIEvent_WatchFight_End_Defeated_Bad, Perception);
                }
            }
        }

        AI.WaitSeconds(0.5f);
        AI.WaitUntilNoLongerSpeaking();

        AI.AssessEvent(GameplayTag::AIEvent_State_Done, FRememberedPerception());
        WaitSeconds(2.0f);
    }

    // -----------------------------------------------------------------------
    // Boids-mode target computation
    // -----------------------------------------------------------------------
    FVector ComputeBoidsTarget(const TArray<AGothicCharacter>& Fighters, FVector Anchor)
    {
        FVector Self2D = Self.FeetLocation;

        // Anchor pull: vector toward anchor + radial offset at IdealRadius.
        FVector AnchorOffset = Self2D - Anchor;
        AnchorOffset.Z = 0.0f;
        float AnchorDist = AnchorOffset.Size();
        FVector RadialOut = AnchorDist > 1.0f ? AnchorOffset / AnchorDist : Self.GetActorForwardVector();
        FVector DesiredAnchorSpot = Anchor + RadialOut * IdealRadius;
        FVector AnchorForce = DesiredAnchorSpot - Self2D;

        // Neighbour repulsion: other watchers within NeighbourRepulsionRadius.
        FVector NeighbourForce = FVector::ZeroVector;
        for (auto OtherCharacter : GetSensedLivingCharacters())
        {
            if (!IsValid(OtherCharacter) || OtherCharacter == Self)
                continue;

            if (!OtherCharacter.GetGothicAbilitySystemComponent().HasGameplayTag(GameplayTag::AIState_Conflict_WatchFight))
                continue;

            FVector Delta = Self2D - OtherCharacter.FeetLocation;
            Delta.Z = 0.0f;
            float DistSq = Delta.SizeSquared();
            if (DistSq < 1.0f)
                continue;
            if (DistSq > NeighbourRepulsionRadius * NeighbourRepulsionRadius)
                continue;

            NeighbourForce += Delta / DistSq;
        }
        NeighbourForce *= 20000.0f;

        // Fighter avoidance force: repulsion from any fighter inside DistanceSoftMin.
        FVector FighterForce = FVector::ZeroVector;
        for (auto F : Fighters)
        {
            if (!IsValid(F))
                continue;

            FVector Delta = Self2D - F.FeetLocation;
            Delta.Z = 0.0f;
            float Dist = Delta.Size();
            if (Dist < 1.0f)
                continue;
            if (Dist > DistanceSoftMin)
                continue;

            FighterForce += (Delta / Dist) * (DistanceSoftMin - Dist);
        }
        FighterForce *= 2.0f;

        FVector Total = AnchorForce + NeighbourForce + FighterForce;
        Total.Z = 0.0f;

        // Step size capped so each reposition moves a sane distance.
        float Step = Math::Clamp(Total.Size(), 0.0f, IdealRadius);
        FVector Dir = Total.GetSafeNormal();
        return Self2D + Dir * Math::Max(Step, 30.0f);
    }

    AGothicCharacter SelectClosestFighter(const TArray<AGothicCharacter>& Fighters) const
    {
        AGothicCharacter Closest = nullptr;
        float ClosestDist = MAX_flt;
        for (auto F : Fighters)
        {
            if (!IsValid(F))
                continue;

            float D = Self.FeetLocation.Distance(F.FeetLocation);
            if (D < ClosestDist)
            {
                ClosestDist = D;
                Closest = F;
            }
        }
        return Closest;
    }

    TArray<AGothicCharacter> GatherSensedFighters() const
    {
        TArray<AGothicCharacter> Fighters;
        for (auto Character : GetSensedLivingCharacters())
        {
            if (!IsValid(Character))
                continue;

            bool bIsPlayerControlled = Character.IsPlayerControlled();

            if (bIsPlayerControlled &&
                !Character.HasDrawnWeapon() &&
                !Character.IsBeingTargetedInCombat())
                continue;

            if (!bIsPlayerControlled && !ShouldCountCharacterAsWatchFightParticipant(Character))
                continue;

            Fighters.Add(Character);
        }
        return Fighters;
    }

    // -----------------------------------------------------------------------
    // Fight-zone capsule avoidance
    // -----------------------------------------------------------------------

    /**
     * Returns true if the line segment Start->End passes through a capsule
     * centred on FightCentre, oriented along Axis, with half-length AxisHalfLen
     * and radius LateralRadius. Tested in 2D (XY).
     */
    bool SegmentIntersectsFightZone(FVector Start, FVector End,
        FVector FightCentre, FVector Axis, float AxisHalfLen, float LateralRadius) const
    {
        FVector S = Start; S.Z = 0.0f;
        FVector E = End; E.Z = 0.0f;
        FVector C = FightCentre; C.Z = 0.0f;
        FVector AxisN = Axis; AxisN.Z = 0.0f;
        AxisN = AxisN.GetSafeNormal();

        // Sample a few points along the segment; cheap and good enough.
        const int Samples = 5;
        for (int i = 1; i < Samples; ++i)
        {
            float T = float(i) / float(Samples);
            FVector P = S + (E - S) * T;
            FVector ToP = P - C;
            float Along = ToP.DotProduct(AxisN);
            FVector Perp = ToP - AxisN * Along;
            float PerpDist = Perp.Size();

            if (Math::Abs(Along) <= AxisHalfLen && PerpDist <= LateralRadius)
                return true;
        }
        return false;
    }

    /**
     * Returns true if 2D segment Start->End approaches within Radius of Anchor.
     */
    bool SegmentEntersInnerRing(FVector Start, FVector End, FVector Anchor, float Radius) const
    {
        FVector S = Start; S.Z = 0.0f;
        FVector E = End;   E.Z = 0.0f;
        FVector A = Anchor; A.Z = 0.0f;
        FVector D = E - S;
        float Len = D.Size();
        if (Len < 1.0f)
            return (S - A).SizeSquared() < Radius * Radius;
        FVector DirN = D / Len;
        float T = (A - S).DotProduct(DirN);
        T = Math::Clamp(T, 0.0f, Len);
        FVector P = S + DirN * T;
        return (P - A).SizeSquared() < Radius * Radius;
    }

    /**
     * Returns a waypoint on the ring rotated ArcDeg degrees from the watcher's
     * current azimuth toward the target azimuth, in the shorter-arc direction.
     * Makes the watcher walk *around* the ring instead of cutting through it.
     */
    FVector ComputeArcTangentWaypoint(FVector SelfPos, FVector TargetOnRing,
        FVector Anchor, float Radius, float ArcDeg) const
    {
        FVector A = Anchor; A.Z = 0.0f;
        FVector S = SelfPos; S.Z = 0.0f;
        FVector T = TargetOnRing; T.Z = 0.0f;

        FVector RadialSelf = S - A;
        if (RadialSelf.IsNearlyZero())
            RadialSelf = FVector::ForwardVector;
        FVector RadialTarget = T - A;
        if (RadialTarget.IsNearlyZero())
            RadialTarget = -RadialSelf;
        RadialSelf = RadialSelf.GetSafeNormal();
        RadialTarget = RadialTarget.GetSafeNormal();

        FVector Cross = RadialSelf.CrossProduct(RadialTarget);
        float Sign = Cross.Z >= 0.0f ? 1.0f : -1.0f;

        FVector StepDir = RadialSelf.RotateAngleAxis(Sign * ArcDeg, FVector::UpVector);
        FVector Out = A + StepDir * Radius;
        Out.Z = Anchor.Z;
        return Out;
    }

    // -----------------------------------------------------------------------
    // Hysteresis helpers
    // -----------------------------------------------------------------------

    /**
     * Returns signed slot-angle error (target - current) in radians, around
     * the world-XY anchor. False if no slot info available.
     */
    bool ComputeSlotAngleErrorRad(FVector AnchorRef, float& OutErrorRad) const
    {
        if (!IsValid(WatchGroup))
            return false;

        FVector A2D = AnchorRef; A2D.Z = 0.0f;
        FVector S2D = Self.FeetLocation; S2D.Z = 0.0f;
        FVector Radial = S2D - A2D;
        if (Radial.IsNearlyZero())
            return false;
        Radial = Radial.GetSafeNormal();

        float Theta = WatchGroup.GetSlotAngleForMember(Self);
        FVector TargetDir = FVector(Math::Cos(Theta), Math::Sin(Theta), 0.0f);

        float Cos = Math::Clamp(Radial.DotProduct(TargetDir), -1.0f, 1.0f);
        float AbsTheta = Math::Acos(Cos);
        FVector Cross = Radial.CrossProduct(TargetDir);
        float Sign = Cross.Z >= 0.0f ? 1.0f : -1.0f;
        OutErrorRad = Sign * AbsTheta;
        return true;
    }

    float ComputeRadialError(FVector AnchorRef) const
    {
        FVector D = Self.FeetLocation - AnchorRef;
        D.Z = 0.0f;
        return D.Size() - IdealRadius;
    }

    bool ShouldEnterSettle(FVector AnchorRef, bool bSlotMode) const
    {
        float RadErr = ComputeRadialError(AnchorRef);
        if (Math::Abs(RadErr) > SettleRadiusBand)
            return false;
        if (bSlotMode)
        {
            float AngErr = 0.0f;
            if (!ComputeSlotAngleErrorRad(AnchorRef, AngErr))
                return false;
            if (Math::Abs(AngErr) > SettleAngleToleranceDeg * (PI / 180.0f))
                return false;
        }
        return true;
    }

    bool ShouldLeaveSettle(FVector AnchorRef, bool bSlotMode) const
    {
        if (bLastDangerActive)
            return true;

        float RadErr = ComputeRadialError(AnchorRef);
        if (Math::Abs(RadErr) > BreakRadiusBand)
            return true;

        FVector Drift = AnchorRef - SettledAtAnchor;
        Drift.Z = 0.0f;
        if (Drift.Size() > AnchorDriftThreshold)
            return true;

        if (bSlotMode)
        {
            float AngErr = 0.0f;
            if (ComputeSlotAngleErrorRad(AnchorRef, AngErr)
                && Math::Abs(AngErr) > BreakAngleToleranceDeg * (PI / 180.0f))
                return true;
        }
        return false;
    }

    void InvalidateSettleIfToggled()
    {
        if (bForceSlotMode != bLastForceSlot
            || bForceBoidsMode != bLastForceBoids
            || bDisableSpread != bLastDisableSpread)
        {
            bSettled = false;
        }
        bLastForceSlot = bForceSlotMode;
        bLastForceBoids = bForceBoidsMode;
        bLastDisableSpread = bDisableSpread;
    }

    void SetNextRepositionWithJitter()
    {
        float Jitter = Math::RandRange(0.0f, RepositionJitterMaxSeconds);
        NextRepositionAt = FInGameTime::XRealtimeSecondsFromNow(RepositionTickIntervalSeconds + Jitter);
    }

    // -----------------------------------------------------------------------
    // Side-lock helpers
    // -----------------------------------------------------------------------

    /** Perpendicular to the fight axis in XY. Zero-vector if axis missing. */
    FVector GetSideAxisPerp() const
    {
        if (!IsValid(WatchGroup))
            return FVector::ZeroVector;
        FVector Axis = WatchGroup.FightAxisXY;
        Axis.Z = 0.0f;
        Axis = Axis.GetSafeNormal();
        if (Axis.IsNearlyZero())
            return FVector::ZeroVector;
        return Axis.CrossProduct(FVector::UpVector).GetSafeNormal();
    }

    int SignOfDot(FVector V, FVector Ref) const
    {
        float D = V.DotProduct(Ref);
        if (D > 1.0f) return 1;
        if (D < -1.0f) return -1;
        return 0;
    }

    /** Caches current side sign for the watcher; flips after sticky timeout. */
    void RefreshPreferredSide(FVector AnchorRef)
    {
        FVector Perp = GetSideAxisPerp();
        if (Perp.IsNearlyZero())
            return;

        FVector Radial = Self.FeetLocation - AnchorRef;
        Radial.Z = 0.0f;
        int CurSign = SignOfDot(Radial, Perp);

        if (PreferredSideSign == 0 && CurSign != 0)
        {
            PreferredSideSign = CurSign;
            SideMismatchSince = FInGameTime();
            return;
        }

        if (CurSign != 0 && CurSign != PreferredSideSign)
        {
            if (!SideMismatchSince.IsValid())
            {
                SideMismatchSince = FInGameTime::Now();
            }
            else if (SideMismatchSince.AgeInRealtimeSeconds >= SideStickyTimeoutSeconds)
            {
                PreferredSideSign = CurSign;
                SideMismatchSince = FInGameTime();
            }
        }
        else
        {
            SideMismatchSince = FInGameTime();
        }
    }

    bool IsCandidateOnPreferredSide(FVector Candidate, FVector AnchorRef) const
    {
        if (!bRequireSideLock || PreferredSideSign == 0)
            return true;

        FVector Perp = GetSideAxisPerp();
        if (Perp.IsNearlyZero())
            return true;

        FVector Radial = Candidate - AnchorRef;
        Radial.Z = 0.0f;
        int Sign = SignOfDot(Radial, Perp);
        if (Sign == 0)
            return true;
        return Sign == PreferredSideSign;
    }

    /** Mirrors a point across the fight axis line through anchor, with inset. */
    FVector ClampToPreferredSide(FVector Candidate, FVector AnchorRef) const
    {
        FVector Perp = GetSideAxisPerp();
        if (Perp.IsNearlyZero() || PreferredSideSign == 0)
            return Candidate;
        FVector Radial = Candidate - AnchorRef;
        Radial.Z = 0.0f;
        float Along = Radial.DotProduct(Perp);
        int Sign = (Along > 0.0f) ? 1 : (Along < 0.0f ? -1 : 0);
        if (Sign == PreferredSideSign || Sign == 0)
            return Candidate;
        // Project candidate to the axis line, then push by SideClampInset on the preferred side.
        FVector Adjusted = Candidate - Perp * Along + Perp * (float(PreferredSideSign) * SideClampInset);
        Adjusted.Z = Candidate.Z;
        return Adjusted;
    }

    /**
     * LoS-bypass fallback: if anchor itself appears indoors (no LoS to any
     * sample on the watch ring), allow this watcher to ignore LoS this tick.
     */
    void RefreshLoSBypassIfAnchorIndoors(FVector AnchorRef)
    {
        bLastLoSBypassedAnchor = false;
        if (!bRequireLoSFromAnchor)
            return;

        // 8 samples around the ring at IdealRadius.
        for (int i = 0; i < 8; ++i)
        {
            float Theta = (2.0f * PI * i) / 8.0f;
            FVector Sample = AnchorRef
                + FVector(Math::Cos(Theta), Math::Sin(Theta), 0.0f) * IdealRadius;
            Sample.Z = AnchorRef.Z;
            if (HasLoSFromAnchorTo(AnchorRef, Sample))
                return;
        }

        bLastLoSBypassedAnchor = true;
    }

    /**
     * Picks an off-axis intermediate point so the move goes around the fight
     * capsule instead of through it.
     */
    FVector ComputeDetourWaypoint(FVector Start, FVector End,
        FVector FightCentre, FVector Axis, float AxisHalfLen, float LateralRadius) const
    {
        FVector AxisN = Axis; AxisN.Z = 0.0f;
        AxisN = AxisN.GetSafeNormal();
        FVector Perp = AxisN.CrossProduct(FVector::UpVector).GetSafeNormal();

        FVector ToStart = Start - FightCentre;
        ToStart.Z = 0.0f;
        float StartSide = ToStart.DotProduct(Perp);
        FVector Side = StartSide >= 0.0f ? Perp : -Perp;

        // Detour at the closer end of the capsule, on the same side as start.
        FVector ToEnd = End - FightCentre;
        ToEnd.Z = 0.0f;
        float EndAlong = ToEnd.DotProduct(AxisN);
        FVector EndCap = FightCentre + AxisN * Math::Clamp(EndAlong, -AxisHalfLen, AxisHalfLen);

        float Margin = LateralRadius + 100.0f;
        FVector Waypoint = EndCap + Side * Margin;
        Waypoint.Z = Start.Z;
        return Waypoint;
    }

    // -----------------------------------------------------------------------
    // Memory lookup for fight-end reason
    // -----------------------------------------------------------------------
    bool FindMemoryEventWatchfightEndReason(FMemorizedEvent&out MemorizedEvent)
    {
        auto DefeatedMemories = AI.CharacterState.LongTermMemory.Filter()
            .AfterTime(FInGameTime::XRealtimeSecondsAgo(5.0f))
            .WithTag(GameplayTag::Memory_Combat_WasDefeated)
            .MostRecentOnly().Array;

        auto KilledMemories = AI.CharacterState.LongTermMemory.Filter()
            .AfterTime(FInGameTime::XRealtimeSecondsAgo(5.0f))
            .WithTag(GameplayTag::Memory_Combat_WasKilled)
            .MostRecentOnly().Array;

        if (!DefeatedMemories.IsEmpty() && !KilledMemories.IsEmpty())
        {
            auto KilledMemory = KilledMemories.Last();
            auto DefeatedMemory = DefeatedMemories.Last();

            MemorizedEvent = KilledMemory.Time.AgeInRealtimeSeconds <= DefeatedMemory.Time.AgeInRealtimeSeconds ?
                KilledMemory :
                DefeatedMemory;
            return true;
        }

        if (!KilledMemories.IsEmpty())
        {
            MemorizedEvent = KilledMemories.Last();
            return true;
        }

        if (!DefeatedMemories.IsEmpty())
        {
            MemorizedEvent = DefeatedMemories.Last();
            return true;
        }

        return false;
    }

    FString GetDisplayName() const override
    {
        return "Watch Fight State";
    }

    bool ProjectPositionOntoNavmesh(AGothicCharacter Character, FVector Position, FVector& OutPosition) const
    {
        return UNavigationSystemV1::ProjectPointExtent(Character, Position, OutPosition, FVector(20.0f, 20.0f, MaxLevelZDelta));
    }

    bool GetClosestPositionOnNavmesh(AGothicCharacter Character, FVector Position, FVector& OutPosition) const
    {
        return UNavigationSystemV1::ProjectPointExtent(Character, Position, OutPosition, FVector(150.0f, 150.0f, MaxLevelZDelta * 2.0f));
    }

    bool ShouldKeepCurrentMoveOrder(FVector NavTarget)
    {
        if (!bHasIssuedMoveTarget)
            return false;
        if (!LastMoveOrderAt.IsValid())
            return false;
        if (LastMoveOrderAt.AgeInRealtimeSeconds >= MinimumRetargetSeconds)
            return false;
        if (!IsSpotSafeFromFighters(LastIssuedMoveTarget, FighterSafetyRadius))
            return false;

        FVector Delta = NavTarget - LastIssuedMoveTarget;
        Delta.Z = 0.0f;
        return Delta.Size() < MinimumRetargetDistance;
    }

    float DistanceSq2D(FVector A, FVector B) const
    {
        FVector A2D = A;
        FVector B2D = B;
        A2D.Z = 0.0f;
        B2D.Z = 0.0f;
        return (A2D - B2D).SizeSquared();
    }

    bool IsSpotSafeFromFighters(FVector Spot, float Radius) const
    {
        float SafeRadius = Math::Max(TrueMinimumDistance, Radius);
        float SafeRadiusSq = SafeRadius * SafeRadius;
        TArray<AGothicCharacter> Fighters = GatherSensedFighters();
        for (auto F : Fighters)
        {
            if (!IsValid(F))
                continue;
            if (DistanceSq2D(Spot, F.FeetLocation) < SafeRadiusSq)
                return false;
        }
        return true;
    }

    bool DoesEmergencyEscapeImproveDistance(FVector Start, FVector End, AGothicCharacter Fighter) const
    {
        if (!IsValid(Fighter))
            return false;

        float StartDist = Math::Sqrt(DistanceSq2D(Start, Fighter.FeetLocation));
        float EndDist = Math::Sqrt(DistanceSq2D(End, Fighter.FeetLocation));
        return EndDist >= StartDist + EmergencyEscapeMinDistanceGain;
    }

    bool DoesMoveSegmentStaySafeFromFighters(FVector Start, FVector End, float Radius) const
    {
        float SafeRadius = Math::Max(TrueMinimumDistance, Radius);
        float SafeRadiusSq = SafeRadius * SafeRadius;
        const int Samples = 6;
        TArray<AGothicCharacter> Fighters = GatherSensedFighters();
        for (auto F : Fighters)
        {
            if (!IsValid(F))
                continue;

            FVector FighterPos = F.FeetLocation;
            float StartDistSq = DistanceSq2D(Start, FighterPos);
            float EndDistSq = DistanceSq2D(End, FighterPos);
            if (EndDistSq < SafeRadiusSq)
                return false;

            float AllowedMinSq = StartDistSq < SafeRadiusSq ? Math::Max(0.0f, StartDistSq - 25.0f) : SafeRadiusSq;
            for (int i = 1; i <= Samples; ++i)
            {
                float T = float(i) / float(Samples);
                FVector P = Start + (End - Start) * T;
                if (DistanceSq2D(P, FighterPos) < AllowedMinSq)
                    return false;
            }
        }
        return true;
    }

    /**
     * Validates a desired world spot as a viable WatchFight target:
     *  - Projects onto navmesh (returns false if no nearby nav).
     *  - Rejects if |Z - AnchorRef.Z| > MaxLevelZDelta (different floor).
     *  - Rejects if path from Self to candidate exceeds MaxAbsPathLen or
     *    has path/straight_xy ratio > MaxPathRatio.
     */
    bool ValidateNavCandidate(FVector Desired, FVector AnchorRef, FVector& OutNav)
    {
        if (!TryGetPositionToMoveTo(Self, OutNav, Desired))
            return false;

        if (Math::Abs(OutNav.Z - AnchorRef.Z) > MaxLevelZDelta)
            return false;

        if (!IsSpotSafeFromFighters(OutNav, FighterSafetyRadius))
            return false;

        if (!DoesMoveSegmentStaySafeFromFighters(Self.FeetLocation, OutNav, FighterPathSafetyRadius))
            return false;

        FVector FromXY = Self.FeetLocation; FromXY.Z = 0.0f;
        FVector ToXY   = OutNav;            ToXY.Z   = 0.0f;
        float StraightXY = FromXY.Distance(ToXY);
        if (StraightXY < 1.0f)
            return true;

        float32 PathLen = MAX_flt;
        bool bExists = UNavigationSystemV1::DoesPathExistWithinLengthLimit(
            Self, Self.NavAgentLocation, OutNav, MaxAbsPathLen, PathLen);
        if (!bExists)
            return false;
        if (PathLen > MaxAbsPathLen)
            return false;
        if (PathLen / StraightXY > MaxPathRatio)
            return false;

        // LoS from anchor at eye height to candidate spot; reject if blocked
        // (catches "behind a wall / inside a building" cases where a navmesh
        // path exists around the obstacle).
        if (bRequireLoSFromAnchor && !bLastLoSBypassedAnchor)
        {
            if (!HasLoSFromAnchorTo(AnchorRef, OutNav))
                return false;
        }

        return true;
    }

    /**
     * True if a Visibility trace from anchor eye to candidate offset is clear.
     * Fighters are added to the ignore list so a fighter standing on the line
     * doesn't cause false rejections.
     */
    bool HasLoSFromAnchorTo(FVector AnchorRef, FVector Candidate)
    {
        FVector AnchorEye = AnchorRef + FVector(0.0f, 0.0f, LoSEyeHeight);
        FVector SpotEye   = Candidate + FVector(0.0f, 0.0f, LoSCandidateOffset);

        TArray<AActor> Ignore;
        Ignore.Add(Self);
        for (auto F : GatherSensedFighters())
        {
            if (IsValid(F))
                Ignore.Add(F);
        }

        FHitResult Hit;
        ETraceTypeQuery TraceType = UCollisionProfile::ConvertToTraceType(ECollisionChannel::ECC_Visibility);
        bool bBlocked = System::LineTraceSingle(
            AnchorEye, SpotEye, TraceType, false, Ignore,
            EDrawDebugTrace::None, Hit, true);
        return !bBlocked;
    }

    bool TryGetPositionToMoveTo(AGothicCharacter Character, FVector& OutPosition, FVector BestPosition)
    {
        if (TryGetPositionToMoveToOnNavmesh(Character, OutPosition, BestPosition))
            return true;

        if (TryGetClosestPositionOnNavmesh(Character, OutPosition, BestPosition))
            return true;

        return false;
    }

    bool TryGetPositionToMoveToOnNavmesh(AGothicCharacter Character, FVector& OutPosition, FVector BestPosition)
    {
        if (ProjectPositionOntoNavmesh(Character, BestPosition, OutPosition) && IsPositionValid(OutPosition))
        {
            return true;
        }
        return false;
    }

    bool TryGetClosestPositionOnNavmesh(AGothicCharacter Character, FVector& OutPosition, FVector BestPosition)
    {
        if (GetClosestPositionOnNavmesh(Character, BestPosition, OutPosition) && IsPositionValid(OutPosition))
        {
            return true;
        }
        return false;
    }

    bool CanMoveIntoDirection(FVector Direction)
    {
        if (!IsValid(Self))
            return false;
        return AI.CanMoveIntoDirection(Direction, 800.0f);
    }

    bool IsPositionValid(FVector Position) const
    {
        return true;
    }

#if WITH_IMGUI
    UFUNCTION(BlueprintOverride)
    void DisplayImGui()
    {
        ImGui::Text("Watch Fight State");
        ImGui::Separator();

        FString ModeText = bLastWasSlotMode ? "SLOT" : "BOIDS";
        ImGui::TextColored(FColor::Cyan, f"Mode: {ModeText}");
        ImGui::TextDisabled(f"Last reason: {LastRepositionReason}");

        if (IsValid(WatchGroup))
        {
            int Slot = -1;
            WatchGroup.SlotIndices.Find(Self, Slot);
            int Total = WatchGroup.MemberCount;
            ImGui::Text(f"Slot: {Slot} / {Total}");
            ImGui::Text(f"Group anchor: {WatchGroup.AnchorLocation}");
            ImGui::Text(f"Group axis XY: {WatchGroup.FightAxisXY} (halflen {WatchGroup.FightAxisHalfLength})");
        }
        else
        {
            ImGui::TextColored(FColor::Yellow, "No watch group attached.");
        }

        ImGui::Separator();
        ImGui::Text("Sensed fighters:");
        ImGui::Indent(10.0f);
        TArray<AGothicCharacter> Fighters = GatherSensedFighters();
        for (auto F : Fighters)
        {
            if (!IsValid(F))
                continue;

            float D = Self.FeetLocation.Distance(F.FeetLocation);
            FColor Col = D < DistanceTooClose ? FColor::Red
                : (D > DistanceTooFar ? FColor::Yellow : FColor::Green);
            ImGui::TextColored(Col, f"{F.CharacterUniqueName} d={D:.0f}");
        }
        ImGui::Indent(-10.0f);

        ImGui::Separator();
        if (bLastDangerActive)
        {
            ImGui::TextColored(FColor::Red, "DANGER ACTIVE");
        }
        else
        {
            ImGui::TextColored(FColor::Green, "Safe");
        }

        ImGui::Separator();
        ImGui::Text("Tweakables");
        ImGui::Slider("IdealRadius", IdealRadius, 200.0f, 1500.0f);
        ImGui::Slider("DistanceTooClose", DistanceTooClose, 50.0f, 600.0f);
        ImGui::Slider("DistanceSoftMin", DistanceSoftMin, 100.0f, 1200.0f);
        ImGui::Slider("DistanceSoftMax", DistanceSoftMax, 200.0f, 2000.0f);
        ImGui::Slider("DistanceTooFar", DistanceTooFar, 400.0f, 3000.0f);
        ImGui::Slider("RepositionTickInterval", RepositionTickIntervalSeconds, 0.05f, 1.0f);
        ImGui::Slider("DangerChargeDot", DangerChargeDotThreshold, 0.0f, 1.0f);
        ImGui::Slider("DangerLookahead s", DangerLookaheadSeconds, 0.0f, 2.0f);
        ImGui::Slider("NeighbourRepulsionRadius", NeighbourRepulsionRadius, 50.0f, 600.0f);
        ImGui::Slider("FighterLateralBand", FighterAvoidanceLateralBand, 50.0f, 500.0f);
        ImGui::Slider("FighterSafetyRadius", FighterSafetyRadius, 200.0f, 900.0f);
        ImGui::Slider("FighterPathSafetyRadius", FighterPathSafetyRadius, 200.0f, 900.0f);
        ImGui::Slider("MinimumRetargetDistance", MinimumRetargetDistance, 50.0f, 500.0f);
        ImGui::Slider("MinimumRetargetSeconds", MinimumRetargetSeconds, 0.0f, 4.0f);
        ImGui::Slider("DangerMoveCooldown", DangerMoveCooldownSeconds, 0.0f, 3.0f);
        ImGui::Slider("DangerStepDistance", DangerStepDistance, 50.0f, 500.0f);
        ImGui::Slider("EmergencyEscapeDistance", EmergencyEscapeDistance, 50.0f, 500.0f);
        ImGui::Slider("EmergencyEscapeStepDistance", EmergencyEscapeStepDistance, 100.0f, 800.0f);
        ImGui::Slider("EmergencyEscapeCooldown", EmergencyEscapeCooldownSeconds, 0.0f, 1.0f);
        ImGui::Slider("EmergencyEscapeMinGain", EmergencyEscapeMinDistanceGain, 20.0f, 300.0f);
        ImGui::Slider("MaxLevelZDelta", MaxLevelZDelta, 50.0f, 400.0f);
        ImGui::Slider("MaxPathRatio", MaxPathRatio, 1.1f, 3.0f);
        ImGui::Slider("MaxAbsPathLen", MaxAbsPathLen, 500.0f, 5000.0f);
        ImGui::Slider("AngularRetryStepDeg", AngularRetryStepDeg, 5.0f, 45.0f);
        ImGui::Text(f"MaxAngularRetriesPerSide: {MaxAngularRetriesPerSide}");
        ImGui::SameLine();
        if (ImGui::Button("-##retries") && MaxAngularRetriesPerSide > 0)
            MaxAngularRetriesPerSide -= 1;
        ImGui::SameLine();
        if (ImGui::Button("+##retries") && MaxAngularRetriesPerSide < 4)
            MaxAngularRetriesPerSide += 1;

        ImGui::Separator();
        ImGui::Text("No-cross + hysteresis");
        ImGui::Slider("InnerForbiddenFactor", InnerForbiddenFactor, 0.3f, 0.95f);
        ImGui::Slider("ArcStepDeg", ArcStepDeg, 5.0f, 90.0f);
        ImGui::Slider("SettleRadiusBand", SettleRadiusBand, 20.0f, 600.0f);
        ImGui::Slider("BreakRadiusBand", BreakRadiusBand, 50.0f, 800.0f);
        ImGui::Slider("SettleAngleTolDeg", SettleAngleToleranceDeg, 1.0f, 60.0f);
        ImGui::Slider("BreakAngleTolDeg", BreakAngleToleranceDeg, 5.0f, 120.0f);
        ImGui::Slider("AnchorDriftThresh", AnchorDriftThreshold, 50.0f, 1000.0f);
        ImGui::Slider("RepositionJitterMax", RepositionJitterMaxSeconds, 0.0f, 1.0f);

        ImGui::Separator();
        ImGui::Text("LoS + side-lock");
        ImGui::Checkbox("RequireLoSFromAnchor", bRequireLoSFromAnchor);
        ImGui::Slider("LoSEyeHeight", LoSEyeHeight, 50.0f, 300.0f);
        ImGui::Slider("LoSCandidateOffset", LoSCandidateOffset, 20.0f, 250.0f);
        ImGui::Checkbox("RequireSideLock", bRequireSideLock);
        ImGui::Slider("SideStickyTimeout s", SideStickyTimeoutSeconds, 0.5f, 15.0f);
        ImGui::Slider("SideClampInset", SideClampInset, 20.0f, 300.0f);

        FString SideText = (PreferredSideSign == 0) ? "uninit"
            : (PreferredSideSign > 0 ? "+1" : "-1");
        FColor SideColor = (PreferredSideSign == 0) ? FColor::Yellow : FColor::Green;
        ImGui::TextColored(SideColor, f"PreferredSide: {SideText}");

        float MismatchAge = SideMismatchSince.IsValid() ? SideMismatchSince.AgeInRealtimeSeconds : 0.0f;
        ImGui::Text(f"SideMismatchAge: {MismatchAge:.2f} s");

        if (bLastLoSBypassedAnchor)
            ImGui::TextColored(FColor::Yellow, "LoS bypassed (anchor appears indoors)");

        FColor SettleColor = bSettled ? FColor::Green : FColor::Yellow;
        FString SettleText = bSettled ? "SETTLED" : "MOVING";
        ImGui::TextColored(SettleColor, f"State: {SettleText}");

        if (!LastAnchorRef.IsNearlyZero())
        {
            float RadErr = ComputeRadialError(LastAnchorRef);
            ImGui::Text(f"Radial err: {RadErr:.0f}");
            float AngErr = 0.0f;
            if (ComputeSlotAngleErrorRad(LastAnchorRef, AngErr))
            {
                float AngErrDeg = AngErr * (180.0f / PI);
                ImGui::Text(f"Slot angle err: {AngErrDeg:.1f} deg");
            }
        }

        ImGui::Checkbox("Force slot mode", bForceSlotMode);
        ImGui::Checkbox("Force boids mode", bForceBoidsMode);
        ImGui::Checkbox("Disable spread", bDisableSpread);
        ImGui::Checkbox("Disable danger", bDisableDanger);

        // 3D draw aids.
        if (!LastFightAnchor.IsNearlyZero())
        {
            DebugScript::DrawCircle(LastFightAnchor + FVector::UpVector * 5.0f, IdealRadius, FColor::Cyan, 0.0f, 50.0f);
            DebugScript::DrawCircle(LastFightAnchor + FVector::UpVector * 5.0f,
                IdealRadius * InnerForbiddenFactor, FColor::Red, 0.0f, 50.0f);
            DebugScript::DrawLine(LastFightAnchor,
                LastFightAnchor + LastFightAxis * (IsValid(WatchGroup) ? WatchGroup.FightAxisHalfLength : 100.0f),
                FColor::Yellow, 0.0f, 3.0f);
            DebugScript::DrawLine(LastFightAnchor,
                LastFightAnchor - LastFightAxis * (IsValid(WatchGroup) ? WatchGroup.FightAxisHalfLength : 100.0f),
                FColor::Yellow, 0.0f, 3.0f);
        }

        if (!LastTargetSpot.IsNearlyZero())
        {
            DebugScript::DrawLine(LastTargetSpot, LastTargetSpot + FVector::UpVector * 200.0f, FColor::Magenta, 0.0f, 3.0f);
            DebugScript::DrawLine(Self.FeetLocation, LastTargetSpot, FColor::Magenta, 0.0f, 2.0f);
        }

        if (bLastArcDetour && !LastArcWaypoint.IsNearlyZero())
        {
            DebugScript::DrawSphere(LastArcWaypoint + FVector::UpVector * 20.0f, 25.0f, FColor::Yellow, 0.0f);
            DebugScript::DrawLine(Self.FeetLocation, LastArcWaypoint, FColor::Yellow, 0.0f, 2.0f);
        }

        // LoS trace visualization (anchor eye -> last target spot eye).
        if (bRequireLoSFromAnchor && !LastFightAnchor.IsNearlyZero() && !LastTargetSpot.IsNearlyZero())
        {
            FVector AnchorEye = LastFightAnchor + FVector(0.0f, 0.0f, LoSEyeHeight);
            FVector SpotEye   = LastTargetSpot + FVector(0.0f, 0.0f, LoSCandidateOffset);
            FColor LoSColor = bLastLoSBypassedAnchor ? FColor::Orange : FColor::Cyan;
            DebugScript::DrawLine(AnchorEye, SpotEye, LoSColor, 0.0f, 1.0f);
        }

        // Side-axis boundary (extends the fight axis through anchor for clarity).
        if (!LastFightAnchor.IsNearlyZero() && IsValid(WatchGroup))
        {
            FVector AxisExtent = WatchGroup.FightAxisXY * (IdealRadius + 200.0f);
            DebugScript::DrawLine(LastFightAnchor + AxisExtent + FVector::UpVector * 5.0f,
                LastFightAnchor - AxisExtent + FVector::UpVector * 5.0f,
                FColor::White, 0.0f, 1.0f);
        }
    }
#endif

    TSubclassOf<UNavigationQueryFilter> GetNavigationQueryFilterForAgent(const UObject Querier) override
    {
        return UNavigationAreaFilter_Human_WatchFight;
    }
}

UCLASS()
class UAIState_WatchFight_Orc : UAIState_WatchFight
{
    default TrueMinimumDistance = 500.0f;
}

/** Human Default NavAreaFilter is shared by Humans and Orcs */
UCLASS()
class UNavigationAreaFilter_Human_WatchFight : UNavigationAreaFilter_Human
{
    default ExcludeWaterArea();
}
