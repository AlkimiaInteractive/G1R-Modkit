UCLASS()
class USwampweedEffectStateComponentConfig : UDebuffEffectComponentConfig
{
    default m_EffectComponent = USwampweedDebuffEffectComponent::StaticClass();

    default m_EffectActorClass = n"/Script/Engine.Blueprint'/Game/Items/Magic/DebuffEffect/Drugs/Swampweed/BP_SwampweedDebuffEffectActor.BP_SwampweedDebuffEffectActor_C'";
}


