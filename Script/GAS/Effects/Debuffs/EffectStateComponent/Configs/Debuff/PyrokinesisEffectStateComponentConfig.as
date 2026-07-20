UCLASS()
class UPyrokinesisEffectStateComponentConfig : UDebuffEffectComponentConfig
{
    default m_EffectComponent = UPyrokinesisDebuffEffectComponent::StaticClass();

    default m_EffectActorClass = n"/Script/Engine.Blueprint'/Game/Items/Magic/DebuffEffect/Burn/BP_PyrokinesisDebuffEffectActor.BP_PyrokinesisDebuffEffectActor_C'";
}


