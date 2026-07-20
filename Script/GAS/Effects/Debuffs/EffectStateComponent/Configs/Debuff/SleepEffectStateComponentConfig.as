UCLASS()
class USleepEffectStateComponentConfig : UDebuffEffectComponentConfig
{
    default m_EffectComponent = USleepDebuffEffectComponent::StaticClass();

    default m_EffectActorClass = n"/Script/Engine.Blueprint'/Game/Items/Magic/DebuffEffect/Sleep/BP_SleepDebuffEffectActor.BP_SleepDebuffEffectActor_C'";
}