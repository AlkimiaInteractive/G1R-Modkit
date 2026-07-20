class UGE_Wind_Damage : UGE_Damage
{
	
	//default m_ElementalEffectStack = UGE_Wind::StaticClass();

	default m_ElementalEffectStacks.Add(FElementalEffectStackData(UGE_Wind::StaticClass()));
	// FConditionalGameplayEffect condEffect;
	// default condEffect.EffectClass = UGE_Wind::StaticClass();
	// //Add the Wind effect to Damage GameplayEffectExecutionDefinition (UGE_Ex_Damage) 
	// //So if the UGE_Ex_Damage is executed, we also exeute the UGE_Wind effect

	// default Executions[0].ConditionalGameplayEffects.Add(condEffect);
}

class UGE_Wind : UScriptGameplayEffect
{
	//Tags of the gameplay effect (This help to get the effect from the ability system)
	default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::Debuff_Wind);

	//Tags added to the character
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Debuff_Wind);
	
	// The effect wont be added if the character already has this tag
	default TargetTagRequirements.ApplicationTagRequirements.IgnoreTags.AddTag(GameplayTag::State_Defeated);
	default TargetTagRequirements.ApplicationTagRequirements.IgnoreTags.AddTag(GameplayTag::State_Dead);
	default TargetTagRequirements.ApplicationTagRequirements.IgnoreTags.AddTag(GameplayTag::State_Invulnerable);
	default TargetTagRequirements.ApplicationTagRequirements.IgnoreTags.AddTag(GameplayTag::Debuff_Wind);

	default DurationPolicy = EGameplayEffectDurationType::HasDuration;
	default DurationMagnitude.MagnitudeCalculationType = EGameplayEffectMagnitudeCalculation::ScalableFloat;
	default DurationMagnitude.ScalableFloatMagnitude.Value = 5; //Duration in seconds of the effect

	default TagsToRemoveOther.AddTag(GameplayTag::Debuff_Stack_Fire);
	default TagsToRemoveOther.AddTag(GameplayTag::Debuff_Burn);
	default TagsToRemoveOther.AddTag(GameplayTag::Debuff_Freeze);
	default TagsToRemoveOther.AddTag(GameplayTag::Debuff_Stack_Ice);
	default TagsToRemoveOther.AddTag(GameplayTag::Debuff_Electrified);
	default TagsToRemoveOther.AddTag(GameplayTag::Debuff_Sleep);
	default TagsToRemoveOther.AddTag(GameplayTag::State_Controlling);
	default TagsToRemoveOther.AddTag(GameplayTag::Debuff_Stack_Freeze_Hits);
    default RemoveOtherTags();
}