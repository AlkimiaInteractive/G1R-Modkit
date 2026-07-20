UCLASS()
class UCastSpellExecutionValidatorChargeByDuration : UCastSpellExecutionValidatorDefault
{
    UFUNCTION(BlueprintOverride)
    bool IsValid_Scriptable(USpellExecutionValidatorData ExecutionValidatorData) const
    {
        return Super::IsValid_Scriptable(ExecutionValidatorData);
    }
}