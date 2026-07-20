class UGE_Damage_Fire : UGE_Damage
{
		// The effect wont be added if the character already has this tag
	//default TargetTagRequirements.ApplicationTagRequirements.IgnoreTags.AddTag(GameplayTag::State_Defeated);
	//default TargetTagRequirements.ApplicationTagRequirements.IgnoreTags.AddTag(GameplayTag::State_Dead);
}

class UGE_Damage_Fire_Duration : UGE_Damage_Fire
{
	default DurationPolicy = EGameplayEffectDurationType::HasDuration;
	default DurationMagnitude.ScalableFloatMagnitude.Value = 1.f; // Duration in seconds of the effect (0 = Infinite)
	default DurationMagnitude.MagnitudeCalculationType = EGameplayEffectMagnitudeCalculation::ScalableFloat;
	default Period.Value = 0.5f; // Applied each seconds
}

class UGE_Damage_Fire_Duration_Burning : UGE_Damage_Fire_Duration
{
	/*FGameplayEffectCue cue;
	default cue.GameplayCueTags.AddTag(GameplayTag::GameplayCue_State_Burned);
	default GameplayCues.Add(cue);*/
}

// Effect applied by the spell UFireRainDefinition
// Due to it's infinite we need to remove the effect from the target once the target is out of spell range
class UGE_Damage_Fire_Infinite : UGE_Damage_Fire_Duration
{
	//default m_ElementalEffect = UGE_FireStack::StaticClass();
	default DurationMagnitude.ScalableFloatMagnitude.Value = 0.f; // Duration in seconds of the effect (0 = Infinite)
}

class UGE_Damage_Fire_Infinite_Burning : UGE_Damage_Fire_Duration_Burning
{
	//default m_ElementalEffect = UGE_FireStack::StaticClass();
	default DurationMagnitude.ScalableFloatMagnitude.Value = 0.f; // Duration in seconds of the effect (0 = Infinite)
}

// Effect applied by the spell UStormOfFireDefinition
class UGE_Damage_Fire_Duration_5s_Burning : UGE_Damage_Fire_Duration_Burning
{
	default DurationMagnitude.ScalableFloatMagnitude.Value = 5; // Duration in seconds of the effect

	// Tags to add to the receiver of the effect
	//default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Debuff_Freeze);
	//default TargetTagRequirements.ApplicationTagRequirements.IgnoreTags.AddTag(GameplayTag::Debuff_Freeze);
}

class UGE_BurnInfinite : UGE_Burn
{
	default DurationPolicy = EGameplayEffectDurationType::Infinite;
}

// Effect applied after UGE_FireStack is overflowed
// This effect will active the visuals and give the burn damage if is successfully activated
// UGE_Burn and UGE_Burn_Damage has same duration. They were splited on 5.4 due periodic UGE cant has TagsToRemoveOther effect component.
class UGE_Burn : UGE_ElementalDebuffBase
{
	//Tags of the gameplay effect (This help to get the effect from the ability system)
	default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::Debuff_Burn);
	default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::GE_Persistent);
	


	// Duraction of the effect
	default DurationPolicy = EGameplayEffectDurationType::HasDuration;
	default DurationMagnitude.ScalableFloatMagnitude.Value = 10; // Duration in seconds of the effect
	default DurationMagnitude.MagnitudeCalculationType = EGameplayEffectMagnitudeCalculation::ScalableFloat;
	//default Period.Value = 0.5f;

	// Tags added to the character
	default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Debuff_Burn);
	default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::State_Burn);
	default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::GE_NeedSaveEffectContext);

	// The effect won be added if the character already has this tag
	default TargetTagRequirements.ApplicationTagRequirements.IgnoreTags.AddTag(GameplayTag::State_Invulnerable);
	default TargetTagRequirements.ApplicationTagRequirements.IgnoreTags.AddTag(GameplayTag::State_UnBurn);
	default TargetTagRequirements.ApplicationTagRequirements.IgnoreTags.AddTag(GameplayTag::State_Defeated);
	default TargetTagRequirements.ApplicationTagRequirements.IgnoreTags.AddTag(GameplayTag::State_Cant_Burn);
	default TargetTagRequirements.ApplicationTagRequirements.IgnoreTags.AddTag(GameplayTag::State_Swimming);
	default TargetTagRequirements.ApplicationTagRequirements.IgnoreTags.AddTag(GameplayTag::State_InWater_MidWater);
	default TargetTagRequirements.ApplicationTagRequirements.IgnoreTags.AddTag(GameplayTag::State_InWater_DeepWater);
	


	// Visual effect
	// FGameplayEffectCue cue;
	// default cue.GameplayCueTags.AddTag(GameplayTag::GameplayCue_State_Burned);
	// default GameplayCues.Add(cue);

	// Stack config for effect
	default StackLimitCount = 1;
	default StackingType = EGameplayEffectStackingType::AggregateByTarget;
	default bSuppressStackingCues = true;

	default TargetTagRequirements.RemovalTagRequirements.RequireTags.AddTag(GameplayTag::State_Swimming);
	default TargetTagRequirements.RemovalTagRequirements.RequireTags.AddTag(GameplayTag::State_InWater_MidWater);
	default TargetTagRequirements.RemovalTagRequirements.RequireTags.AddTag(GameplayTag::State_InWater_DeepWater);

	//When the character get burn, if its freeze, this remove the effect
	default TagsToRemoveOther.AddTag(GameplayTag::Debuff_Freeze);
	default TagsToRemoveOther.AddTag(GameplayTag::Debuff_Stack_Ice);
	default TagsToRemoveOther.AddTag(GameplayTag::Debuff_Sleep);
	default TagsToRemoveOther.AddTag(GameplayTag::State_Controlling);
	default TagsToRemoveOther.AddTag(GameplayTag::Debuff_Stack_Freeze_Hits);
    default RemoveOtherTags();

	FConditionalGameplayEffect conditionalDamage;
	default conditionalDamage.EffectClass = UGE_Burn_Damage_Infinite::StaticClass(); 
	default AdditionalEffects.OnApplicationGameplayEffects.Add(conditionalDamage);


	default AdditionalEffects.OnCompleteAlways.Add(UGE_Burn_Damage_Infinite_Removal::StaticClass()); 
}


class UGE_Burn_Damage_Infinite_Removal : UScriptGameplayEffect
{
	// Duraction of the effect
	default DurationPolicy = EGameplayEffectDurationType::Instant;
	default TagsToRemoveOther.AddTag(GameplayTag::Debuff_Burn_Damage_Infinite_Period);
    default RemoveOtherTags();
}


// This effect will burn the player for X seconds
class UGE_Burn_Damage_Infinite : UScriptGameplayEffect
{
	//Tags of the gameplay effect (This help to get the effect from the ability system)
	default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::Debuff_Burn_Damage_Infinite_Period);
	default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::NoGeneratePerceptionEventHit);
	//default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::Debuff_Burn);
	
	// Attribute to modify
	FGameplayModifierInfo modifier;
	default modifier.ModifierMagnitude.MagnitudeCalculationType = EGameplayEffectMagnitudeCalculation::ScalableFloat;
	default modifier.ModifierMagnitude.ScalableFloatMagnitude.Value = -1.0f; // How much damage applies to the attribute
	default modifier.ModifierOp = EGameplayModOp::Additive;
	default modifier.Attribute = GetAttribute(UAttributeSet_Health::StaticClass(), n"Health"); // attribute class and name
	default Modifiers.Add(modifier);

	// Duraction of the effect
	default DurationPolicy = EGameplayEffectDurationType::Infinite;
	//default DurationMagnitude.ScalableFloatMagnitude.Value = 15; // Duration in seconds of the effect
	default DurationMagnitude.MagnitudeCalculationType = EGameplayEffectMagnitudeCalculation::ScalableFloat;
	default Period.Value = 0.5f;

	
	default TargetTagRequirements.ApplicationTagRequirements.IgnoreTags.AddTag(GameplayTag::State_Invulnerable);
	default TargetTagRequirements.ApplicationTagRequirements.IgnoreTags.AddTag(GameplayTag::State_UnBurn);
	default TargetTagRequirements.ApplicationTagRequirements.IgnoreTags.AddTag(GameplayTag::State_Defeated);
	default TargetTagRequirements.ApplicationTagRequirements.IgnoreTags.AddTag(GameplayTag::State_Cant_Burn);
	default TargetTagRequirements.ApplicationTagRequirements.IgnoreTags.AddTag(GameplayTag::State_Swimming);
	default TargetTagRequirements.ApplicationTagRequirements.IgnoreTags.AddTag(GameplayTag::State_InWater_MidWater);
	default TargetTagRequirements.ApplicationTagRequirements.IgnoreTags.AddTag(GameplayTag::State_InWater_DeepWater);
	default TargetTagRequirements.ApplicationTagRequirements.IgnoreTags.AddTag(GameplayTag::State_Dead);

	// Stack config for effect
	default StackLimitCount = 1;
	default StackingType = EGameplayEffectStackingType::AggregateByTarget;
	default bSuppressStackingCues = true;

}


// Effect which contains the stacks for fire damage, once the StackLimitCount is reached the effect will apply the new effect
// called UGE_Burn, stacks will be removed using StackExpirationPolicy
class UGE_FireStack : UScriptGameplayEffect
{
	//Tags of the gameplay effect (This help to get the effect from the ability system)
	default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::Debuff_Stack_Fire);

	default DurationPolicy = EGameplayEffectDurationType::HasDuration;
	default DurationMagnitude.ScalableFloatMagnitude.Value = 2; // Duration in seconds of each stack
	default DurationMagnitude.MagnitudeCalculationType = EGameplayEffectMagnitudeCalculation::ScalableFloat;

	// Stack config for effect
	default StackLimitCount = 30;
	default StackingType = EGameplayEffectStackingType::AggregateByTarget;
	default StackExpirationPolicy = EGameplayEffectStackingExpirationPolicy::RemoveSingleStackAndRefreshDuration;

	// Effect to apply when current stacks >= StackLimitCount
	default OverflowEffects.Add(UGE_Burn::StaticClass());
}

class UGE_UnBurn : UScriptGameplayEffect
{
	//Tags of the gameplay effect (This help to get the effect from the ability system)
	default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::State_UnBurn);

	default DurationPolicy = EGameplayEffectDurationType::HasDuration;
	//default DurationMagnitude.ScalableFloatMagnitude.Value = 2; // Duration in seconds of each stack

	default DurationMagnitude.MagnitudeCalculationType = EGameplayEffectMagnitudeCalculation::ScalableFloat;
	

	// //Tags added to the character
	 default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::State_UnBurn);
}


class UGE_Torch1H_Damage : UGE_Damage_Fire
{
	default m_ElementalEffectStacks.Add(FElementalEffectStackData(UGE_FireStack::StaticClass()));
	//default m_ElementalEffectStack = UGE_FireStack::StaticClass();

	FGameplayEffectCue cue;
	default cue.GameplayCueTags.AddTag(GameplayTag::GameplayCue_Debuff_Torch_Environment);
	default GameplayCues.Add(cue);
}

class UGE_Uriziel_03_Damage : UGE_Damage_Fire
{
	default m_ElementalEffectStacks.Add(FElementalEffectStackData(UGE_FireStack::StaticClass()));
	//default m_ElementalEffectStack = UGE_FireStack::StaticClass();

	FGameplayEffectCue cue;
	default cue.GameplayCueTags.AddTag(GameplayTag::GameplayCue_Debuff_Torch_Environment);
	default GameplayCues.Add(cue);
}


class UGE_BurnRemoval : UScriptGameplayEffect
{
	
	default DurationPolicy = EGameplayEffectDurationType::Instant;	

	// Stack config for effect
	default StackLimitCount = 1;
	default StackingType = EGameplayEffectStackingType::AggregateByTarget;
	
	default TagsToRemoveOther.AddTag(GameplayTag::Debuff_Burn);
    default RemoveOtherTags();
}
