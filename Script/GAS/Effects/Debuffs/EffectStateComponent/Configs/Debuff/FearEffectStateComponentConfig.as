UCLASS()
class UFearEffectStateComponentConfig : UDebuffEffectComponentConfig
{
    default m_EffectComponent = UFearDebuffEffectComponent::StaticClass();

    default m_EffectActorClass = n"/Script/Engine.Blueprint'/Game/Items/Magic/DebuffEffect/Fear/BP_FearDebuffEffectActor.BP_FearDebuffEffectActor_C'";
}