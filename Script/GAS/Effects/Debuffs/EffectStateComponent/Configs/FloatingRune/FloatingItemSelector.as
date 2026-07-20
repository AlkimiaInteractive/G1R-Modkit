
UCLASS()
class UFloatingItemSelector_AS : UFloatingItemSelector
{
    default m_ItemEffectActorClassPtr.Add(UFloatingRuneClassSelectorConfig::StaticClass());
    default m_ItemEffectActorClassPtr.Add(UFloatingScrollClassSelectorConfig::StaticClass());
    default m_ItemEffectActorClassPtr.Add(UFloatingTransformScrollClassSelectorConfig::StaticClass());
    default m_ItemEffectActorClassPtr.Add(UFloatingSummonScrollClassSelectorConfig::StaticClass());
}
