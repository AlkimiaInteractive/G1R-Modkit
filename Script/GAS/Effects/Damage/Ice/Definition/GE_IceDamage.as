class UGE_Ice_Damage : UGE_Damage
{
	// The effect wont be added if the character already has this tag
	//default TargetTagRequirements.ApplicationTagRequirements.IgnoreTags.AddTag(GameplayTag::State_Defeated);
	//default TargetTagRequirements.ApplicationTagRequirements.IgnoreTags.AddTag(GameplayTag::State_Dead);
}

class UGE_FreezeInfinite : UGE_Freeze
{
	default DurationMagnitude.ScalableFloatMagnitude.Value = 0.f;
}

class UGE_Freeze_5Secs : UGE_Freeze
{
	default DurationMagnitude.ScalableFloatMagnitude.Value = 5.f;
}

class UGE_Freeze : UGE_ElementalDebuffBase
{
	float Resistance_Blunt_Debuff = 40.f;
	float Resistance_Edge_Buff = 30.f;
	float Resistance_Point_Buff = 30.f;

	//Tags of the gameplay effect (This help to get the effect from the ability system)
	default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::Debuff_Freeze);
	//default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::Debuff_Paralyzed);
	default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::GE_Persistent);
	
	//Tags added to the character
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Debuff_Freeze);
	//default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Debuff_Paralyzed);
	default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Debuff_Blocked_Sleep);

	// The effect wont be added if the character already has this tag
	default TargetTagRequirements.ApplicationTagRequirements.IgnoreTags.AddTag(GameplayTag::State_Invulnerable);
	default TargetTagRequirements.ApplicationTagRequirements.IgnoreTags.AddTag(GameplayTag::Debuff_Freeze);
	default TargetTagRequirements.ApplicationTagRequirements.IgnoreTags.AddTag(GameplayTag::Debuff_Cooldown_Freeze);
	default TargetTagRequirements.ApplicationTagRequirements.IgnoreTags.AddTag(GameplayTag::State_Defeated);
	default TargetTagRequirements.ApplicationTagRequirements.IgnoreTags.AddTag(GameplayTag::State_Cant_Freeze);
	//default TargetTagRequirements.ApplicationTagRequirements.IgnoreTags.AddTag(GameplayTag::Debuff_Electrified);
	//default TargetTagRequirements.ApplicationTagRequirements.IgnoreTags.AddTag(GameplayTag::State_Dead);

	default DurationPolicy = EGameplayEffectDurationType::HasDuration;
	default DurationMagnitude.MagnitudeCalculationType = EGameplayEffectMagnitudeCalculation::ScalableFloat;

	// Attribute to modify
	FGameplayModifierInfo modifier;
	default modifier.ModifierMagnitude.MagnitudeCalculationType = EGameplayEffectMagnitudeCalculation::ScalableFloat;
	default modifier.ModifierMagnitude.ScalableFloatMagnitude.Value = -Resistance_Blunt_Debuff; // How much damage applies to the attribute
	default modifier.ModifierOp = EGameplayModOp::Additive;
	default modifier.Attribute = GetAttribute(UAttributeSet_Armor::StaticClass(), n"Resistance_Blunt"); // attribute class and name
	default Modifiers.Add(modifier);

	FGameplayModifierInfo modifier2;
	default modifier2.ModifierMagnitude.MagnitudeCalculationType = EGameplayEffectMagnitudeCalculation::ScalableFloat;
	default modifier2.ModifierMagnitude.ScalableFloatMagnitude.Value = +Resistance_Edge_Buff; // How much damage applies to the attribute
	default modifier2.ModifierOp = EGameplayModOp::Additive;
	default modifier2.Attribute = GetAttribute(UAttributeSet_Armor::StaticClass(), n"Resistance_Edge"); // attribute class and name
	default Modifiers.Add(modifier2);

	FGameplayModifierInfo modifier3;
	default modifier3.ModifierMagnitude.MagnitudeCalculationType = EGameplayEffectMagnitudeCalculation::ScalableFloat;
	default modifier3.ModifierMagnitude.ScalableFloatMagnitude.Value = +Resistance_Point_Buff; // How much damage applies to the attribute
	default modifier3.ModifierOp = EGameplayModOp::Additive;
	default modifier3.Attribute = GetAttribute(UAttributeSet_Armor::StaticClass(), n"Resistance_Point"); // attribute class and name
	default Modifiers.Add(modifier3);

	FGameplayEffectCue cue;
	default cue.GameplayCueTags.AddTag(GameplayTag::GameplayCue_Debuff_Interrupt_Attack);
	default GameplayCues.Add(cue);

	//@DE - Burn effect added only for devs. 
	//Remove burn effect and add the proper ice premature effect.
	//default PrematureExpirationEffectClasses.Add(UGE_Burn::StaticClass());

	default TagsToRemoveOther.AddTag(GameplayTag::GE_Regenerate_SuperArmor);
	default TagsToRemoveOther.AddTag(GameplayTag::Debuff_Stack_Fire);
	default TagsToRemoveOther.AddTag(GameplayTag::Debuff_Burn);
	default TagsToRemoveOther.AddTag(GameplayTag::Debuff_Electrified);
	default TagsToRemoveOther.AddTag(GameplayTag::Debuff_Sleep); 
	default TagsToRemoveOther.AddTag(GameplayTag::State_Controlling);
	default TagsToRemoveOther.AddTag(GameplayTag::Debuff_Stack_Freeze_Hits);
    default RemoveOtherTags();

	FConditionalGameplayEffect conditionalParalyzeGE;
	default conditionalParalyzeGE.EffectClass = UGE_Freeze_Paralyze::StaticClass(); 
	default AdditionalEffects.OnApplicationGameplayEffects.Add(conditionalParalyzeGE);

	default AdditionalEffects.OnCompleteAlways.Add(UGE_Freeze_Paralyze_Removal::StaticClass());
}

//Removal UGE_Damage_Area_Electrified_Infinite gameplay effect.
class UGE_Freeze_Paralyze_Removal : UScriptGameplayEffect
{
	default DurationPolicy = EGameplayEffectDurationType::Instant;
	default TagsToRemoveOther.AddTag(GameplayTag::Debuff_Removal_Paralyze_Freeze);
	default RemoveOtherTags();
}

class UGE_Freeze_Paralyze : UGE_Paralyze_Base
{
	default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::Debuff_Removal_Paralyze_Freeze);
}

class UGE_IceStack_Freeze : UGE_Freeze
{
	//Duration of the effect
	default DurationPolicy = EGameplayEffectDurationType::HasDuration;
	default DurationMagnitude.ScalableFloatMagnitude.Value = 8; //Duration in seconds of the effect
	default DurationMagnitude.MagnitudeCalculationType = EGameplayEffectMagnitudeCalculation::ScalableFloat;

	// Stack config for effect
	default StackLimitCount = 1;
	default StackingType = EGameplayEffectStackingType::AggregateByTarget;
	default bSuppressStackingCues = true;
}


class UGE_IceStack : UScriptGameplayEffect
{
	//Tags of the gameplay effect (This help to get the effect from the ability system)
	default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::Debuff_Stack_Ice);

	default DurationPolicy = EGameplayEffectDurationType::HasDuration;
	default DurationMagnitude.ScalableFloatMagnitude.Value = 2; // Duration in seconds of each stack

	default DurationMagnitude.MagnitudeCalculationType = EGameplayEffectMagnitudeCalculation::ScalableFloat;

	default StackLimitCount = 50;
	default StackingType = EGameplayEffectStackingType::AggregateByTarget;
	default StackExpirationPolicy = EGameplayEffectStackingExpirationPolicy::RemoveSingleStackAndRefreshDuration;

	
	default TargetTagRequirements.ApplicationTagRequirements.IgnoreTags.AddTag(GameplayTag::Debuff_Cooldown_Freeze);

	//Effect to apply when current stack >= StackLimitCount
	default OverflowEffects.Add(UGE_IceStack_Freeze::StaticClass());
	default OverflowEffects.Add(UGE_Freeze_Cooldown_Initial::StaticClass());
}

class UGE_FreezeHitsStack : UScriptGameplayEffect
{
	//Tags of the gameplay effect (This help to get the effect from the ability system)
	default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::Debuff_Stack_Freeze_Hits);

	default DurationPolicy = EGameplayEffectDurationType::HasDuration;
	default DurationMagnitude.ScalableFloatMagnitude.Value = 2; // Duration in seconds of each stack

	default DurationMagnitude.MagnitudeCalculationType = EGameplayEffectMagnitudeCalculation::ScalableFloat;

	default StackLimitCount = 50;
	default StackingType = EGameplayEffectStackingType::AggregateByTarget;
	default StackExpirationPolicy = EGameplayEffectStackingExpirationPolicy::RemoveSingleStackAndRefreshDuration;

	
	default TargetTagRequirements.ApplicationTagRequirements.IgnoreTags.AddTag(GameplayTag::Debuff_Cooldown_Freeze);

	//Effect to apply when current stack >= StackLimitCount
	default OverflowEffects.Add(UGE_FreezeHitsStack_Overflow::StaticClass());
}

class UGE_FreezeHitsStack_Overflow : UScriptGameplayEffect
{
	//Duration of the effect
	default DurationPolicy = EGameplayEffectDurationType::Instant;
	//default DurationMagnitude.ScalableFloatMagnitude.Value = 15; //Duration in seconds of the effect
	//default DurationMagnitude.MagnitudeCalculationType = EGameplayEffectMagnitudeCalculation::ScalableFloat;

	// Stack config for effect
	default StackLimitCount = 1;
	default StackingType = EGameplayEffectStackingType::AggregateByTarget;

	default TagsToRemoveOther.AddTag(GameplayTag::Debuff_Freeze);
	default TagsToRemoveOther.AddTag(GameplayTag::Debuff_Stack_Ice);
	default TagsToRemoveOther.AddTag(GameplayTag::Debuff_Stack_Freeze_Hits);
    default RemoveOtherTags();
	//default bSuppressStackingCues = true;
}



// class UGE_UnFreeze : UScriptGameplayEffect
// {
// 	default DurationPolicy = EGameplayEffectDurationType::HasDuration;
// 	default DurationMagnitude.ScalableFloatMagnitude.Value = 2; // Freeze inmunity
	
// 	default DurationMagnitude.MagnitudeCalculationType = EGameplayEffectMagnitudeCalculation::ScalableFloat;
// 	default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::Debuff_UnFreeze);

// 	//Tags added to the character
// 	default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Debuff_UnFreeze);
// }

class UGE_Freeze_Cooldown: UScriptGameplayEffect
{
	//Tags of the gameplay effect (This help to get the effect from the ability system)
	default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::Debuff_Cooldown_Freeze);

	default DurationPolicy = EGameplayEffectDurationType::HasDuration;
	default DurationMagnitude.ScalableFloatMagnitude.Value = 5; // Duration in seconds.

	default DurationMagnitude.MagnitudeCalculationType = EGameplayEffectMagnitudeCalculation::ScalableFloat;

	//Tags added to the character
	default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Debuff_Cooldown_Freeze);

	// The effect wont be added if the character already has this tag
	default TargetTagRequirements.ApplicationTagRequirements.IgnoreTags.AddTag(GameplayTag::State_Invulnerable);
	default TargetTagRequirements.ApplicationTagRequirements.IgnoreTags.AddTag(GameplayTag::Debuff_Cooldown_Freeze);
	default TargetTagRequirements.ApplicationTagRequirements.IgnoreTags.AddTag(GameplayTag::State_Defeated);
	default TargetTagRequirements.ApplicationTagRequirements.IgnoreTags.AddTag(GameplayTag::State_Dead);
	
	default TagsToRemoveOther.AddTag(GameplayTag::Debuff_Stack_Ice);
    default RemoveOtherTags();
}

class UGE_Freeze_Cooldown_Initial: UGE_Freeze_Cooldown
{

	default DurationPolicy = EGameplayEffectDurationType::HasDuration;
	default DurationMagnitude.ScalableFloatMagnitude.Value = 1; // Duration in seconds.

	default TagsToRemoveOther = FGameplayTagContainer();
    default RemoveOtherTags();
}
