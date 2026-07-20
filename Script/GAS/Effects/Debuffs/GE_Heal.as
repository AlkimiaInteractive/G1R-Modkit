class UGE_Heal : UScriptGameplayEffect
{
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::State_Healing);
	default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::Debuff_Slowdown);

	
	default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::Debuff_Slowdown);

	default TargetTagRequirements.ApplicationTagRequirements.IgnoreTags.AddTag(GameplayTag::State_Invulnerable);
	default TargetTagRequirements.ApplicationTagRequirements.IgnoreTags.AddTag(GameplayTag::State_Healing);
	default TargetTagRequirements.ApplicationTagRequirements.IgnoreTags.AddTag(GameplayTag::Debuff_Blocked_Heal);

	default DurationPolicy = EGameplayEffectDurationType::HasDuration;
	default DurationMagnitude.MagnitudeCalculationType = EGameplayEffectMagnitudeCalculation::ScalableFloat;
	default DurationMagnitude.ScalableFloatMagnitude.Value = 0.f;
	default Period.Value = 0.5f;
	
	// FGameplayEffectExecutionDefinition Def;
	// default Def.CalculationClass = UGE_ExecutionCalculation_Heal::StaticClass();
	// default Executions.Add(Def);

	FGameplayModifierInfo modifier;
	//default modifier.ModifierMagnitude.MagnitudeCalculationType = EGameplayEffectMagnitudeCalculation::ScalableFloat;
	//default modifier.ModifierMagnitude.ScalableFloatMagnitude.Value = 2.0f;
	default modifier.ModifierMagnitude.MagnitudeCalculationType = EGameplayEffectMagnitudeCalculation::SetByCaller;
	default modifier.ModifierMagnitude.SetByCallerMagnitude.DataTag = GameplayTag::GE_Param_Heal;
	default modifier.ModifierOp = EGameplayModOp::Additive;
	default modifier.Attribute = GetAttribute(UAttributeSet_Health::StaticClass(), n"Health");
	default Modifiers.Add(modifier);


	// 	FGameplayModifierInfo modifier;
	// default modifier.ModifierMagnitude.MagnitudeCalculationType = EGameplayEffectMagnitudeCalculation::SetByCaller;
	// default modifier.ModifierMagnitude.SetByCallerMagnitude.DataTag = GameplayTag::GE_Param_Alcohol;
	// default modifier.ModifierOp = EGameplayModOp::Additive;
	// default modifier.Attribute = GetAttribute(UAttributeSet_Alcohol::StaticClass(), n"Alcohol");
	// default Modifiers.Add(modifier);

	//  FGameplayEffectCue cue;
	//  //default cue.GameplayCueTags.AddTag(GameplayTag::GameplayCue_State_Healing);
	//  //default GameplayCues.Add(cue);
	//  default cue.GameplayCueTags.AddTag(GameplayTag::GameplayCue_Debuff_Interrupt_Attack);
	//  default GameplayCues.Add(cue);
}

class UGE_Revive : UScriptGameplayEffect
{
	default DurationPolicy = EGameplayEffectDurationType::Instant;
	
	FGameplayModifierInfo modifier;
	default modifier.ModifierMagnitude.MagnitudeCalculationType = EGameplayEffectMagnitudeCalculation::AttributeBased;
	default modifier.ModifierMagnitude.AttributeBasedMagnitude.BackingAttribute.AttributeToCapture = GetAttribute(UAttributeSet_Health::StaticClass(), n"MaxHealth");
	default modifier.ModifierMagnitude.AttributeBasedMagnitude.BackingAttribute.AttributeSource = EGameplayEffectAttributeCaptureSource::Source;
	default modifier.ModifierOp = EGameplayModOp::Additive;
	default modifier.Attribute = GetAttribute(UAttributeSet_Health::StaticClass(), n"Health");
	default Modifiers.Add(modifier);
}

class UGE_StandUp : UScriptGameplayEffect
{
	default DurationPolicy = EGameplayEffectDurationType::Instant;
	
	FGameplayModifierInfo modifier;
	default modifier.ModifierMagnitude.MagnitudeCalculationType = EGameplayEffectMagnitudeCalculation::AttributeBased;
	default modifier.ModifierMagnitude.AttributeBasedMagnitude.BackingAttribute.AttributeToCapture = GetAttribute(UAttributeSet_Health::StaticClass(), n"MaxHealth");
	default modifier.ModifierMagnitude.AttributeBasedMagnitude.BackingAttribute.AttributeSource = EGameplayEffectAttributeCaptureSource::Source;
	default modifier.ModifierMagnitude.AttributeBasedMagnitude.Coefficient.Value = 0.2f;
	default modifier.ModifierOp = EGameplayModOp::Additive;
	default modifier.Attribute = GetAttribute(UAttributeSet_Health::StaticClass(), n"Health");
	default Modifiers.Add(modifier);
}