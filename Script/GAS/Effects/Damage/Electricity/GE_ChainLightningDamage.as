class UGE_ChainLightning_WithParalysis_Damage : UGE_Electrified_Paralyze_Infinite//UGE_Damage_Paralyzed
{

	default DurationMagnitude.ScalableFloatMagnitude.Value = 0.f; // Duration in seconds of the effect ( 0 = infinite )

    default TargetTagRequirements.ApplicationTagRequirements.IgnoreTags.AddTag(GameplayTag::State_LaunchingSpell_ChainLightning);

	//Tags added to the character
	default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::State_ReceivingSpell_ChainLightning);

	default TagsToRemoveOther.RemoveTag(GameplayTag::State_Controlling);
    default RemoveOtherTags();

}

class UGE_ChainLightning_WithoutParalysis_Damage_And_Interrupt : UGE_Electrified_Infinite
{
	default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::Debuff_Electrified_Damage_Infinite_Caster);

	default DurationMagnitude.ScalableFloatMagnitude.Value = 0.f; // Duration in seconds of the effect ( 0 = infinite )

	//Tags added to the character 
	default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::State_ReceivingSpell_ChainLightning);
	default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Debuff_Electrified_Damage_Infinite_Caster);

	default TargetTagRequirements.ApplicationTagRequirements.IgnoreTags.AddTag(GameplayTag::Debuff_Electrified_Damage_Infinite_Caster);

}

class UGE_ChainLightning_WithoutParalysis_Damage : UGE_ChainLightning_WithoutParalysis_Damage_And_Interrupt
{
	default DurationMagnitude.ScalableFloatMagnitude.Value = 0.f; // Duration in seconds of the effect ( 0 = infinite )
	default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Debuff_Electrified_WithoutParalysis);
	default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Debuff_Montage_NoPlayMontage);
	//Remove interruption on caster effect
	default GameplayCues.Empty();
}

