UCLASS()
class UAIState_WatchHostile : UAIState_Conflict
{
    default OwnedGameplayTags.AddTag(GameplayTag::AIState_Conflict_WatchHostile);
    default AIStateTag = GameplayTag::AIState_Conflict_WatchHostile;
    default SwitchAIStateMode = ESwitchAIStateMode::Interrupt;
    default EndInteractionMode = ESwitchAIStateEndInteractionMode::None;

    // default AssessmentModuleClass = UAIARM_State_WatchFight;

    default IsTickingTask = true;

    UFUNCTION(BlueprintOverride)
    void DoTask()
    {
        FInGameTime MaxDelayForInteraction = FInGameTime::XRealtimeSecondsFromNow(0.65f);
        Super::DoTask();
        
        if (!MaxDelayForInteraction.IsTimeInThePast() && !AI.Character.HasDrawnWeapon() && !Context.HasTag(GameplayTag::AIStateContext_NoStartInteraction))
        {
            DoWantNoFightInteraction();
        }

        if (!Self.IsSitting() && IsValid(CharacterOfInterest))
        {
            AI.UndrawWeapon();

            EnableStrafeMovementAndTurnToTargetMode();
            AI.TurnToCharacter(CharacterOfInterest);
        }

        AGothicCharacter Hostile = RememberedPerception.Origin.Character;

        if (IsValid(Hostile))
        {
            AI.TargetCharacter(Hostile, FocusPriority, this);
        }
        
        while (AI.GetSensedLivingHostiles().Num() > 0)
        {
            if (Self.IsSitting())
            {
                WaitOneTick();
                continue;
            }

            if (Self.GetDistanceTo(Hostile) < 200.0f)
            {
                auto Direction = (Self.FeetLocation - Hostile.FeetLocation).GetSafeNormal();

                AI.GoIntoDirection(Direction, 160.0f);
            }
            
            WaitOneTick();
        }

        AI.AssessHostilesAndEnemiesAround(RememberedPerception);
    }

    UFUNCTION(BlueprintOverride)
    void OnDestroy(bool bInOwnerFinished)
    {
        Super::OnDestroy(bInOwnerFinished);

        if (!IsValid(AI))
            return;

        DisableStrafeMovementAndTurnToTargetMode();
    }

    FString GetDisplayName() const override
    {
        return "Watch Hostile State";
    }

    UAbilityTask_InteractWith CreateWantNoFightInteractTask()
    {
        return TaskInteractHereWithoutSpot(AI, GameplayTag::Action_Ambient_WantNoFight, -1.0f);
    }

    void DoWantNoFightInteraction()
    {
        AI.WantNoFightHere();
    }
}