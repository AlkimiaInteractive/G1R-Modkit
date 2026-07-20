UCLASS()
class UUnconsciousComponentConfig : UDebuffEffectComponentConfig
{
    default m_EffectComponent = UUnconsciousDebuffEffectComponent::StaticClass();

    default m_EffectActorClass = n"/Script/Engine.Blueprint'/Game/Items/Magic/DebuffEffect/Unconscious/BP_UnconsciousDebuffEffectActor.BP_UnconsciousDebuffEffectActor_C'";
}

