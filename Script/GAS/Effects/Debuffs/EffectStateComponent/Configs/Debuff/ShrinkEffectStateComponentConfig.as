UCLASS()
class UShrinkEffectStateComponentConfig : UDebuffEffectComponentConfig
{
    default m_EffectComponent = UShrinkDebuffEffectComponent::StaticClass();

    default m_EffectActorClass = n"/Script/Engine.Blueprint'/Game/Items/Magic/DebuffEffect/Shrink/BP_ShrinkDebuffEffectActor.BP_ShrinkDebuffEffectActor_C'";
}