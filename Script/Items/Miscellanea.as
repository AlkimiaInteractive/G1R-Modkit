
UCLASS()
class UWeakFishingRod : UFishingRodDefinition
{
    default m_Name = "WeakFishingRod";
	default SetItemType(GameplayTag::Item_Weapon_FishingRod);
	default m_ItemVisual = n"Blueprint'/Game/Items/Fishing/BP_RodVisual.BP_RodVisual_C'";
	// default m_ItemVisualWorld = n"";
	default m_OnEquipEffect = UGE_FishingRod_Equip::StaticClass();
    default m_MaxStack = 999;
    default m_MaxResistance = 100.f;
    default m_LowResistanceThreshold = 50.f;
    default m_NearlyBrokenResistanceThreshold = 20.f;
    default m_PowerDistance = 500.f;
    default m_Widget = n"WidgetBlueprint'/Game/UI/Fishing/FishingWidget.FishingWidget_C'";
}
