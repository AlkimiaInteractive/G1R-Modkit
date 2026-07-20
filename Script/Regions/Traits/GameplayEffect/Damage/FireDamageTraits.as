UCLASS(meta=(DisplayName="Fire Damage Region Trait"))
class URegionTrait_FireDamage : URegionTrait_DamageBase
{
    default m_def = USleeperTempleFireDefinition::StaticClass();

    UPROPERTY(BlueprintReadWrite, EditAnywhere)
    bool m_DamageEnabled = true;

    FGameplayTag GetAttackType() override
    {
        return GameplayTag::Combat_HitType_Standard;
    }

    bool CanApplyEffect(UGothicAbilitySystemComponent sourceAbComp,
                        UGothicAbilitySystemComponent targetAbComp, AGothicCharacter character) override
    {
        if(!m_DamageEnabled)
            return false;
        return Super::CanApplyEffect(sourceAbComp, targetAbComp, character);
    }
}

UCLASS()
class USleeperTempleFireDefinition : UWeaponDefinition
{
	default m_Name = "SleeperTempleFire";
	default m_HitEffect = UGE_EnvironmentSleeperTempleFireDamage::StaticClass();
	default m_DamageBase.Add(GameplayTag::Item_Damage_Elemental_Fire, 10.00f);

	default m_SuperArmorDamageBase = 0.0f;
}


class UGE_EnvironmentSleeperTempleFireDamage : UGE_Damage_Fire_Infinite
{
	default Executions.Empty();
	default m_ElementalEffectStacks.Add(FElementalEffectStackData(UGE_FireStack::StaticClass(), true));
	//default m_ForceOverflowElementalEffectStack = true;
	//default m_ElementalEffectStack = UGE_FireStack::StaticClass();
	default Period.Value = 0.5f; 

	// Class that contains the damage formula and logic
	FGameplayEffectExecutionDefinition DefByPercentage;
	default DefByPercentage.CalculationClass = UGE_Ex_Damage_EnvironmentFireIgnoreResistancePercentage::StaticClass();

	default Executions.Add(DefByPercentage);
}


class UGE_Ex_Damage_EnvironmentFireIgnoreResistancePercentage : UGE_Ex_Damage
{

	bool GetIsGodModeForPlayer(const UCombatConfig& combatConfig,
							   UGothicAbilitySystemComponent targetAbComp, bool bIsImmortal) const override
	{
		return false;
	}
	
	float GetCalculatedDamage(UGothicAbilitySystemComponent SourceAbComp, UGothicAbilitySystemComponent TargetAbComp, TMapIterator<FGameplayTag, float32> Entry,
                              FGameplayEffectSpec Spec, UWeaponDefinition WeaponUsed) const override
    {
        auto weaponDefinitionByPercentage = Cast<USleeperTempleFireDefinition>(WeaponUsed);
        if(weaponDefinitionByPercentage == nullptr)
            return Entry.Value;
        
        bool success = false;
     
        FGameplayAttribute resistanceAttr = UAngelscriptAttributeSet::GetGameplayAttribute(UAttributeSet_Armor::StaticClass(), FName("Resistance_Fire"));
        float32 targetResistance = AbilitySystem::GetFloatAttributeFromAbilitySystemComponent(TargetAbComp, resistanceAttr, success);

        return Entry.Value + targetResistance;
       
        

    }

}