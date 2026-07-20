class UGE_Summoned : UScriptGameplayEffect
{
	default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::State_Summoned);
	default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::GE_Persistent);

    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::State_Summoned);

	default DurationPolicy = EGameplayEffectDurationType::Infinite;

	// Stack config for effect
	default StackLimitCount = 1;
	default StackingType = EGameplayEffectStackingType::AggregateByTarget;
	default bSuppressStackingCues = true;

	FGameplayAbilitySpecConfig ability_Spec;
	default ability_Spec.Ability = UGA_DeactivateTickOptimizer;
	default ability_Spec.RemovalPolicy = EGameplayEffectGrantedAbilityRemovePolicy::CancelAbilityImmediately;

	default AbilitiesComponent.GrantAbilityConfigs.Add(ability_Spec);
}

class UGE_SummonedNotVisible : UGE_Summoned
{
	FConditionalGameplayEffect conditionalSummonGE;
	default conditionalSummonGE.EffectClass = UGE_SummonedNotVisibleConditional::StaticClass(); 
	default AdditionalEffects.OnApplicationGameplayEffects.Add(conditionalSummonGE);
    
}

class UGE_SummonedNotVisibleConditional : UScriptGameplayEffect
{
	default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::State_Invisible);
	default TargetTagRequirements.ApplicationTagRequirements.IgnoreTags.AddTag(GameplayTag::State_Dead);
	default TargetTagRequirements.ApplicationTagRequirements.IgnoreTags.AddTag(GameplayTag::State_Defeated);
	//default TargetTagRequirements.ApplicationTagRequirements.IgnoreTags.AddTag(GameplayTag::State_Summoned_SpawnAnimSkip);

	default TargetTagRequirements.RemovalTagRequirements.RequireTags.AddTag(GameplayTag::State_Summoned_SpawnAnimSkip);

	default DurationPolicy = EGameplayEffectDurationType::Infinite;

	// Stack config for effect
	default StackLimitCount = 1;
	default StackingType = EGameplayEffectStackingType::AggregateByTarget;
	default bSuppressStackingCues = true;
}

class UGE_Summoned_SpawnAnimSkip : UScriptGameplayEffect
{
	//@DE - Avoid do summon animation on load game
	default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::State_Summoned_SpawnAnimSkip);
	default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::GE_Persistent);

    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::State_Summoned_SpawnAnimSkip);

	default DurationPolicy = EGameplayEffectDurationType::Infinite;

	// Stack config for effect
	default StackLimitCount = 1;
	default StackingType = EGameplayEffectStackingType::AggregateByTarget;
	default bSuppressStackingCues = true;

	FGameplayAbilitySpecConfig ability_Spec;
	default ability_Spec.Ability = UGA_DeactivateTickOptimizer;
	default ability_Spec.RemovalPolicy = EGameplayEffectGrantedAbilityRemovePolicy::CancelAbilityImmediately;

	default AbilitiesComponent.GrantAbilityConfigs.Add(ability_Spec);
}