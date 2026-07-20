class UGE_Slowdown : UScriptGameplayEffect
{
	//Tags of the gameplay effect (This help to get the effect from the ability system)
	default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::Debuff_Slowdown);

	default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Debuff_Slowdown);
	//default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Debuff_Component_Slowdown);

	default TargetTagRequirements.ApplicationTagRequirements.IgnoreTags.AddTag(GameplayTag::State_Invulnerable);
	default TargetTagRequirements.ApplicationTagRequirements.IgnoreTags.AddTag(GameplayTag::Debuff_Slowdown);

	default DurationPolicy = EGameplayEffectDurationType::HasDuration;
	default DurationMagnitude.ScalableFloatMagnitude.Value = 0.0f; // Duration in seconds of the effect ( 0 = infinite )
	default DurationMagnitude.MagnitudeCalculationType = EGameplayEffectMagnitudeCalculation::ScalableFloat;

}