UCLASS()
class UElectrifiedArena_GornSleeper : USpellProjectileDefinition
{
	default m_Name = "ElectrifiedArena_GornSleeper";

	default m_HitEffect = UGE_ElectrifiedArea_GornSleeper::StaticClass();
	default m_DamageBase.Add(GameplayTag::Item_Damage_Elemental_Energy, 20.00f);

	default m_SuperArmorDamageBase = .0f;

	FVector m_BoxExtend = FVector(500, 500, 20);
}

class UGE_ElectrifiedArea_GornSleeper : UScriptGameplayEffect
{
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Debuff_Montage_NoPlayMontage);

	default DurationPolicy = EGameplayEffectDurationType::Infinite;

	default BlockAbilityTagsComponent.InheritableBlockedAbilityTagsContainer.AddTag(GameplayTag::Ability_Effect_Debuff_Electrified);

	FConditionalGameplayEffect conditionalDamage;
	default conditionalDamage.EffectClass = UGE_ElectrifiedArea_GornSleeper_WithoutParalysis_Damage_And_Interrupt::StaticClass(); 
	default AdditionalEffects.OnApplicationGameplayEffects.Add(conditionalDamage);

	default AdditionalEffects.OnCompleteAlways.Add(UGE_Damage_Electrified_Infinite_Area_GornSleeper_Removal::StaticClass()); 

	default StackLimitCount = 4;
	default StackingType = EGameplayEffectStackingType::AggregateBySource;
}

class UGE_ElectrifiedArea_GornSleeper_WithoutParalysis_Damage_And_Interrupt : UGE_Area_Electrified_Infinite
{
	default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::Environment_Debuff_Electrified_Area);
	//@DE - Remove electrified tags to avoid remove effect by knockback or other interaction.
	default AssetTagsComponent.InheritableAssetTags.RemoveTag(GameplayTag::Debuff_Electrified);
	default AssetTagsComponent.InheritableAssetTags.RemoveTag(GameplayTag::Debuff_Electrified_Damage_Infinite);
    
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Debuff_Electrified_Damage_Infinite_Area);
	//default TargetTagRequirements.ApplicationTagRequirements.IgnoreTags.AddTag(GameplayTag::Debuff_Electrified_Damage_Infinite_Area);

	default DurationMagnitude.ScalableFloatMagnitude.Value = 0.f; // Duration in seconds of the effect ( 0 = infinite )
	default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Debuff_Electrified_WithoutParalysis);

	default AdditionalEffects.OnApplicationGameplayEffects.Empty();

	FConditionalGameplayEffect conditionalGornSleeperAreaDamage;
	default conditionalGornSleeperAreaDamage.EffectClass = UGE_Damage_Area_Electrified_Infinite_GornSleeper::StaticClass(); 
	default AdditionalEffects.OnApplicationGameplayEffects.Add(conditionalGornSleeperAreaDamage);

	default StackLimitCount = 4;
	default StackingType = EGameplayEffectStackingType::AggregateBySource;
	
}

class UGE_Damage_Area_Electrified_Infinite_GornSleeper : UGE_Damage_Area_Electrified_Infinite
{
	default Executions.Empty();	
	// Class that contains the damage formula and logic
	FGameplayEffectExecutionDefinition DamageWithoutResistance;
	default DamageWithoutResistance.CalculationClass = UGE_Ex_Damage_GornSleeper_ElectrifiedArea::StaticClass();

	default Executions.Add(DamageWithoutResistance);
}


class UGE_Ex_Damage_GornSleeper_ElectrifiedArea : UGE_Ex_Damage
{
    //@DE - Always do damage.
    bool GetIsGodModeForPlayer(const UCombatConfig& combatConfig,
                               UGothicAbilitySystemComponent targetAbComp, bool bIsImmortal) const override
    {
        return false;
    }

    //@DE - Custom calculation class for Gorn Sleeper electrified zone
    //Deals damage over the resistance
    float GetCalculatedDamage(UGothicAbilitySystemComponent SourceAbComp, UGothicAbilitySystemComponent TargetAbComp, TMapIterator<FGameplayTag, float32> Entry,
                              FGameplayEffectSpec Spec, UWeaponDefinition WeaponUsed) const override
    {
        auto weaponDefinitionByPercentage = Cast<UElectrifiedArena_GornSleeper>(WeaponUsed);
        if(weaponDefinitionByPercentage == nullptr)
            return Entry.Value;
        
        bool success = false;
     
        FGameplayAttribute resistanceAttr = UAngelscriptAttributeSet::GetGameplayAttribute(UAttributeSet_Armor::StaticClass(), FName("Resistance_Energy"));
        float32 targetResistance = AbilitySystem::GetFloatAttributeFromAbilitySystemComponent(TargetAbComp, resistanceAttr, success);
		if(targetResistance >= Entry.Value)
        	return Entry.Value + targetResistance;
		return Entry.Value;
       
    }

}


//Removal infinite electrified gameplay effect.
class UGE_Damage_Electrified_Infinite_Area_GornSleeper_Removal : UScriptGameplayEffect
{
	default DurationPolicy = EGameplayEffectDurationType::Instant;
	default TagsToRemoveOther.AddTag(GameplayTag::Environment_Debuff_Electrified_Area);
	default RemoveOtherTags();
}