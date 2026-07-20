class UGE_CharacterNoPersistent : UScriptGameplayEffect
{

	default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::GE_Persistent);
	default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Character_NoPersistent);

	default DurationPolicy = EGameplayEffectDurationType::Infinite;
}
