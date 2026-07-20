class UActivePersonalRelationshipModifier_UseFists : UActivePersonalRelationshipModifier_SingleCharacter
{
    default bCanTick = true;
    default Weight = 20.0f;

    default OwnedTagsWhileActive.AddTag(GameplayTag::State_FightWithFists);

    UActivePersonalRelationshipModifier_UseFists(AGothicCharacterState Other)
    {
        TargetCharacter = Other;
    }

    UFUNCTION(BlueprintOverride)
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

        auto State = Cast<UAIState_Conflict>(AI.CurrentState);
        if (!IsValid(State) && !Owner.HasGameplayTag(GameplayTag::AIState_Conflict))
        {
            Discard();
            return;
        }
    }
}