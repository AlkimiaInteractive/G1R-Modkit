UCLASS()
class AUnconsciousDebuffEffectActor : ADebuffEffectActorByTag
{
    default m_VisualGameplayEffect = UGE_UnconsciousDebuffVisualEffect::StaticClass();
    default m_DebuffEffectGameplayAbility = UGA_UnconsciousDebuffEffectGameplayAbility::StaticClass();
} 
