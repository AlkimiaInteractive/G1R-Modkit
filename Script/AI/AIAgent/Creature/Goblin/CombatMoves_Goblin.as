UCLASS()
class UCM_GoblinSpecialAttack_StoneThrow : UCM_Attack_Top
{
    default CancelIfCharacterGainsAnyOf.AddTag(GameplayTag::State_Goblin_BindedToTroll);

    default bSendInterruptToCancelAttack = true;
    bool ConditionsToContinueAttack() const override
    {
        if (!IsValid(Combat.CharacterOfInterest) || Combat.DistanceToCharacterOfInterest < 150.0f)
            return false;

        return Super::ConditionsToContinueAttack();
    }
}