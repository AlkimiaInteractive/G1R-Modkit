class UGE_DebuffEffectVisual: UScriptGameplayEffect
{
	default DurationPolicy = EGameplayEffectDurationType::HasDuration;
	default DurationMagnitude.ScalableFloatMagnitude.Value = 0; // Duration in seconds of each stack
	default DurationMagnitude.MagnitudeCalculationType = EGameplayEffectMagnitudeCalculation::ScalableFloat;

	// Stack config for effect
	default StackLimitCount = 1;
	default StackingType = EGameplayEffectStackingType::AggregateByTarget;
	default StackExpirationPolicy = EGameplayEffectStackingExpirationPolicy::RemoveSingleStackAndRefreshDuration;

    // The effect wont be added if the character already has this tag
	default TargetTagRequirements.ApplicationTagRequirements.IgnoreTags.AddTag(GameplayTag::State_Invulnerable);
}
