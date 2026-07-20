class UGE_Summoned_Skeletons_Unhilqt : UScriptGameplayEffect
{
	default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::State_Summoned);
	
	default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::GE_Persistent);

    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::State_Summoned);

	default DurationPolicy = EGameplayEffectDurationType::Infinite;

	// FGameplayEffectCue cue;
	// default cue.GameplayCueTags.AddTag(GameplayTag::GameplayCue_State_Summoned);
	// default GameplayCues.Add(cue);
}