class UGE_ManaRefill : UScriptGameplayEffect
{
    default DurationPolicy = EGameplayEffectDurationType::Instant;
	default bExecutePeriodicEffectOnApplication = false;

	FGameplayModifierInfo modifier;
	default modifier.ModifierMagnitude.MagnitudeCalculationType = EGameplayEffectMagnitudeCalculation::ScalableFloat;
	default modifier.ModifierMagnitude.ScalableFloatMagnitude.Value = 5.0f;
	default modifier.ModifierOp = EGameplayModOp::Additive;
	default modifier.Attribute = GetAttribute(UAttributeSet_Mana::StaticClass(), n"Mana");
	default Modifiers.Add(modifier);
}