UCLASS()
class UGA_RecoverSleepTime : UGameplayAbilityRecoverSleepTime
{
    default m_HourlyEffectClass = UGE_SleepTimeRecovery::StaticClass();
	default m_HourlyEffectPeriodInHoursAttribute = UAngelscriptAttributeSet::GetGameplayAttribute(UAttributeSet_Sleep::StaticClass(), n"SleepTimeRecoveryPeriod");
}

// Sleep time recovery amount for one sleep time recovery "tick" (immediate effect)
class UGE_SleepTimeRecovery : UScriptGameplayEffect
{
	default DurationPolicy = EGameplayEffectDurationType::Instant;
	
	FGameplayModifierInfo modifier;
	default modifier.ModifierMagnitude.MagnitudeCalculationType = EGameplayEffectMagnitudeCalculation::AttributeBased;
	default modifier.ModifierMagnitude.AttributeBasedMagnitude.BackingAttribute.AttributeToCapture = GetAttribute(UAttributeSet_Sleep::StaticClass(), n"SleepTimeRecoveryAmount");
	default modifier.ModifierMagnitude.AttributeBasedMagnitude.BackingAttribute.AttributeSource = EGameplayEffectAttributeCaptureSource::Source;
	default modifier.ModifierMagnitude.AttributeBasedMagnitude.Coefficient.Value = 1.0f;
	default modifier.ModifierOp = EGameplayModOp::Additive;
	default modifier.Attribute = GetAttribute(UAttributeSet_Sleep::StaticClass(), n"SleepTime");
	default Modifiers.Add(modifier);
}