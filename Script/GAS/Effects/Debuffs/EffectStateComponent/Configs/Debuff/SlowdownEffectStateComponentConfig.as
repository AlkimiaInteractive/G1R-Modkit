UCLASS()
class USlowdownEffectStateComponentConfig : UDebuffEffectComponentConfig
{
    default m_EffectComponent = USlowdownDebuffEffectComponent::StaticClass();

    default m_EffectActorClass = n"/Script/Engine.Blueprint'/Game/Items/Magic/DebuffEffect/Slowdown/BP_SlowdownDebuffEffectActor.BP_SlowdownDebuffEffectActor_C'";
}

