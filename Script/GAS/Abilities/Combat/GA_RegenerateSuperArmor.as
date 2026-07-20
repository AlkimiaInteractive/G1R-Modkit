UCLASS()
class UGA_RegenerateSuperArmor : UGameplayAbilityRegenerateSuperArmor
{
    default m_RegenerateArmorEffect = UGE_RegenerateSuperArmor::StaticClass();
}

class UGE_RemoveSuperarmor_TESTING : UScriptGameplayEffect
{


	// Attribute to modify
	FGameplayModifierInfo modifier;
	default modifier.ModifierMagnitude.MagnitudeCalculationType = EGameplayEffectMagnitudeCalculation::ScalableFloat;
	default modifier.ModifierMagnitude.ScalableFloatMagnitude.Value = -15.0f; // How much damage applies to the attribute
	default modifier.ModifierOp = EGameplayModOp::Additive;
	default modifier.Attribute = GetAttribute(UAttributeSet_Armor::StaticClass(), n"SuperArmor"); // attribute class and name
	default Modifiers.Add(modifier);

	// Duraction of the effect
	default DurationPolicy = EGameplayEffectDurationType::HasDuration;
	default DurationMagnitude.ScalableFloatMagnitude.Value = 5; // Duration in seconds of the effect
	default DurationMagnitude.MagnitudeCalculationType = EGameplayEffectMagnitudeCalculation::ScalableFloat;
	default Period.Value = 0.5f;

	
	// Stack config for effect
	default StackLimitCount = 1;
	default StackingType = EGameplayEffectStackingType::AggregateByTarget;
	default bSuppressStackingCues = true;
}
