//@DE - Damage over time version.
class UGE_ElectrifiedArea_FocusStonePuzzle_Overtime : UScriptGameplayEffect
{
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Debuff_Montage_NoPlayMontage);

	default DurationPolicy = EGameplayEffectDurationType::Infinite;

	FConditionalGameplayEffect conditionalDamage;
	default conditionalDamage.EffectClass = UGE_ElectrifiedArea_WithoutParalysis_Damage_And_Interrupt::StaticClass(); 
	default AdditionalEffects.OnApplicationGameplayEffects.Add(conditionalDamage);

	default AdditionalEffects.OnCompleteAlways.Add(UGE_Damage_Electrified_Infinite_Area_Removal::StaticClass()); 
}

//@DE - This version is created for electrified areas by perfectage (Focus Stone Puzzle) that doesnt remove the effect with the altered state table
class UGE_Area_Electrified_Infinite_ByPercentage : UGE_Area_Electrified_Infinite
{
	default AdditionalEffects.OnApplicationGameplayEffects.Empty();
	default AdditionalEffects.OnCompleteAlways.Empty();

	default AdditionalEffects.OnApplicationGameplayEffects.Empty();

	FConditionalGameplayEffect conditionalAreaDamageByPercentage;
	default conditionalAreaDamageByPercentage.EffectClass = UGE_Damage_Area_Electrified_Infinite_ByPercentage::StaticClass(); 
	default AdditionalEffects.OnApplicationGameplayEffects.Add(conditionalAreaDamageByPercentage);

	default AdditionalEffects.OnCompleteAlways.Add(UGE_Damage_Area_Electrified_Infinite_Removal::StaticClass()); 
}

//@DE - This version is created for electrified areas by perfectage (Focus Stone Puzzle) that doesnt remove the effect with the altered state table
class UGE_Damage_Area_Electrified_Infinite_ByPercentage : UGE_Damage_Area_Electrified_Infinite
{
	default Executions.Empty();

	default DurationPolicy = EGameplayEffectDurationType::Infinite;
	default Period.Value = 0.5f;
	
	// Class that contains the damage formula and logic
	FGameplayEffectExecutionDefinition DefByPercentage;
	default DefByPercentage.CalculationClass = UGE_Ex_Damage_FocusStonePuzzle::StaticClass();

	default Executions.Add(DefByPercentage);
}


class UGE_ElectrifiedArea_WithoutParalysis_Damage_And_Interrupt : UGE_Area_Electrified_Infinite_ByPercentage
{
	default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::Environment_Debuff_Electrified_Area);
	//@DE - Remove electrified tags to avoid remove effect by knockback or other interaction.
	default AssetTagsComponent.InheritableAssetTags.RemoveTag(GameplayTag::Debuff_Electrified);
	default AssetTagsComponent.InheritableAssetTags.RemoveTag(GameplayTag::Debuff_Electrified_Damage_Infinite);
    
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Debuff_Electrified_Damage_Infinite_Area);
	default TargetTagRequirements.ApplicationTagRequirements.IgnoreTags.AddTag(GameplayTag::Debuff_Electrified_Damage_Infinite_Area);

	default DurationMagnitude.ScalableFloatMagnitude.Value = 0.f; // Duration in seconds of the effect ( 0 = infinite )
	default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Debuff_Electrified_WithoutParalysis);	
}
//@DE - Damage over time version. END

//Removal infinite electrified gameplay effect.
class UGE_Damage_Electrified_Infinite_Area_Removal : UScriptGameplayEffect
{
	default DurationPolicy = EGameplayEffectDurationType::Instant;
	default TagsToRemoveOther.AddTag(GameplayTag::Environment_Debuff_Electrified_Area);
	default RemoveOtherTags();
}



//@DE - Damage impact version.

class UGE_ElectrifiedArea_FocusStonePuzzle_Impact_Damage : UGE_Damage_Electrified
{
	default m_ElementalEffectStacks.Add(FElementalEffectStackData(UGE_Electrified_Impact_Paralyze_FocusStonePuzzle::StaticClass()));
	//default m_ElementalEffectStack = UGE_Electrified_Impact_Paralyze_FocusStonePuzzle::StaticClass();
	default Executions.Empty();	
	// Class that contains the damage formula and logic
	FGameplayEffectExecutionDefinition DefByPercentage;
	default DefByPercentage.CalculationClass = UGE_Ex_Damage_FocusStonePuzzle::StaticClass();

	default Executions.Add(DefByPercentage);
}

UCLASS()
class UGE_Electrified_Impact_Paralyze_FocusStonePuzzle: UGE_Electrified_Impact_Paralyze
{
	default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::Environment_Debuff_Electrified_Area);
	//@DE - Max time of electrocution. This will be removed when the focus stone is deactivated by anim.
	default DurationMagnitude.ScalableFloatMagnitude.Value = 15.0f; 
}



//@DE - Damage impact version. END