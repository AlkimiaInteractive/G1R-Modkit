
class UGE_RefuseTalk : UScriptGameplayEffect
{
    default DurationPolicy = EGameplayEffectDurationType::HasDuration;
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::State_RefuseTalk);
    default UseCallerValueAsDuration(GameplayTag::GE_Param_Duration);
}

mixin FGameplayEffectSpecHandle GE_RefuseTalk(UAbilitySystemComponent ASC, AActor RefuseTalkingWith, float DurationSeconds)
{
    auto Effect = ASC.MakeEffectSpecWithParam(UGE_RefuseTalk::StaticClass(), GameplayTag::GE_Param_Duration, DurationSeconds);
 
    auto context = Effect.Spec.Context;
    context.AddInstigator(RefuseTalkingWith, RefuseTalkingWith);

    return Effect;
}