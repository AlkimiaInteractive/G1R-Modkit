UCLASS()
class UFloatingTransformScrollClassSelectorConfig : UFloatingItemClassSelectorConfig
{
    default m_ItemType = GameplayTag::Item_Weapon_Scroll_Transform;
    default m_EffectActorClassPtr = n"/Script/Engine.Blueprint'/Game/Items/Magic/Components/FloatingItem/BP_FloatingTransformScroll_Actor.BP_FloatingTransformScroll_Actor_C'";
}
