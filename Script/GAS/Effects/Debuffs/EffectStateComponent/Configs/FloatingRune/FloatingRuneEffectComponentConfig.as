UCLASS()
class UFloatingSpellItemEffectComponentConfig : UFloatingItemEffectComponentConfig
{
    default m_EffectComponent = UFloatingItemEffectComponent_AS::StaticClass();
    default m_EffectActorClass = UFloatingItemSelector_AS::StaticClass();
}






