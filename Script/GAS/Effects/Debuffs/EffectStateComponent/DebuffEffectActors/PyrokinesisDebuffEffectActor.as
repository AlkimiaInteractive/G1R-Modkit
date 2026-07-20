UCLASS()
class APyrokinesisDebuffEffectActor : ADebuffEffectActorByTag
{
    default m_VisualGameplayEffect = UGE_PyrokinesisDebuffVisualEffect::StaticClass();
    default m_DebuffEffectGameplayAbility = UGA_PyrokinesisDebuffEffectGameplayAbility::StaticClass();
} 
