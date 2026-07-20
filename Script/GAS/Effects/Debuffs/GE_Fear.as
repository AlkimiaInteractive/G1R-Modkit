class UGE_Fear : UScriptGameplayEffect
{
	default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::Debuff_Fear);
	default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::GE_Persistent);

    //default InheritableOwnedTagsContainer.AddTag(GameplayTag::Debuff_Fear);
	//default InheritableOwnedTagsContainer.AddTag(GameplayTag::State_NoInput_Character);
    //default InheritableOwnedTagsContainer.AddTag(GameplayTag::Debuff_Fear);
	//default InheritableOwnedTagsContainer.AddTag(GameplayTag::State_NoInput_Character);
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Debuff_Fear);
	//default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::State_NoInput_Character);

	default TargetTagRequirements.ApplicationTagRequirements.IgnoreTags.AddTag(GameplayTag::State_Invulnerable);
	default TargetTagRequirements.ApplicationTagRequirements.IgnoreTags.AddTag(GameplayTag::Debuff_Fear);
	default TargetTagRequirements.ApplicationTagRequirements.IgnoreTags.AddTag(GameplayTag::State_Defeated);
	default TargetTagRequirements.ApplicationTagRequirements.IgnoreTags.AddTag(GameplayTag::State_Dead);
	default TargetTagRequirements.ApplicationTagRequirements.IgnoreTags.AddTag(GameplayTag::State_Controlling);
	default TargetTagRequirements.ApplicationTagRequirements.IgnoreTags.AddTag(GameplayTag::State_Controlled);
	default TargetTagRequirements.ApplicationTagRequirements.IgnoreTags.AddTag(GameplayTag::Debuff_Blocked_Fear);

	default DurationPolicy = EGameplayEffectDurationType::HasDuration;	
	default DurationMagnitude.ScalableFloatMagnitude.Value = 0; //Duration in seconds of the effect
	default DurationMagnitude.MagnitudeCalculationType = EGameplayEffectMagnitudeCalculation::ScalableFloat;

	//Not Exist GC
	// FGameplayEffectCue cue;
	// default cue.GameplayCueTags.AddTag(GameplayTag::GameplayCue_Debuff_Fear);
	// default GameplayCues.Add(cue);

	default TagsToRemoveOther.AddTag(GameplayTag::Debuff_Charm); 
    default RemoveOtherTags();

		//Visual effect
	FGameplayEffectCue cue;
	default cue.GameplayCueTags.AddTag(GameplayTag::GameplayCue_Debuff_Interrupt_Attack);
	default GameplayCues.Add(cue);
}

class UGE_Fear_5S : UGE_Fear
{
	default DurationMagnitude.ScalableFloatMagnitude.Value = 100; //Duration in seconds of the effect
	
}
