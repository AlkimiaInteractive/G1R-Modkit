UCLASS()
class UAlcoholEffectStateComponentConfig : UDebuffEffectComponentConfig
{
    default m_EffectComponent = UAlcoholDebuffEffectComponent::StaticClass();

    default m_EffectActorClass = n"/Script/Engine.Blueprint'/Game/Items/Magic/DebuffEffect/Drugs/Alcohol/BP_AlcoholDebuffEffectActor.BP_AlcoholDebuffEffectActor_C'";
}


