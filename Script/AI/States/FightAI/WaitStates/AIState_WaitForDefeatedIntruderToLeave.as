class UAIValueSet_DefeatedIntruder : UAIValueSet
{
    // --- Tuning ---

    /** Hold the intruder up to this many seconds without a fresh sensed hit, as long as the cached intruder is still in the trespass volume. */
    float MaximumTimeSecondsWithoutVisibleHostile = 60.0f;

    /** Recent-defeat memory window used by CombatEndActions when reusing the just-fought opponent as the wait target. */
    float DefeatedMemoryRecentSeconds = 15.0f;

    /** Seconds after intruder stands up while still trespassing before re-registering trespass and re-escalating. */
    float TrespassReactivationSeconds = 15.0f;

    /** One-shot retreat distance attempted on state entry to clear narrow choke points (doors, corridors). */
    float IntroRetreatDistance = 250.0f;

    /** Nav stall guard for the intro retreat. */
    float IntroRetreatTimeLimitSeconds = 3.0f;

    /** Distance below which guard steps back each tick. */
    float ProximityBackoffDistance = 200.0f;

    /** Per-tick step-back distance when intruder inside ProximityBackoffDistance. */
    float ProximityBackoffStepDistance = 160.0f;

    // --- Runtime cache ---

    /** Cached intruder so brief perception gaps don't drop the wait. */
    AGothicCharacter LastKnownIntruder;

    /** Updated each tick the intruder is freshly sensed (or when CombatEndActions seeds the cache); drives grace expiry. */
    FInGameTime TimeLastIntruderWasSensed;

    /** Set once when the intruder is no longer defeated but still trespassing; drives reactivation timer. */
    FInGameTime TimeIntruderStoodUp;

    /** Prevents firing AIEvent_TrespassIntruder_StillPresentAfterDefeat more than once per wait cycle. */
    bool bTrespassReactivationFired = false;
}

class UAIState_WaitForDefeatedIntruderToLeave : UAIState_Conflict
{
    default OwnedGameplayTags.AddTag(GameplayTag::AIState_Wait_DefeatedIntruder);
    default AIStateTag = GameplayTag::AIState_Wait_DefeatedIntruder;

    bool bAnyDefeatedIntrudersLeft = false;
    bool bNoLongerDefeatedWarningGiven = false;

    UFUNCTION(BlueprintCallable)
    void SelectCharacterOfInterest()
    {
        float MinDistance = MAX_flt;
        AGothicCharacter WarningCharacterOfInterest = nullptr;
        bAnyDefeatedIntrudersLeft = false;

        for (auto OtherCharacter : AI.Self.Perception.GetAllSensedCharacters(FGameplayTagContainer(), FGameplayTagContainer()))
        {
            // Has to be trespassing
            if (!OtherCharacter.CharacterState.IsCharacterTrespassingAccordingToWitness(AI.CharacterState))
                continue;

            // Has to be defeated or have been defeated recently
            if (!OtherCharacter.IsDefeated() && 
                Self.Perception.Memory.Filter()
                    .FilterByType(GameplayTag::AIEvent_Seen_Defeated)
                    .FilterOriginCharacterIs(OtherCharacter)
                    .FilterRecent(10.0f)
                    .ToArray().IsEmpty())
                continue;

            if (OtherCharacter.IsDefeated())
            {
                bAnyDefeatedIntrudersLeft = true;
            }
            
            float Distance = CharacterState.GetDistanceTo(OtherCharacter);
            if (Distance >= MinDistance)
                continue;
            
            WarningCharacterOfInterest = OtherCharacter;
            MinDistance = Distance;
        }

        auto Storage = AI.SpawnedStorage(UAIValueSet_DefeatedIntruder);

        if (IsValid(WarningCharacterOfInterest))
        {
            Storage.LastKnownIntruder = WarningCharacterOfInterest;
            Storage.TimeLastIntruderWasSensed = FInGameTime::Now();
        }
        else if (IsValid(Storage.LastKnownIntruder)
            && IsValid(Storage.LastKnownIntruder.CharacterState)
            && Storage.LastKnownIntruder.CharacterState.IsCharacterTrespassingAccordingToWitness(AI.CharacterState)
            && Storage.TimeLastIntruderWasSensed.IsValid()
            && Storage.TimeLastIntruderWasSensed.AgeInRealtimeSeconds <= Storage.MaximumTimeSecondsWithoutVisibleHostile)
        {
            WarningCharacterOfInterest = Storage.LastKnownIntruder;
            if (Storage.LastKnownIntruder.IsDefeated())
            {
                bAnyDefeatedIntrudersLeft = true;
            }
        }

        CharacterOfInterest = WarningCharacterOfInterest;
        if (CharacterOfInterest == nullptr)
            return;

        AI.TargetCharacterOfInterest(FocusPriority, this);
    }

    void TryReactivateTrespassIfStillPresent()
    {
        if (!IsValid(CharacterOfInterest) || !IsValid(CharacterOfInterest.CharacterState))
            return;

        if (bAnyDefeatedIntrudersLeft)
            return;

        if (!CharacterOfInterest.CharacterState.IsCharacterTrespassingAccordingToWitness(AI.CharacterState))
            return;

        auto Storage = AI.SpawnedStorage(UAIValueSet_DefeatedIntruder);

        if (!Storage.TimeIntruderStoodUp.IsValid())
            Storage.TimeIntruderStoodUp = FInGameTime::Now();

        if (Storage.bTrespassReactivationFired)
            return;

        if (Storage.TimeIntruderStoodUp.AgeInRealtimeSeconds < Storage.TrespassReactivationSeconds)
            return;

        FRememberedPerception ReactivationPerception;
        ReactivationPerception.Instigator.Character = CharacterOfInterest;
        ReactivationPerception.Instigator.CharacterState = CharacterOfInterest.CharacterState;
        ReactivationPerception.Instigator.Tags.AddTag(CharacterOfInterest.CharacterState.AreaTagOfLocation);

        AI.AssessEvent(GameplayTag::AIEvent_TrespassIntruder_StillPresentAfterDefeat, ReactivationPerception);
        Storage.bTrespassReactivationFired = true;
    }

    void BeginIntroRetreat()
    {
        if (!IsValid(CharacterOfInterest))
            return;

        auto Storage = AI.SpawnedStorage(UAIValueSet_DefeatedIntruder);

        SetWalkSpeed(EWalkSpeed::Walking);
        FVector DirAway = (Self.GetFeetLocation() - CharacterOfInterest.GetFeetLocation()).GetSafeNormal2D();
        if (DirAway.IsNearlyZero())
            return;

        if (AI.Self.CanStrafe())
            AI.GoIntoDirection(DirAway, 600.0f, TimeLimitSeconds = Storage.IntroRetreatTimeLimitSeconds, MinimumMoveDistance = Storage.IntroRetreatDistance);
        else
            AI.DodgeAwayFromTarget();
    }

    void MaintainProximityFromIntruder()
    {
        if (!IsValid(CharacterOfInterest))
            return;

        auto Storage = AI.SpawnedStorage(UAIValueSet_DefeatedIntruder);

        if (Self.GetDistanceTo(CharacterOfInterest) >= Storage.ProximityBackoffDistance)
            return;

        FVector Dir = (Self.FeetLocation - CharacterOfInterest.FeetLocation).GetSafeNormal2D();
        if (Dir.IsNearlyZero())
            return;

        SetWalkSpeed(EWalkSpeed::Walking);
        if (AI.Self.CanStrafe())
            AI.GoIntoDirection(Dir, Storage.ProximityBackoffStepDistance);
        else
            AI.DodgeAwayFromTarget();
    }

    UFUNCTION(BlueprintOverride)
    void DoTask() final
    {
        Super::DoTask(); 

        AI.UndrawWeapon();

        EnableStrafeMovementAndTurnToTargetMode();
        SelectCharacterOfInterest();
        if (IsValid(CharacterOfInterest))
            AI.TurnToCharacter(CharacterOfInterest);

        BeginIntroRetreat();

        while(!bShouldExitState)
        {
            // EvaluateDisengage();
            SelectCharacterOfInterest();

            if (CharacterOfInterest == nullptr)
            {
                AI.AssessEvent(GameplayTag::AIEvent_State_Done, RememberedPerception);
                WaitOneTick();
                continue;
            }

            AI.TurnToCharacter(CharacterOfInterest);

            MaintainProximityFromIntruder();

            if (!bAnyDefeatedIntrudersLeft && !bNoLongerDefeatedWarningGiven)
            {
                bNoLongerDefeatedWarningGiven = true;
                AI.AssessEvent(GameplayTag::AIEvent_LastDefeatedIntruderGotUp, RememberedPerception);
                WaitOneTick();
                continue;
            }

            TryReactivateTrespassIfStillPresent();

            WaitOneTick();
        }
    }

    UFUNCTION(BlueprintOverride)
    void OnDestroy(bool bInOwnerFinished)
    {
        if (!bInOwnerFinished)
        {
            DisableStrafeMovementAndTurnToTargetMode();
        }

        Super::OnDestroy(bInOwnerFinished);
    }

    FString GetDisplayName() const override
    {
        return "Wait for defeated intruder to leave";
    }
}