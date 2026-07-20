class UGE_Death : UScriptGameplayEffect
{
	default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::Debuff_Death);

    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Debuff_Death);

	//default TargetTagRequirements.ApplicationTagRequirements.IgnoreTags.AddTag(GameplayTag::State_Invulnerable);
	default TargetTagRequirements.ApplicationTagRequirements.IgnoreTags.AddTag(GameplayTag::Debuff_Death);
	
	default DurationPolicy = EGameplayEffectDurationType::HasDuration;	

	// Stack config for effect
	default StackLimitCount = 1;
	default StackingType = EGameplayEffectStackingType::AggregateByTarget;
	
	//default TagsToRemoveOther.AddTag(GameplayTag::Debuff_Burn);
	default TagsToRemoveOther.AddTag(GameplayTag::Debuff_Stack_Fire);
	default TagsToRemoveOther.AddTag(GameplayTag::Debuff_Freeze);
	default TagsToRemoveOther.AddTag(GameplayTag::Debuff_Stack_Ice);
	default TagsToRemoveOther.AddTag(GameplayTag::Debuff_Defeated);
	default TagsToRemoveOther.AddTag(GameplayTag::Debuff_Fear);
	//default TagsToRemoveOther.AddTag(GameplayTag::Debuff_Electrified);
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
		
			//Visual effect
	FGameplayEffectCue cue;
	default cue.GameplayCueTags.AddTag(GameplayTag::GameplayCue_Debuff_Interrupt_Attack);
	default GameplayCues.Add(cue);

}


class UGE_Death_Varrag : UGE_Death
{
	FGameplayEffectCue cueVarrag;
	default cueVarrag.GameplayCueTags.AddTag(GameplayTag::GameplayCue_Creature_Varrag_Death);
	default GameplayCues.Add(cueVarrag);
}