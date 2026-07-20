UCLASS()
class UGothicMountComponentAS : UGothicMountComponent
{
    UPROPERTY()
    TSubclassOf<UScriptGameplayEffect> GE_RestoreHealth = UGE_RestoreMaxHealth::StaticClass();

    UPROPERTY()
    TArray<TSubclassOf<UGameplayEffect>> m_GameplayEffectAllowedClasses;
    default m_GameplayEffectAllowedClasses.Add(UGE_Damage::StaticClass());
    default m_GameplayEffectAllowedClasses.Add(UGE_ElementalDebuffBase::StaticClass());
    default m_GameplayEffectAllowedClasses.Add(UGE_WaterVolume::StaticClass());
    default m_GameplayEffectAllowedClasses.Add(UGE_WaterMovement::StaticClass());
    default m_GameplayEffectAllowedClasses.Add(UGE_Item_Alcohol_Insta::StaticClass());
    default m_GameplayEffectAllowedClasses.Add(UGE_Item_Swampweed_Insta::StaticClass());

    default m_AlcoholEffect = UGE_Item_Alcohol_Insta::StaticClass();
    default m_SwampWeedEffect = UGE_Item_Swampweed_Insta::StaticClass();

    UPROPERTY()
    TArray<TSubclassOf<UGameplayEffect>> m_GameplayEffectAllowedWithoutRider;
    default m_GameplayEffectAllowedWithoutRider.Add(UGE_EnvironmentLavaDamage::StaticClass());
    default m_GameplayEffectAllowedWithoutRider.Add(UGE_CampFireEnvironmentDamage::StaticClass());

    default m_EnvironmentalGEToForceRemoveOnUnmount.Append(m_GameplayEffectAllowedWithoutRider);


    UFUNCTION(BlueprintOverride)
    void BeginPlay()
    {
        auto abComp = Cast<AGothicCharacter>(GetOwner()).GetAbilitySystemComponent();
        abComp.ApplyGameplayEffectToSelf(GE_RestoreHealth, 0, abComp.MakeEffectContext());
    }

    UFUNCTION(BlueprintOverride)
    bool ValidGEClassToTarget(AGothicCharacter TargetCharacter, const UGameplayEffect GameplayEffect)
    {
        TArray<TSubclassOf<UGameplayEffect>> geClasses = m_GameplayEffectAllowedClasses;
        for(auto elementalClass : geClasses)
        {
            if(GameplayEffect.IsA(elementalClass))
                return true;
        }
        return false;
        //return GameplayEffect.IsA(UGE_Damage::StaticClass()) || GameplayEffect.IsA(UGE_WaterVolume::StaticClass()) || GameplayEffect.IsA(UGE_WaterMovement::StaticClass());
    }

    UFUNCTION(BlueprintOverride)
    bool CanBeTransferedToRiderWhenMount(const UGameplayEffect GameplayEffect)
    {
        TArray<TSubclassOf<UGameplayEffect>> geClasses = m_GameplayEffectAllowedWithoutRider;
        for(auto damageClass : geClasses)
        {
            if(GameplayEffect.IsA(damageClass))
                return true;
        }
        return false;
    }
}

class UGE_RestoreMaxHealth : UScriptGameplayEffect
{
	default DurationPolicy = EGameplayEffectDurationType::Infinite;
    default Period.Value = 30.f;
	
	FGameplayModifierInfo modifier;
	default modifier.ModifierMagnitude.MagnitudeCalculationType = EGameplayEffectMagnitudeCalculation::AttributeBased;
	default modifier.ModifierMagnitude.AttributeBasedMagnitude.BackingAttribute.AttributeToCapture = GetAttribute(UAttributeSet_Health::StaticClass(), n"MaxHealth");
	default modifier.ModifierOp = EGameplayModOp::Override;
	default modifier.Attribute = GetAttribute(UAttributeSet_Health::StaticClass(), n"Health");
	default Modifiers.Add(modifier);

}