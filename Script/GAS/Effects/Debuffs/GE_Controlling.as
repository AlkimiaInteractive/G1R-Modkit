// This effect must be applied to the control spell caster
class UGE_Controlling : UScriptGameplayEffect
{
	//Tags of the gameplay effect (This help to get the effect from the ability system)
	default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::State_Controlling);
	default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::Debuff_Unconscious);

	//Tags added to the character
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::State_Controlling);
	default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Debuff_Unconscious);
	default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::State_Ignore_TraceTarget);
	//default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::State_NoInput_Character);

	default TargetTagRequirements.ApplicationTagRequirements.IgnoreTags.AddTag(GameplayTag::State_Invulnerable);
	default TargetTagRequirements.ApplicationTagRequirements.IgnoreTags.AddTag(GameplayTag::State_Controlling);
	default TargetTagRequirements.ApplicationTagRequirements.IgnoreTags.AddTag(GameplayTag::State_Defeated);
	default TargetTagRequirements.ApplicationTagRequirements.IgnoreTags.AddTag(GameplayTag::State_Dead);

	default DurationPolicy = EGameplayEffectDurationType::Infinite;


	//default DurationPolicy = EGameplayEffectDurationType::HasDuration;	

	// FGameplayEffectCue cue;
	// default cue.GameplayCueTags.AddTag(GameplayTag::GameplayCue_Debuff_Sleep);
	// default GameplayCues.Add(cue);

	default TagsToRemoveOther.AddTag(GameplayTag::Debuff_Fear); 
    default RemoveOtherTags();
}

