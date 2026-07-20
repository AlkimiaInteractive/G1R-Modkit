UCLASS()
class UFloatingRuneClassSelectorConfig : UFloatingItemClassSelectorConfig
{
   default m_ItemType = GameplayTag::Item_Weapon_Rune;
   default m_EffectActorClassPtr = n"/Script/Engine.Blueprint'/Game/Items/Magic/Components/FloatingItem/BP_FloatingRune_Actor.BP_FloatingRune_Actor_C'";
}