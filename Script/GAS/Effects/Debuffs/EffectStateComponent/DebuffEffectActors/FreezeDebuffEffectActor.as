UCLASS()
class AFreezeDebuffEffectActor_AS : AFreezeDebuffEffectActor
{
    default m_VisualGameplayEffect = UGE_FreezeDebuffVisualEffect::StaticClass();
    default m_DebuffEffectGameplayAbility = UGA_FreezeDebuffEffectGameplayAbility::StaticClass();
} 
