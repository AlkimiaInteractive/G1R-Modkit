/**
 * Observe-Creeping state (suspicion phase before a Creeping warning).
 */
UCLASS()
class UAIState_Observe_Creeping : UAIState_PerceptionResponse
{
    default OwnedGameplayTags.AddTag(GameplayTag::AIState_Observe_Creeping);
    default AIStateTag = GameplayTag::AIState_Observe_Creeping;
    default SwitchAIStateMode = ESwitchAIStateMode::Interrupt;
    default EndInteractionMode = ESwitchAIStateEndInteractionMode::EndAnyOngoingInteraction_Quick;

    UPROPERTY()
    AGothicCharacterState CriminalCharacterState;

    UPROPERTY()
    UCrimeTuningConfig_Creeping Tuning;

    UPROPERTY()
    FInGameTime LastInterjectionAt;

    UPROPERTY()
    FInGameTime InSightSinceAt;

    UPROPERTY()
    bool bWasVisibleLastTick = true;

    UPROPERTY()
    FInGameTime TimeLoSFirstLost;

    UPROPERTY()
    bool bHasExitedObserve = false;

    UPROPERTY()
    FInGameTime LastTurnReissuedAt;

    FString GetDisplayName() const override
    {
        return "Observe Creeping";
    }

    UCrimeTuningConfig_Creeping ResolveTuning() const
    {
        if (!IsValid(AI) || !IsValid(AI.CrimeProcessingSubsystem))
            return nullptr;
        return AI.CrimeProcessingSubsystem.CreepingTuning;
    }

    bool IsCriminalCrouching() const
    {
        if (!IsValid(CriminalCharacterState))
            return false;
        return CriminalCharacterState.HasGameplayTag(GameplayTag::State_Movement_Crouching);
    }

    bool IsCriminalAlive() const
    {
        if (!IsValid(CriminalCharacterState) || !IsValid(CriminalCharacterState.Character))
            return false;
        return !CriminalCharacterState.IsDead() && !CriminalCharacterState.IsDefeated();
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

    bool ShouldTurnTowardsCriminal() const
    {
        if (!IsValid(Tuning))
            return GetForwardDotTowardsCriminal() < 0.6f;
        return GetForwardDotTowardsCriminal() < Tuning.SkipTurnTowardsCriminalForwardDot;
    }

    void TryThrowInterjection()
    {
        if (!IsValid(AI) || !IsValid(AI.CharacterState) || !IsValid(CriminalCharacterState))
            return;
        if (!IsValid(Tuning) || Tuning.InterjectionCooldownSeconds <= 0.0f)
            return;
        if (LastInterjectionAt.TotalSeconds > 0.0f &&
            LastInterjectionAt.AgeInRealtimeSeconds < Tuning.InterjectionCooldownSeconds)
            return;
        if (AI.CharacterState.IsSpeaking())
            return;
        AI.Say(GameplayTag::Sound_Voice_Reaction_Interjection_Suspect, TargetCharacter = CharacterOfInterest);
        LastInterjectionAt = FInGameTime::Now();
    }

    void ExitObservePeacefully()
    {
        if (bHasExitedObserve)
            return;
        bHasExitedObserve = true;
        DisableStrafeMovementAndTurnToTargetMode();

        // Stamp re-creep grace so a quick re-attempt routes straight to warning.
        if (IsValid(AI))
            CreepingContext::StampPeacefulResolution(AI);

        AI.UpdateCrimeSeverityTowardsPlayer();
        AI.SwitchToDailyRoutine();
    }

    void EmitEscalateToWarning()
    {
        if (bHasExitedObserve)
            return;
        if (!IsValid(AI) || !IsValid(CriminalCharacterState))
        {
            ExitObservePeacefully();
            return;
        }

        bHasExitedObserve = true;
        DisableStrafeMovementAndTurnToTargetMode();

        FRememberedPerception Perception;
        Perception.Instigator.CharacterState = CriminalCharacterState;
        Perception.Instigator.Character = CriminalCharacterState.Character;
        // ContextTags carry Crime_Creeping so EventIsForCrime predicates resolve.
        Perception.ContextTags.AddTag(GameplayTag::Crime_Creeping);
        AI.AssessEvent(GameplayTag::AIEvent_Crime_Creeping_EscalateToWarning, Perception);
    }

    UFUNCTION(BlueprintOverride)
    void DoTask() final
    {
        Super::DoTask();

        Tuning = ResolveTuning();
        CriminalCharacterState = RememberedPerception.Origin.CharacterState;
        if (!IsValid(CriminalCharacterState))
            CriminalCharacterState = RememberedPerception.Instigator.CharacterState;
        if (!IsValid(CriminalCharacterState))
        {
            ExitObservePeacefully();
            return;
        }

        EnableStrafeMovementAndTurnToTargetMode();
        // Force-target in case PerceptionResponse base skipped it at entry.
        if (IsValid(CharacterOfInterest))
            AI.TargetCharacterOfInterest(FocusPriority, this);

        InSightSinceAt = FInGameTime::Now();
        bWasVisibleLastTick = true;

        // Entry-time face turn; re-armed in the loop as the criminal moves.
        if (IsValid(CharacterOfInterest) && ShouldTurnTowardsCriminal())
        {
            AI.TurnToCharacter(CharacterOfInterest);
            LastTurnReissuedAt = FInGameTime::Now();
        }

        while (!bShouldExitState && !bHasExitedObserve)
        {
            if (!IsValid(CharacterOfInterest) || !IsValid(CriminalCharacterState))
            {
                ExitObservePeacefully();
                return;
            }

            if (!IsCriminalAlive())
            {
                ExitObservePeacefully();
                return;
            }

            if (!IsCriminalCrouching())
            {
                ExitObservePeacefully();
                return;
            }

            float DistToCriminal = Self.GetFeetLocation().Distance(CharacterOfInterest.GetFeetLocation());
            float PeacefulEndDistance = IsValid(Tuning) ? Tuning.PeacefulEndDistance : 1200.0f;
            if (DistToCriminal >= PeacefulEndDistance)
            {
                ExitObservePeacefully();
                return;
            }

            bool bVisibleNow = AI.Character.Perception.CanSee(CharacterOfInterest);
            if (bWasVisibleLastTick && !bVisibleNow)
                TimeLoSFirstLost = FInGameTime::Now();
            bWasVisibleLastTick = bVisibleNow;

            float LoSGrace = IsValid(Tuning) ? Tuning.PeacefulEndLoSGraceSeconds : 1.5f;
            if (!bVisibleNow && TimeLoSFirstLost.TotalSeconds > 0.0f &&
                TimeLoSFirstLost.AgeInRealtimeSeconds >= LoSGrace)
            {
                ExitObservePeacefully();
                return;
            }

            // Reset in-sight clock while LoS lost.
            if (!bVisibleNow)
                InSightSinceAt = FInGameTime::Now();

            const float TurnReissueCooldown = 0.5f;
            if (bVisibleNow
                && IsValid(CharacterOfInterest)
                && ShouldTurnTowardsCriminal()
                && (LastTurnReissuedAt.TotalSeconds <= 0.0f
                    || LastTurnReissuedAt.AgeInRealtimeSeconds >= TurnReissueCooldown))
            {
                AI.TurnToCharacter(CharacterOfInterest);
                LastTurnReissuedAt = FInGameTime::Now();
            }

            TryThrowInterjection();

            // Enforcer-only escalation.
            if (IsValid(Tuning) && Tuning.bEscalates && bVisibleNow)
            {
                if (InSightSinceAt.AgeInRealtimeSeconds >= Tuning.ObserveSecondsBeforeWarning)
                {
                    EmitEscalateToWarning();
                    return;
                }
            }

            WaitOneTick();
        }
    }

    UFUNCTION(BlueprintOverride)
    void OnDestroy(bool bInOwnerFinished)
    {
        DisableStrafeMovementAndTurnToTargetMode();
    }
}

UCLASS()
class UAIState_Observe_Creeping_Human : UAIState_Observe_Creeping
{
}

UCLASS()
class UAIState_Observe_Creeping_Orc : UAIState_Observe_Creeping
{
}
