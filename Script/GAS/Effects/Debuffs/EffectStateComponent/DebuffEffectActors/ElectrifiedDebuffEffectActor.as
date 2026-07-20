UCLASS()
class AElectrifiedDebuffEffectActor : ADebuffEffectActorByTag
{
    default m_VisualGameplayEffect = UGE_ElectrifiedDebuffVisualEffect::StaticClass();
    default m_DebuffEffectGameplayAbility = UGA_ElectrifiedDebuffEffectGameplayAbility::StaticClass();
} 
