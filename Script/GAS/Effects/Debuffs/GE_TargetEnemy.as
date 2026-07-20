class UGE_TargetEnemy : UScriptGameplayEffect
{
	default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::GameplayCue_State_Targeted);

	default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::GameplayCue_State_Targeted);
	default DurationPolicy = EGameplayEffectDurationType::Infinite;

	default StackingType = EGameplayEffectStackingType::AggregateByTarget;
	//@DE - This gameplay cue is deprecated (2023) and only was used for debug purposes 
	// FGameplayEffectCue cue;
	// default cue.GameplayCueTags.AddTag(GameplayTag::GameplayCue_State_Targeted);
	// default GameplayCues.Add(cue);
}

class UGE_TargetEnemySpell : UGE_TargetEnemy
{
}