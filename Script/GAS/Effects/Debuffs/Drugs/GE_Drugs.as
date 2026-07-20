class UGE_DrugDepletionBase : UScriptGameplayEffect
{
	default DurationPolicy = EGameplayEffectDurationType::Infinite;
	//@DE - Use as a timer delay on application when the ability starts.
    default Period.Value = 1.0f;

    // The effect won be added if the character already has this tag
	default TargetTagRequirements.ApplicationTagRequirements.IgnoreTags.AddTag(GameplayTag::State_Drugs_Forced);
}
