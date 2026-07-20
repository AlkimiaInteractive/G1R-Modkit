class UGE_Defeated : UScriptGameplayEffect
{
	default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::Debuff_Defeated);

    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Debuff_Defeated);
	default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::State_Defeated);

	//default TargetTagRequirements.ApplicationTagRequirements.IgnoreTags.AddTag(GameplayTag::State_Invulnerable);
	default TargetTagRequirements.ApplicationTagRequirements.IgnoreTags.AddTag(GameplayTag::Debuff_Defeated);
	default TargetTagRequirements.ApplicationTagRequirements.IgnoreTags.AddTag(GameplayTag::State_Dead);

	default DurationPolicy = EGameplayEffectDurationType::HasDuration;	

	// Stack config for effect
	default StackLimitCount = 1;
	default StackingType = EGameplayEffectStackingType::AggregateByTarget;

	default TagsToRemoveOther.AddTag(GameplayTag::Debuff_Burn);
	default TagsToRemoveOther.AddTag(GameplayTag::Debuff_Stack_Fire);
	default TagsToRemoveOther.AddTag(GameplayTag::Debuff_Freeze);
	default TagsToRemoveOther.AddTag(GameplayTag::Debuff_Stack_Ice);
	//default TagsToRemoveOther.AddTag(GameplayTag::Debuff_Paralyzed);
	default TagsToRemoveOther.AddTag(GameplayTag::Debuff_Electrified);
	default TagsToRemoveOther.AddTag(GameplayTag::Debuff_Sleep);
	default TagsToRemoveOther.AddTag(GameplayTag::Debuff_Charm);
	default TagsToRemoveOther.AddTag(GameplayTag::Debuff_Shrink);
	default TagsToRemoveOther.AddTag(GameplayTag::State_Knockback);
	default TagsToRemoveOther.AddTag(GameplayTag::Debuff_Wind);
	default TagsToRemoveOther.AddTag(GameplayTag::Debuff_Fear);
	default TagsToRemoveOther.AddTag(GameplayTag::State_Controlling);
	default TagsToRemoveOther.AddTag(GameplayTag::State_Controlled);
	default TagsToRemoveOther.AddTag(GameplayTag::Debuff_Stack_Freeze_Hits);
    default RemoveOtherTags();


	//Visual effect
	FGameplayEffectCue cue;
	default cue.GameplayCueTags.AddTag(GameplayTag::GameplayCue_Debuff_Interrupt_Attack);
	default GameplayCues.Add(cue);
}


class UGE_StayDefeated : UScriptGameplayEffect
{
    default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::Debuff_Defeated_Stay);
    default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::GE_Persistent);

    default DurationPolicy = EGameplayEffectDurationType::Infinite;
  	default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Character_StayDefeated);
}

mixin FGameplayEffectSpecHandle GE_StayDefeated(UAbilitySystemComponent ASC)
{
	return ASC.MakeOutgoingSpec(UGE_StayDefeated::StaticClass(), 0.0f, ASC.MakeEffectContext());
}

mixin void RemoveStayDefeatedEffect(UAbilitySystemComponent ASC)
{
	FGameplayTagContainer Tags;
	Tags.AddTag(GameplayTag::Debuff_Defeated_Stay);
	ASC.RemoveActiveEffectsWithTags(Tags);
}

class UGE_State_Defeated : UScriptGameplayEffect
{
	default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::State_Defeated);
	default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::GE_Persistent);

	default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::State_Defeated);

	default TargetTagRequirements.ApplicationTagRequirements.IgnoreTags.AddTag(GameplayTag::State_Dead);

	default DurationPolicy = EGameplayEffectDurationType::HasDuration;
	default DurationMagnitude.MagnitudeCalculationType = EGameplayEffectMagnitudeCalculation::SetByCaller;
	default DurationMagnitude.SetByCallerMagnitude.DataTag = GameplayTag::GE_Param_Duration;
}