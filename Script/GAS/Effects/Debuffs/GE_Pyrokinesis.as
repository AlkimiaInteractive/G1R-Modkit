class UGE_Pyrokinesis_Damage : UGE_Damage
{
	default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::NoGeneratePerceptionEventHit);
    //default m_ElementalEffectStack = UGE_FireStack::StaticClass();
	default m_ElementalEffectStacks.Add(FElementalEffectStackData(UGE_FireStack::StaticClass()));
}

class UGE_Damage_Pyrokinesis_Infinite : UGE_Pyrokinesis_Damage
{	
	default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::Debuff_Pyrokinesis_Damage_Infinite_Period);

	default TargetTagRequirements.ApplicationTagRequirements.IgnoreTags.AddTag(GameplayTag::State_Dead);

	default DurationPolicy = EGameplayEffectDurationType::Infinite;
	default Period.Value = 1.f;

	// Stack config for effect
	default StackLimitCount = 1;
	default StackingType = EGameplayEffectStackingType::AggregateByTarget;
	default bSuppressStackingCues = true;
}

class UGE_Pyrokinesis : UScriptGameplayEffect
{
    //default m_ElementalEffectStack = UGE_FireStack::StaticClass();

	default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::Debuff_Pyrokinesis);
	default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::Debuff_AllowPlayOutMontage);
		
	default DurationPolicy = EGameplayEffectDurationType::Infinite;

	default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Debuff_Pyrokinesis);
	
	// The effect wont be added if the character already has this tag
	default TargetTagRequirements.ApplicationTagRequirements.IgnoreTags.AddTag(GameplayTag::Debuff_Pyrokinesis);	
	default TargetTagRequirements.ApplicationTagRequirements.IgnoreTags.AddTag(GameplayTag::State_Invulnerable);
	default TargetTagRequirements.ApplicationTagRequirements.IgnoreTags.AddTag(GameplayTag::State_Defeated);
	default TargetTagRequirements.ApplicationTagRequirements.IgnoreTags.AddTag(GameplayTag::State_Dead);
	
	//Visual effect
	FGameplayEffectCue cue;
	default cue.GameplayCueTags.AddTag(GameplayTag::GameplayCue_Debuff_Interrupt_Attack);
	default GameplayCues.Add(cue);

	FConditionalGameplayEffect conditionalDamage;
	default conditionalDamage.EffectClass = UGE_Damage_Pyrokinesis_Infinite::StaticClass(); 
	default AdditionalEffects.OnApplicationGameplayEffects.Add(conditionalDamage);

	default AdditionalEffects.OnCompleteAlways.Add(UGE_Damage_Pyrokinesis_Infinite_Removal::StaticClass()); 

	default TagsToRemoveOther.AddTag(GameplayTag::Debuff_Sleep);
	//default RemoveOtherTags();
}

//Removal infinite Pyrokinesis gameplay effect.
class UGE_Damage_Pyrokinesis_Infinite_Removal : UScriptGameplayEffect
{
	default DurationPolicy = EGameplayEffectDurationType::Instant;
	default TagsToRemoveOther.AddTag(GameplayTag::Debuff_Pyrokinesis_Damage_Infinite_Period);
	default RemoveOtherTags();
}


class UGE_Pyrokinesis_Slowdown : UGE_Pyrokinesis
{
	default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::Debuff_Slowdown);

	default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Debuff_Slowdown);
	//default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Debuff_Component_Slowdown);

	default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Debuff_Disable_Dodge);
	default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Debuff_Disable_Roll);

	default RemoveOtherTags();
}
