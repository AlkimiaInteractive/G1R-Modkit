UCLASS()
class ACharmDebuffEffectActor : ADebuffEffectActorByTag
{
    default m_VisualGameplayEffect = UGE_CharmDebuffVisualEffect::StaticClass();
    default m_DebuffEffectGameplayAbility = UGA_CharmDebuffEffectGameplayAbility::StaticClass();
} 
