UCLASS()
class AShrinkDebuffEffectActor : ADebuffEffectActorByTag
{
    default m_VisualGameplayEffect = UGE_ShrinkDebuffVisualEffect::StaticClass();
    default m_DebuffEffectGameplayAbility = UGA_ShrinkDebuffEffectGameplayAbility::StaticClass();
} 
