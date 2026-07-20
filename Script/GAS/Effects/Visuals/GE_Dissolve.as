class UGE_Dissolve : UScriptGameplayEffect
{
	default DurationPolicy = EGameplayEffectDurationType::Infinite;
	//default DurationMagnitude.ScalableFloatMagnitude.Value = 300.0f; 

	// The effect wont be added if the character already has this tag
    default TargetTagRequirements.OngoingTagRequirements.RequireTags.AddTag(GameplayTag::State_Dead);
    default TargetTagRequirements.OngoingTagRequirements.RequireTags.AddTag(GameplayTag::Visuals_DeathDissolve);

	default TagsToRemoveOther.AddTag(GameplayTag::Debuff_Burn);
	default TagsToRemoveOther.AddTag(GameplayTag::Debuff_Stack_Fire);
	default TagsToRemoveOther.AddTag(GameplayTag::Debuff_Freeze);
	default TagsToRemoveOther.AddTag(GameplayTag::Debuff_Stack_Ice);
	default TagsToRemoveOther.AddTag(GameplayTag::Debuff_Defeated);
	default TagsToRemoveOther.AddTag(GameplayTag::Debuff_Fear);
	default TagsToRemoveOther.AddTag(GameplayTag::Debuff_Electrified);
	default TagsToRemoveOther.AddTag(GameplayTag::Debuff_Paralyzed);
	default TagsToRemoveOther.AddTag(GameplayTag::Debuff_Sleep);
	default TagsToRemoveOther.AddTag(GameplayTag::Debuff_Charm);
	default TagsToRemoveOther.AddTag(GameplayTag::Debuff_Shrink);
	default TagsToRemoveOther.AddTag(GameplayTag::State_Knockback);
	default TagsToRemoveOther.AddTag(GameplayTag::Debuff_Wind);
	default TagsToRemoveOther.AddTag(GameplayTag::State_Controlling);
	default TagsToRemoveOther.AddTag(GameplayTag::State_Controlled);
	default TagsToRemoveOther.AddTag(GameplayTag::Debuff_Stack_Freeze_Hits);
	default RemoveOtherTags();
	
	FGameplayEffectCue cue;
	default cue.GameplayCueTags.AddTag(GameplayTag::GameplayCue_Dissolve);
	default GameplayCues.Add(cue);
}