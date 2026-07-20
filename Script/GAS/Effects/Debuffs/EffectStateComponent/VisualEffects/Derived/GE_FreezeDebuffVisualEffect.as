class UGE_FreezeDebuffVisualEffect: UGE_DebuffEffectVisual
{
	//Tags of the gameplay effect (This help to get the effect from the ability system)
	default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::Debuff_Visual_Freeze);
	//default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::Debuff_Paralyzed);

	//Tags added to the character
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Debuff_Visual_Freeze);
	//default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Debuff_Paralyzed);
    
    // The effect wont be added if the character already has this tag
	default TargetTagRequirements.ApplicationTagRequirements.IgnoreTags.AddTag(GameplayTag::Debuff_Visual_Freeze);
}
