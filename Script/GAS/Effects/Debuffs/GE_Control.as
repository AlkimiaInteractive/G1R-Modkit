class UGE_TargetControlled : UScriptGameplayEffect
{
	default DurationPolicy = EGameplayEffectDurationType::Infinite;

    default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::State_Controlled);
	default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::Debuff_Unconscious);

	//Tags added to the character
	default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::State_Controlled);
	default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Debuff_Unconscious);
	default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::State_IgnoreQuests);

	// The effect wont be added if the character already has this tag
	default TargetTagRequirements.ApplicationTagRequirements.IgnoreTags.AddTag(GameplayTag::State_Invulnerable);
	default TargetTagRequirements.ApplicationTagRequirements.IgnoreTags.AddTag(GameplayTag::State_Defeated);
	default TargetTagRequirements.ApplicationTagRequirements.IgnoreTags.AddTag(GameplayTag::State_Dead);
	//default TargetTagRequirements.ApplicationTagRequirements.IgnoreTags.AddTag(GameplayTag::Debuff_Possessed);
	//default TargetTagRequirements.ApplicationTagRequirements.IgnoreTags.AddTag(GameplayTag::Character_Player);

	FGameplayAbilitySpecConfig uncontrolConfig;
	default uncontrolConfig.Ability = UGA_Spell_UnControl::StaticClass();
	default uncontrolConfig.InputID = int(EAbilityInputID::Possess);
	default uncontrolConfig.RemovalPolicy = EGameplayEffectGrantedAbilityRemovePolicy::RemoveAbilityOnEnd;

	FGameplayAbilitySpecConfig jumpConfig;
	default jumpConfig.Ability = UGameplayAbilityJump::StaticClass();
	default jumpConfig.InputID = int(EAbilityInputID::JumpAction);
	default jumpConfig.RemovalPolicy = EGameplayEffectGrantedAbilityRemovePolicy::RemoveAbilityOnEnd;

	FGameplayAbilitySpecConfig interactConfig;
	default interactConfig.Ability = UGameplayAbilityInteract::StaticClass();
	default interactConfig.InputID = int(EAbilityInputID::Interact);
	default interactConfig.RemovalPolicy = EGameplayEffectGrantedAbilityRemovePolicy::CancelAbilityImmediately;

	FGameplayAbilitySpecConfig lootConfig;
	default lootConfig.Ability = UGameplayAbilityLoot::StaticClass();
	default lootConfig.InputID = int(EAbilityInputID::Interact);
	default lootConfig.RemovalPolicy = EGameplayEffectGrantedAbilityRemovePolicy::RemoveAbilityOnEnd;

	FGameplayAbilitySpecConfig dodgeConfig;
	default dodgeConfig.Ability = UGA_Dodge::StaticClass();
	default dodgeConfig.InputID = int(EAbilityInputID::Dodge);
	default dodgeConfig.RemovalPolicy = EGameplayEffectGrantedAbilityRemovePolicy::CancelAbilityImmediately;

	FGameplayAbilitySpecConfig checkClimbConfig;
	default checkClimbConfig.Ability = UGameplayAbilityCheckClimb::StaticClass();
	default checkClimbConfig.RemovalPolicy = EGameplayEffectGrantedAbilityRemovePolicy::CancelAbilityImmediately;

	default AbilitiesComponent.GrantAbilityConfigs.Add(uncontrolConfig);
	default AbilitiesComponent.GrantAbilityConfigs.Add(jumpConfig);
	default AbilitiesComponent.GrantAbilityConfigs.Add(interactConfig);
	default AbilitiesComponent.GrantAbilityConfigs.Add(dodgeConfig);
	default AbilitiesComponent.GrantAbilityConfigs.Add(checkClimbConfig);
	default AbilitiesComponent.GrantAbilityConfigs.Add(lootConfig);

	

	//Tags of the gameplay effect (This help to get the effect from the ability system)
	default TagsToRemoveOther.AddTag(GameplayTag::Debuff_Freeze);
	default TagsToRemoveOther.AddTag(GameplayTag::Debuff_Stack_Ice);
	default TagsToRemoveOther.AddTag(GameplayTag::Debuff_Fear);
	default TagsToRemoveOther.AddTag(GameplayTag::Debuff_Sleep);
	default TagsToRemoveOther.AddTag(GameplayTag::Debuff_Charm);
	default TagsToRemoveOther.AddTag(GameplayTag::State_Controlling); 
	default TagsToRemoveOther.AddTag(GameplayTag::Debuff_Stack_Freeze_Hits);
    default RemoveOtherTags();

/*
	FGameplayEffectCue cue;
	default cue.GameplayCueTags.AddTag(GameplayTag::GameplayCue_State_Controlled);
	default GameplayCues.Add(cue);*/
}

class UGE_TargetControlledInterruptTasks : UScriptGameplayEffect
{
	default DurationPolicy = EGameplayEffectDurationType::Instant;

	FGameplayEffectCue cue;
	default cue.GameplayCueTags.AddTag(GameplayTag::GameplayCue_Debuff_Interrupt_Attack);
	default GameplayCues.Add(cue);
}