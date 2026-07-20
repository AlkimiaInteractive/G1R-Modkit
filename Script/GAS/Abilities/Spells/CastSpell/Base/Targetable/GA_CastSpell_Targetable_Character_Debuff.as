class UGA_CastSpell_Targetable_Character_Debuff : UGA_CastSpell_Targetable_Character
{
    default m_ExecutionValidator = UCastSpellExecutionValidatorTargetableCharacterDebuff::StaticClass();
   
    UPROPERTY()
    FGameplayTag m_DebuffTag = FGameplayTag();

    void InitializeValidatorData(USpellExecutionValidatorDataDefault Data, AActor SourceActor,
                                 AActor TargetActor) const override
    {
        Super::InitializeValidatorData(Data, SourceActor, TargetActor);
        USpellExecutionValidatorDataTargetableDebuff data = Cast<USpellExecutionValidatorDataTargetableDebuff>(Data);
        data.DebuffTag = m_DebuffTag;
    }
}