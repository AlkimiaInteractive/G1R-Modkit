UCLASS()
class UMatOre: UMaterialDefinition
{
	default m_Name = "Ore";
	default m_Value = 1;
	default m_Icon = "Apfel2DIcon";
	default m_ItemVisual = n"Blueprint'/Game/Items/Material/BP_ItMi_Orenugget_Visual.BP_ItMi_Orenugget_Visual_C'";
	default m_ItemVisualWorld = n"Blueprint'/Game/Items/Material/BP_ItMi_Orenugget_World.BP_ItMi_Orenugget_World_C'";
	default m_Description = "ApfelDesc";
	default m_MaxStack = 9999999;
    default SetItemType(GameplayTag::Item_Ore);
};
