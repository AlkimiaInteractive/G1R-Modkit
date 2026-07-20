UCLASS()
class UCM_OrcSpecialAttack_StoneThrow : UCM_Attack_Extra06
{
    default bSendInterruptToCancelAttack = true;
    bool ConditionsToContinueAttack() const override
    {
        if (!IsValid(Combat.CharacterOfInterest) || Combat.DistanceToCharacterOfInterest < 150.0f)
            return false;

        return Super::ConditionsToContinueAttack();
    }
}