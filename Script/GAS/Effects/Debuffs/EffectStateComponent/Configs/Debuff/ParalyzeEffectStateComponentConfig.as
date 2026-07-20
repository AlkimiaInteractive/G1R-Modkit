UCLASS()
class UParalyzeComponentConfig : UDebuffEffectComponentConfig
{
    default m_EffectComponent = UParalyzeDebuffEffectComponent::StaticClass();

    default m_EffectActorClass = n"/Script/Engine.Blueprint'/Game/Items/Magic/DebuffEffect/Paralyze/BP_ParalyzeDebuffEffectActor.BP_ParalyzeDebuffEffectActor_C'";
}

