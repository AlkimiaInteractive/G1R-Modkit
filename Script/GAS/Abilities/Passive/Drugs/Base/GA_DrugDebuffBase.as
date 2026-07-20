class UGA_DrugDebuffBase : UGameplayAbilityDrugDebuff
{
    UPROPERTY()
    UDrugDebuffEffectComponentBase m_DrugDebuffComp = nullptr;


    UFUNCTION(BlueprintOverride)
    void OnEndAbility_Scriptable(FGameplayAbilityActorInfo GameplayAbilityActorInfo, bool WasCancelled)
    {
        auto drugDebuffComp = GetDrugDebuffComp();
        if(m_DrugDebuffComp == nullptr)
            return;
        m_DrugDebuffComp.ClearDebuffExecutionData();
    }

    UDrugDebuffEffectComponentBase GetDrugDebuffComp()
    {
        return m_DrugDebuffComp;
    }

    UFUNCTION(BlueprintOverride)
    void OnAttributeIncreased_Scriptable()
    {
        
    }
}