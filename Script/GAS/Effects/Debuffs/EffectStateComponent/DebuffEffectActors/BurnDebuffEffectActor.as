UCLASS()
class ABurnDebuffEffectActor : ADebuffEffectActorByTag
{
    default m_VisualGameplayEffect = UGE_BurnDebuffVisualEffect::StaticClass();
    default m_DebuffEffectGameplayAbility = UGA_BurnDebuffEffectGameplayAbility::StaticClass();
} 
