UCLASS()
class UElectrifiedEffectStateComponentConfig : UDebuffEffectComponentConfig
{
    default m_EffectComponent = UElectrifiedDebuffEffectComponent::StaticClass();

    default m_EffectActorClass = n"/Script/Engine.Blueprint'/Game/Items/Magic/DebuffEffect/Electrified/BP_ElectrifiedDebuffEffectActor.BP_ElectrifiedDebuffEffectActor_C'";
}
