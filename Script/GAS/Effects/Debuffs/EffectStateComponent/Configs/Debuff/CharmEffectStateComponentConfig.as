UCLASS()
class UCharmEffectStateComponentConfig : UDebuffEffectComponentConfig
{
    default m_EffectComponent = UCharmDebuffEffectComponent::StaticClass();

    default m_EffectActorClass = n"/Script/Engine.Blueprint'/Game/Items/Magic/DebuffEffect/Charm/BP_CharmDebuffEffectActor.BP_CharmDebuffEffectActor_C'";
}