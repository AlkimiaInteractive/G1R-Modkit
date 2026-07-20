class UGE_XardasSleeper_MinionStunned : UScriptGameplayEffect
{
    //Tags of the gameplay effect (This help to get the effect from the ability system)
	default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::Debuff_Sleeper_Xardas_MinionStunned);

	default DurationPolicy = EGameplayEffectDurationType::Infinite;

	default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Debuff_Deaf);
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Debuff_Anosmic);
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Debuff_Blind);
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::State_LockMovement);
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::State_Invulnerable);

    default BlockAbilityTagsComponent.InheritableBlockedAbilityTagsContainer.AddTag(GameplayTag::Ability_AI_Character);

    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::State_LockMovement);
	default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::State_CantBeTarget);
	default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::State_IgnoreAllInput);
}

class UGE_XardasSleeper_MinionStunned_Removal : UScriptGameplayEffect
{
    default DurationPolicy = EGameplayEffectDurationType::Instant;
    
    default TagsToRemoveOther.AddTag(GameplayTag::Debuff_Sleeper_Xardas_MinionStunned);
    default RemoveOtherTags();
}