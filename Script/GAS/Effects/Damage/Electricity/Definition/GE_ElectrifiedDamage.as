class UGE_Damage_Electrified : UGE_Damage
{
	// The effect wont be added if the character already has this tag
	//default TargetTagRequirements.ApplicationTagRequirements.IgnoreTags.AddTag(GameplayTag::State_Defeated);
	//@DE - This attack should not apply the default elemental stack FElementalEffectStackData(UGE_FreezeHitsStack::StaticClass()));
	default m_ElementalEffectStacks.Empty();
}

class UGE_Damage_Electrified_Infinite : UGE_Damage_Electrified
{
	default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::Debuff_Electrified_Damage_Infinite_Period);
	//default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::Debuff_Electrified);

	default TargetTagRequirements.ApplicationTagRequirements.IgnoreTags.AddTag(GameplayTag::State_Dead);

	default DurationPolicy = EGameplayEffectDurationType::Infinite;
	default Period.Value = 0.5f;

	// Stack config for effect
	default StackLimitCount = 1;
	default StackingType = EGameplayEffectStackingType::AggregateByTarget;
	default bSuppressStackingCues = true;
}

//Removal infinite electrified gameplay effect.
class UGE_Damage_Electrified_Infinite_Removal : UScriptGameplayEffect
{
	default DurationPolicy = EGameplayEffectDurationType::Instant;
	default TagsToRemoveOther.AddTag(GameplayTag::Debuff_Electrified_Damage_Infinite_Period);
	default RemoveOtherTags();
}

//@DE - This version is created for electrified areas that doesnt remove the effect with the altered state table
class UGE_Damage_Area_Electrified_Infinite : UGE_Damage_Electrified
{
	default AssetTagsComponent.InheritableAssetTags.RemoveTag(GameplayTag::Debuff_Electrified_Damage_Infinite_Period);
	default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::Debuff_Area_Electrified_Damage_Infinite_Period);
	//default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::Debuff_Electrified);

	default TargetTagRequirements.ApplicationTagRequirements.IgnoreTags.AddTag(GameplayTag::State_Dead);

	default DurationPolicy = EGameplayEffectDurationType::Infinite;
	default Period.Value = 0.5f;

	// Stack config for effect
	default StackLimitCount = 1;
	default StackingType = EGameplayEffectStackingType::AggregateByTarget;
	default bSuppressStackingCues = true;
}

//Removal UGE_Damage_Area_Electrified_Infinite gameplay effect.
class UGE_Damage_Area_Electrified_Infinite_Removal : UScriptGameplayEffect
{
	default DurationPolicy = EGameplayEffectDurationType::Instant;
	default TagsToRemoveOther.AddTag(GameplayTag::Debuff_Area_Electrified_Damage_Infinite_Period);
	default RemoveOtherTags();
}



//ScriptGameplayEffect version for BallLightning
class UGE_Electrified : UGE_ElementalDebuffBase
{
	//Tags of the gameplay effect (This help to get the effect from the ability system)
	default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::Debuff_Electrified);

	default DurationPolicy = EGameplayEffectDurationType::HasDuration;
	default DurationMagnitude.ScalableFloatMagnitude.Value = .0f; // Duration in seconds of the effect ( 0 = infinite )
	default DurationMagnitude.MagnitudeCalculationType = EGameplayEffectMagnitudeCalculation::ScalableFloat;

	//Tags added to the character // This will add additional effects. Like electric sparks
	default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Debuff_Electrified);
	default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Debuff_Blocked_Sleep);

	// The effect wont be added if the character already has this tag
	default TargetTagRequirements.ApplicationTagRequirements.IgnoreTags.AddTag(GameplayTag::State_Invulnerable);
	default TargetTagRequirements.ApplicationTagRequirements.IgnoreTags.AddTag(GameplayTag::State_Defeated);
	default TargetTagRequirements.ApplicationTagRequirements.IgnoreTags.AddTag(GameplayTag::State_Cant_Electrified);
	
	//Visual effect
	FGameplayEffectCue cue;
	default cue.GameplayCueTags.AddTag(GameplayTag::GameplayCue_Debuff_Interrupt_Attack);
	default GameplayCues.Add(cue);

	// Stack config for effect
	// default StackLimitCount = 1;
	// default StackingType = EGameplayEffectStackingType::AggregateByTarget;
	// default bSuppressStackingCues = true;

	default TagsToRemoveOther.AddTag(GameplayTag::Debuff_Freeze);
	default TagsToRemoveOther.AddTag(GameplayTag::Debuff_Stack_Ice);
	default TagsToRemoveOther.AddTag(GameplayTag::Debuff_Sleep);
	default TagsToRemoveOther.AddTag(GameplayTag::State_Controlling);
	default TagsToRemoveOther.AddTag(GameplayTag::Debuff_Stack_Freeze_Hits);
    default RemoveOtherTags();
}

//UGE_Damage version for ChainLightning
// This effect will active the visuals and give the electrified damage if is successfully activated
// UGE_Electrified_Infinite and UGE_Damage_Electrified_Infinite has same duration. They were splited on 5.4 due periodic UGE cant has TagsToRemoveOther effect component.
class UGE_Electrified_Infinite : UGE_Electrified
{
	//Tags of the gameplay effect (This help to get the effect from the ability system)
	default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::Debuff_Electrified_Damage_Infinite);

	default DurationPolicy = EGameplayEffectDurationType::Infinite;

	FConditionalGameplayEffect conditionalDamage;
	default conditionalDamage.EffectClass = UGE_Damage_Electrified_Infinite::StaticClass(); 
	default AdditionalEffects.OnApplicationGameplayEffects.Add(conditionalDamage);

	default AdditionalEffects.OnCompleteAlways.Add(UGE_Damage_Electrified_Infinite_Removal::StaticClass()); 
}

//UGE_Damage version for Areas that dont remove electrified state using altered state table logic
// This effect will active the visuals and give the electrified damage if is successfully activated
// UGE_Electrified_Infinite and UGE_Damage_Electrified_Infinite has same duration. They were splited on 5.4 due periodic UGE cant has TagsToRemoveOther effect component.
class UGE_Area_Electrified_Infinite : UGE_Electrified_Infinite
{
	//Tags of the gameplay effect (This help to get the effect from the ability system)
	default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::Debuff_Electrified_Damage_Infinite);

	default DurationPolicy = EGameplayEffectDurationType::Infinite;

	default AdditionalEffects.OnApplicationGameplayEffects.Empty();
	default AdditionalEffects.OnCompleteAlways.Empty();

	FConditionalGameplayEffect conditionalAreaDamage;
	default conditionalAreaDamage.EffectClass = UGE_Damage_Area_Electrified_Infinite::StaticClass(); 
	default AdditionalEffects.OnApplicationGameplayEffects.Add(conditionalAreaDamage);

	default AdditionalEffects.OnCompleteAlways.Add(UGE_Damage_Area_Electrified_Infinite_Removal::StaticClass()); 
}


//UGE_Damage version for Chainlightning
class UGE_Electrified_Paralyze_Infinite : UGE_Electrified_Infinite
{
	//Tags of the gameplay effect (This help to get the effect from the ability system)
	//default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::Debuff_Paralyzed);
	//Tags added to the character// This will add additional effects. Like paralyze

	//default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Debuff_Paralyzed);
	FConditionalGameplayEffect conditionalParalyzeGE;
	default conditionalParalyzeGE.EffectClass = UGE_Electrified_Paralyze::StaticClass(); 
	default AdditionalEffects.OnApplicationGameplayEffects.Add(conditionalParalyzeGE);

	default AdditionalEffects.OnCompleteAlways.Add(UGE_Electrified_Paralyze_Removal::StaticClass());
}

//Removal UGE_Damage_Area_Electrified_Infinite gameplay effect.
class UGE_Electrified_Paralyze_Removal : UScriptGameplayEffect
{
	default DurationPolicy = EGameplayEffectDurationType::Instant;
	default TagsToRemoveOther.AddTag(GameplayTag::Debuff_Removal_Paralyze_Electrified_Infinite);
	default RemoveOtherTags();
}

class UGE_Electrified_Paralyze : UGE_Paralyze_Base
{
	default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::Debuff_Removal_Paralyze_Electrified_Infinite);
}

//ScriptGameplayEffect version for BallLightning
class UGE_Electrified_Impact : UGE_Electrified
{
	//Tags of the gameplay effect (This help to get the effect from the ability system)
	default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::Debuff_Electrified_Impact);
	default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::GE_Persistent);

	//Tags added to the character //Right now there is a cooldown while the effect is active
	default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Debuff_Electrified_Impact);

	default TargetTagRequirements.ApplicationTagRequirements.IgnoreTags.AddTag(GameplayTag::Debuff_Cooldown_Electrified_Impact);
	default TargetTagRequirements.ApplicationTagRequirements.IgnoreTags.AddTag(GameplayTag::Debuff_Electrified_Impact);

	//Stack config for effect
	default StackLimitCount = 1;
	default StackingType = EGameplayEffectStackingType::AggregateByTarget;
	default bSuppressStackingCues = true;
}

//ScriptGameplayEffect version for BallLightning
class UGE_Electrified_Impact_Paralyze : UGE_Electrified_Impact
{
	//Tags of the gameplay effect (This help to get the effect from the ability system)
	//default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::Debuff_Paralyzed);
	//Tags added to the character// This will add additional effects. Like paralyze
	
	//default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Debuff_Paralyzed);
	
	FConditionalGameplayEffect conditionalParalyzeGE;
	default conditionalParalyzeGE.EffectClass = UGE_Electrified_Impact_Paralyze_Debuff::StaticClass(); 
	default AdditionalEffects.OnApplicationGameplayEffects.Add(conditionalParalyzeGE);

	default AdditionalEffects.OnCompleteAlways.Add(UGE_Electrified_Impact_Paralyze_Removal::StaticClass());
}

//Removal UGE_Damage_Area_Electrified_Infinite gameplay effect.
class UGE_Electrified_Impact_Paralyze_Removal : UScriptGameplayEffect
{
	default DurationPolicy = EGameplayEffectDurationType::Instant;
	default TagsToRemoveOther.AddTag(GameplayTag::Debuff_Removal_Paralyze_Electrified_Impact);
	default RemoveOtherTags();
}

class UGE_Electrified_Impact_Paralyze_Debuff : UGE_Paralyze_Base
{
	default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::Debuff_Removal_Paralyze_Electrified_Impact); 
}

// class UGE_Electrified_Cooldown: UScriptGameplayEffect
// {
// 	//Tags of the gameplay effect (This help to get the effect from the ability system)
// 	default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::Debuff_Cooldown_Electrified);

// 	default DurationPolicy = EGameplayEffectDurationType::HasDuration;
// 	default DurationMagnitude.ScalableFloatMagnitude.Value = 2; // Duration in seconds.

// 	default DurationMagnitude.MagnitudeCalculationType = EGameplayEffectMagnitudeCalculation::ScalableFloat;

// 	//Tags added to the character
// 	default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Debuff_Cooldown_Electrified);

// 	// The effect wont be added if the character already has this tag
// 	default TargetTagRequirements.ApplicationTagRequirements.IgnoreTags.AddTag(GameplayTag::State_Invulnerable);
// 	default TargetTagRequirements.ApplicationTagRequirements.IgnoreTags.AddTag(GameplayTag::Debuff_Cooldown_Electrified);

// 	default TagsToRemoveOther.AddTag(GameplayTag::Debuff_Electrified);
//     default RemoveOtherTags();
// }


class UGE_Electrified_Impact_Cooldown: UScriptGameplayEffect
{
	//Tags of the gameplay effect (This help to get the effect from the ability system)
	default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::Debuff_Cooldown_Electrified_Impact);

	default DurationPolicy = EGameplayEffectDurationType::HasDuration;
	default DurationMagnitude.ScalableFloatMagnitude.Value = 3; // Duration in seconds.

	default DurationMagnitude.MagnitudeCalculationType = EGameplayEffectMagnitudeCalculation::ScalableFloat;

	//Tags added to the character
	default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Debuff_Cooldown_Electrified_Impact);

	// The effect wont be added if the character already has this tag
	default TargetTagRequirements.ApplicationTagRequirements.IgnoreTags.AddTag(GameplayTag::State_Invulnerable);
	default TargetTagRequirements.ApplicationTagRequirements.IgnoreTags.AddTag(GameplayTag::Debuff_Cooldown_Electrified_Impact);
	default TargetTagRequirements.ApplicationTagRequirements.IgnoreTags.AddTag(GameplayTag::State_Defeated);
	default TargetTagRequirements.ApplicationTagRequirements.IgnoreTags.AddTag(GameplayTag::State_Dead);
}
