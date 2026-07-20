//UGE_Paralyzed The paralyze effect is applyed by UGE_ParalyzeVisual due its a shared effect by freeze, electric
class UGE_Unconscious: UGE_DebuffEffectVisual
{
	//Tags added to the character
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::State_Unconscious);

	//default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::State_NoInput_Character);
	//default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::State_BlockState);
	default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::State_Ignore_FreezeFrame);
    
}


class UGE_UnconsciousDebuffVisualEffect: UGE_Unconscious
{
	//Tags of the gameplay effect (This help to get the effect from the ability system)
	default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::Debuff_Visual_Unconscious);

	//Tags added to the character
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Debuff_Visual_Unconscious);
    
    // The effect wont be added if the character already has this tag
	default TargetTagRequirements.ApplicationTagRequirements.IgnoreTags.AddTag(GameplayTag::Debuff_Visual_Unconscious);
}


//Not used. Created only for constantness. The Unconscious effect is a secondary effect of the electrified and freeze damage.
class UGE_Unconscious_Cooldown: UScriptGameplayEffect
{
	//Tags of the gameplay effect (This help to get the effect from the ability system)
	default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::Debuff_Cooldown_Unconscious);

	default DurationPolicy = EGameplayEffectDurationType::HasDuration;
	default DurationMagnitude.ScalableFloatMagnitude.Value = 2; // Duration in seconds.

	default DurationMagnitude.MagnitudeCalculationType = EGameplayEffectMagnitudeCalculation::ScalableFloat;

	//Tags added to the character
	default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Debuff_Cooldown_Unconscious);

	// The effect wont be added if the character already has this tag
	default TargetTagRequirements.ApplicationTagRequirements.IgnoreTags.AddTag(GameplayTag::State_Invulnerable);
	default TargetTagRequirements.ApplicationTagRequirements.IgnoreTags.AddTag(GameplayTag::Debuff_Cooldown_Unconscious);

	default TagsToRemoveOther.AddTag(GameplayTag::Debuff_Unconscious);
    default RemoveOtherTags();
}
