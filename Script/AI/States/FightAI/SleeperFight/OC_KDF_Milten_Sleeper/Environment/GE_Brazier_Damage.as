class UGE_Brazier_Damage : UScriptGameplayEffect
{
	
	// Attribute to modify
	// FGameplayModifierInfo modifier;
	// default modifier.ModifierMagnitude.MagnitudeCalculationType = EGameplayEffectMagnitudeCalculation::ScalableFloat;
	// default modifier.ModifierMagnitude.ScalableFloatMagnitude.Value = -1.0f; // How much damage applies to the attribute
	// default modifier.ModifierOp = EGameplayModOp::Additive;
	// default modifier.Attribute = GetAttribute(UAttributeSet_Health::StaticClass(), n"Health"); // attribute class and name
	// default Modifiers.Add(modifier);


	FGameplayModifierInfo modifier;
	default modifier.ModifierMagnitude.MagnitudeCalculationType = EGameplayEffectMagnitudeCalculation::SetByCaller;
	default modifier.ModifierMagnitude.SetByCallerMagnitude.DataTag = GameplayTag::GE_Param_Heal;
	default modifier.ModifierOp = EGameplayModOp::Additive;
	default modifier.Attribute = GetAttribute(UAttributeSet_Health::StaticClass(), n"Health"); // attribute class and name
	default Modifiers.Add(modifier);

	// Duraction of the effect
	default DurationPolicy = EGameplayEffectDurationType::Instant;
	default DurationMagnitude.MagnitudeCalculationType = EGameplayEffectMagnitudeCalculation::ScalableFloat;


	// Stack config for effect
	default StackLimitCount = 1;
	default StackingType = EGameplayEffectStackingType::AggregateByTarget;
	default bSuppressStackingCues = true;

}