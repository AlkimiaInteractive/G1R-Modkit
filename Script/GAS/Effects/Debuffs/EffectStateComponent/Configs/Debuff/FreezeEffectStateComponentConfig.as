UCLASS()
class UFreezeEffectStateComponentConfig : UDebuffEffectComponentConfig
{
    default m_EffectComponent = UFreezeDebuffEffectComponent::StaticClass();

    default m_EffectActorClass = n"/Script/Engine.Blueprint'/Game/Items/Magic/DebuffEffect/Freeze/BP_FreezeDebuffEffectActor.BP_FreezeDebuffEffectActor_C'";
}

