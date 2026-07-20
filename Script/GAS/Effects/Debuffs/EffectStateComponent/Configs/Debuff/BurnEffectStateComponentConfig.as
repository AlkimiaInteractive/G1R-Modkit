UCLASS()
class UBurnEffectStateComponentConfig : UDebuffEffectComponentConfig
{
    default m_EffectComponent = UBurnDebuffEffectComponent::StaticClass();

    default m_EffectActorClass = n"/Script/Engine.Blueprint'/Game/Items/Magic/DebuffEffect/Burn/BP_BurnDebuffEffectActor.BP_BurnDebuffEffectActor_C'";
}


