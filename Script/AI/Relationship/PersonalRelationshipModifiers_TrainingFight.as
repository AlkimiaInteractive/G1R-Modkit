class UActivePersonalRelationshipModifier_Enemy_Training : UActivePersonalRelationshipModifier_Enemy
{
    UActivePersonalRelationshipModifier_Enemy_Training(AGothicCharacterState Other)
    {
        TargetCharacter = Other;
    }

    default Weight = 16000.0f;
    default HostilityTowardsOther = ERelationshipHostility::TrainingFight;

    default bCanTick = true;
    UFUNCTION(BlueprintOverride, meta=(NoSuperCall))
    void Tick(float DeltaTime)
    {
        auto AI = Owner.CharacterAI;
        if (!IsValid(AI))
        {
            Discard();
            return;
        }

        if (AI.HasPendingScheduledState())
            return;

        if (!AI.CharacterState.IsInTrainingFight())
        {
            Discard();
            return;
        }

        if (Owner.HasGameplayTag(GameplayTag::AIState_DailyRoutine))
        {
            AI.CharacterState.LeaveTrainingFight();
            Discard();
            return;
        }        
    }
}