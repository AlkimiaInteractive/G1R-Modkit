UCLASS()
class AParalyzeDebuffEffectActor : AParalyzeEffectActor
{
    default m_VisualGameplayEffect = UGE_ParalyzeDebuffVisualEffect::StaticClass();
    default m_DebuffEffectGameplayAbility = UGA_ParalyzeDebuffEffectGameplayAbility::StaticClass();
} 
