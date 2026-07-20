UCLASS()
class ASleepDebuffEffectActor : ADebuffEffectActorByTag
{
    default m_VisualGameplayEffect = UGE_SleepDebuffVisualEffect::StaticClass();
    default m_DebuffEffectGameplayAbility = UGA_SleepDebuffEffectGameplayAbility::StaticClass();
} 
