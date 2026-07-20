class UGE_Charm : UScriptGameplayEffect
{
	default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::Debuff_Charm);
	default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::GE_Persistent);

    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Debuff_Charm);
	default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::State_NoInput_Character);

	default TargetTagRequirements.ApplicationTagRequirements.IgnoreTags.AddTag(GameplayTag::State_Invulnerable);
	default TargetTagRequirements.ApplicationTagRequirements.IgnoreTags.AddTag(GameplayTag::Debuff_Charm);
	default TargetTagRequirements.ApplicationTagRequirements.IgnoreTags.AddTag(GameplayTag::State_Defeated);
	default TargetTagRequirements.ApplicationTagRequirements.IgnoreTags.AddTag(GameplayTag::State_Dead);
	default TargetTagRequirements.ApplicationTagRequirements.IgnoreTags.AddTag(GameplayTag::State_Controlling);
	default TargetTagRequirements.ApplicationTagRequirements.IgnoreTags.AddTag(GameplayTag::Debuff_Sleep);
	default TargetTagRequirements.ApplicationTagRequirements.IgnoreTags.AddTag(GameplayTag::State_Controlling);
	default TargetTagRequirements.ApplicationTagRequirements.IgnoreTags.AddTag(GameplayTag::State_Controlled);
	default TargetTagRequirements.ApplicationTagRequirements.IgnoreTags.AddTag(GameplayTag::Debuff_Blocked_Charm);

	default DurationPolicy = EGameplayEffectDurationType::HasDuration; 
	default DurationMagnitude.ScalableFloatMagnitude.Value = 0; //Duration in seconds of the effect
	default DurationMagnitude.MagnitudeCalculationType = EGameplayEffectMagnitudeCalculation::ScalableFloat;

	default TagsToRemoveOther.AddTag(GameplayTag::Debuff_Fear);
    default RemoveOtherTags();

	// FGameplayEffectCue cue;
	// default cue.GameplayCueTags.AddTag(GameplayTag::GameplayCue_Debuff_Charm);
	// default GameplayCues.Add(cue);

		//Visual effect
	FGameplayEffectCue cue;
	default cue.GameplayCueTags.AddTag(GameplayTag::GameplayCue_Debuff_Interrupt_Attack);
	default GameplayCues.Add(cue);
}
