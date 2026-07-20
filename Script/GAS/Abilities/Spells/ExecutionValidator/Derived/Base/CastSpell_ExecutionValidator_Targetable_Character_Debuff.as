UCLASS()
class UCastSpellExecutionValidatorTargetableCharacterDebuff : UCastSpellExecutionValidatorTargetableCharacter
{
    default m_ExecutionValidatorData = USpellExecutionValidatorDataTargetableDebuff::StaticClass();

    UPROPERTY()
    FGameplayTag RequiredTag = FGameplayTag();

    UPROPERTY()
    FGameplayTag BlockedTag = FGameplayTag();

    bool IsDataInValidState(USpellExecutionValidatorData ExecutionValidatorData) const override
    {
        if(!Super::IsDataInValidState(ExecutionValidatorData))
            return false;

        auto castExecData = Cast<USpellExecutionValidatorDataTargetableDebuff>(ExecutionValidatorData);
        auto debuffTag = castExecData.DebuffTag;

        if(debuffTag != RequiredTag)
        {
            FString text = FString("debuffTag != RequiredTag -> ");
            text.Append(debuffTag.ToString()).Append(FString(" != ")).Append(RequiredTag.ToString());
            PrintDebugOnScreen(FName(text), 10.f, FColor::Red);
            return false;
        }
        return true;
    }
}