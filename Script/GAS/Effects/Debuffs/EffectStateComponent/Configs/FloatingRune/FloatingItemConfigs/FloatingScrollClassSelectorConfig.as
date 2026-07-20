UCLASS()
class UFloatingScrollClassSelectorConfig : UFloatingItemClassSelectorConfig
{
    default m_ItemType = GameplayTag::Item_Weapon_Scroll;
    default m_EffectActorClassPtr = n"/Script/Engine.Blueprint'/Game/Items/Magic/Components/FloatingItem/BP_FloatingScroll_Actor.BP_FloatingScroll_Actor_C'";
}

