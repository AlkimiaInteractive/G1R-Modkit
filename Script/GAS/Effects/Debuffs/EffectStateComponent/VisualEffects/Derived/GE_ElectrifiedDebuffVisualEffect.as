class UGE_ElectrifiedDebuffVisualEffect: UGE_DebuffEffectVisual
{
	//Tags of the gameplay effect (This help to get the effect from the ability system)
	default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::Debuff_Visual_Electrified);

	//Tags added to the character
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Debuff_Visual_Electrified);
    
    // The effect wont be added if the character already has this tag
	default TargetTagRequirements.ApplicationTagRequirements.IgnoreTags.AddTag(GameplayTag::Debuff_Visual_Electrified);
}
