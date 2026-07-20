UCLASS()
class UDrugDebuffEffectComponentBase : UEffectComponentActivatedByTagGASBase
{
    default bReplicates = true;

    UPROPERTY(Replicated)
	TArray<TSubclassOf<UDrugDebuffThreshold>> m_DrugDebuffThresholds;
    UPROPERTY(Replicated)
    UDrugDebuffThreshold m_CurrentThreshold;

    UPROPERTY(Replicated)
	TSubclassOf<UAngelscriptAttributeSet> m_AttributeSetClass;
	UPROPERTY(Replicated)
	FName m_AttributeName;

    UFUNCTION()
    void OnApplyThresholdEffect(UDrugDebuffThreshold NewThreshold)
    {
        m_CurrentThreshold = NewThreshold;
        if(m_EffectActor == nullptr)
        {
            return;
        }
        Cast<ADrugsDebuffEffectActor>(m_EffectActor).OnApplyThresholdEffect(GetCurrentDrugDebuffEffectLevel());
    }

    UFUNCTION(BlueprintCallable)
    int GetCurrentDrugDebuffEffectLevel()
    {
        if(m_DrugDebuffThresholds.IsEmpty())
        {
            return -1;
        }
        if(m_CurrentThreshold == nullptr)
        {
            return -1;
        }
        for(int i = 0; i < m_DrugDebuffThresholds.Num(); i++)
        {
            if(m_DrugDebuffThresholds[i].GetDefaultObject().m_DrugDebuffGEClass == m_CurrentThreshold.m_DrugDebuffGEClass)
                return i + 1;
        }
        return -1;
    }

    UFUNCTION(BlueprintCallable)
    int GetMaxLevel()
    {
        if(m_DrugDebuffThresholds.IsEmpty())
            return -1;
        return m_DrugDebuffThresholds.Num();
    }

    UFUNCTION()
    void ClearDebuffExecutionData()
    {
        m_DrugDebuffThresholds.Empty();
        m_CurrentThreshold = nullptr;
    }
    UFUNCTION(BlueprintCallable)
    float GetCurrentDrugValueNormalized()
    {
        if(m_DrugDebuffThresholds.IsEmpty())
            return 0;

        auto drugAttribute = UAngelscriptAttributeSet::GetGameplayAttribute(m_AttributeSetClass, m_AttributeName);
        bool successCurrentDrug;
        auto currentDrug = AbilitySystem::GetFloatAttributeFromAbilitySystemComponent(Cast<AGothicCharacter>(GetOwner()).GetAbilitySystemComponent(), drugAttribute, successCurrentDrug);
        auto lastThresholdSubclass = m_DrugDebuffThresholds.Last();
        auto lastThreshold = lastThresholdSubclass.GetDefaultObject();
        if(lastThreshold == nullptr)
            return 0;

        float currentDrugValueNormalized = currentDrug / lastThreshold.MaxValue;
        return currentDrugValueNormalized;
    }

}
