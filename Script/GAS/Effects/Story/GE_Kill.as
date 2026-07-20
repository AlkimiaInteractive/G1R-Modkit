
// class UGE_Kill : UScriptGameplayEffect
// {
//     default DurationPolicy = EGameplayEffectDurationType::Instant;

//     default SetAttribute(UAttributeSet_Health::StaticClass(), n"Health", 0.0f);
// }

// mixin FGameplayEffectSpecHandle GE_Kill(UAbilitySystemComponent ASC)
// {
//     //return ASC.MakeOutgoingSpec(UGE_Kill::StaticClass(), 0.0f, ASC.MakeEffectContext());
// }

mixin FGameplayEffectSpecHandle GE_Kill(UAbilitySystemComponent ASC)
{
    return ASC.MakeOutgoingSpec(UGameplayEffect_KillCharacter::StaticClass(), 0.0f, ASC.MakeEffectContext());
}