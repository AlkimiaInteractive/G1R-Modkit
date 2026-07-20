UCLASS()
class AFearDebuffEffectActor : ADebuffEffectActorByTag
{
    default m_VisualGameplayEffect = UGE_FearDebuffVisualEffect::StaticClass();
    default m_DebuffEffectGameplayAbility = UGA_FearDebuffEffectGameplayAbility::StaticClass();
} 
