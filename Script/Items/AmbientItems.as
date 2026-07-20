
UCLASS()
class UEquipData_Human_AmbientItems : UEquipData
{
    default m_SocketName = n"weapon_rSocket";
}

UCLASS()
class UInteractiveHeavyItem : UDefaultInteractive
{
    default m_DefaultInteraction = GameplayTag::Action_Pick_ToCarry;
    default m_UsableByPlayer = false;
}

UCLASS()
class UItAI_Orebag: UItemDefinition
{
    default m_Name = "Orebag";
    default m_ItemVisual = n"Blueprint'/Game/Items/Ambient/BP_ItAI_Orebag.BP_ItAI_Orebag_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Ambient/BP_ItAI_Orebag_World.BP_ItAI_Orebag_World_C'";
    default m_Value = 0;
    default m_MaxStack = 1;

    default SetItemType(GameplayTag::Item_Ambient_Bag_Heavy);
    default AddItemSpec(GameplayTag::Item_Property_Weight_Heavy);
    default AddItemSpec(GameplayTag::Item_Property_Equipable);

    default AddItemSpec(GameplayTag::Item_Property_EquipOnPick);
    default AddItemSpec(GameplayTag::Item_Property_Ambient);
    default AddItemSpec(GameplayTag::Item_Property_NonLoot);
    default AddItemSpec(GameplayTag::UI_Filter_Inventory_Hidden); 
}

UCLASS()
class UItAI_Foodbag: UItemDefinition
{
    default m_Name = "Foodbag";
    default m_ItemVisual = n"Blueprint'/Game/Items/Ambient/BP_ItAI_Foodbag.BP_ItAI_Foodbag_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Ambient/BP_ItAI_Foodbag_World.BP_ItAI_Foodbag_World_C'";
    default m_Value = 0;
    default m_MaxStack = 1;


    default SetItemType(GameplayTag::Item_Ambient_Sack);
    default AddItemSpec(GameplayTag::Item_Property_Weight_Heavy);
    default AddItemSpec(GameplayTag::Item_Property_Equipable);
    default AddItemSpec(GameplayTag::Item_Property_EquipOnPick);
    default AddItemSpec(GameplayTag::Item_Property_Ambient);
    default AddItemSpec(GameplayTag::Item_Property_NonLoot);
    default AddItemSpec(GameplayTag::UI_Filter_Inventory_Hidden); 
}

UCLASS()
class UItAI_Plank: UItemDefinition
{
    default m_Name = "Plank";
    default m_ItemVisual = n"Blueprint'/Game/Items/Ambient/BP_ItAI_Plank.BP_ItAI_Plank_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Ambient/BP_ItAI_Plank_World.BP_ItAI_Plank_World_C'";
    default m_Value = 0;
    default m_MaxStack = 1;

    default SetItemType(GameplayTag::Item_Ambient_Plank);
    default AddItemSpec(GameplayTag::Item_Property_Weight_Heavy);
    default AddItemSpec(GameplayTag::Item_Property_Equipable);
    default AddItemSpec(GameplayTag::Item_Property_EquipOnPick);
    default AddItemSpec(GameplayTag::Item_Property_Ambient);
    default AddItemSpec(GameplayTag::Item_Property_NonLoot);
    default AddItemSpec(GameplayTag::UI_Filter_Inventory_Hidden); 
}

UCLASS()
class UItAI_PlankFromWall: UItAI_Plank
{
    default m_Name = "PlankFromWall";
    default SetItemType(GameplayTag::Item_Ambient_PlankFromWall);
}

UCLASS()
class UItAI_BrushWood: UItemDefinition
{
    default m_Name = "BrushWood";
    default m_ItemVisual = n"Blueprint'/Game/Items/Ambient/BP_ItAI_BrushWood.BP_ItAI_BrushWood_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Ambient/BP_ItAI_BrushWood_World.BP_ItAI_BrushWood_World_C'";
    default m_Value = 0;
    default m_MaxStack = 1;

    default SetItemType(GameplayTag::Item_Ambient_Wood);
    default AddItemSpec(GameplayTag::Item_Property_Weight_Heavy);
    default AddItemSpec(GameplayTag::Item_Property_Equipable);
    default AddItemSpec(GameplayTag::Item_Property_EquipOnPick);
    default AddItemSpec(GameplayTag::Item_Property_Ambient);   
    default AddItemSpec(GameplayTag::Item_Property_NonLoot);  
    default AddItemSpec(GameplayTag::UI_Filter_Inventory_Hidden); 
}

UCLASS()
class UItAI_BrushWoodFromWall: UItAI_BrushWood
{
    default m_Name = "BrushWoodFromWall";
    default SetItemType(GameplayTag::Item_Ambient_WoodFromWall);
}

UCLASS()
class UItAI_Box: UItemDefinition
{
    default m_Name = "Box";
    default m_ItemVisual = n"Blueprint'/Game/Items/Ambient/BP_ItAI_Box.BP_ItAI_Box_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Ambient/BP_ItAI_Box_World.BP_ItAI_Box_World_C'";
    default m_Value = 0;
    default m_MaxStack = 1;

    default SetItemType(GameplayTag::Item_Ambient_Box);
    default AddItemSpec(GameplayTag::Item_Property_Weight_Heavy);
    default AddItemSpec(GameplayTag::Item_Property_Equipable);
    default AddItemSpec(GameplayTag::Item_Property_EquipOnPick);
    default AddItemSpec(GameplayTag::Item_Property_Ambient);
    default AddItemSpec(GameplayTag::Item_Property_NonLoot);  
    default AddItemSpec(GameplayTag::UI_Filter_Inventory_Hidden); 
}

UCLASS()
class UItAI_BoxMidHigh: UItAI_Box
{
    default m_Name = "BoxMidHigh";
    default SetItemType(GameplayTag::Item_Ambient_BoxMidHigh);
}

UCLASS()
class UItemAnimConfig_Human_BagHeavy : UDefault_Human
{
    default m_EquipData = UEquipData_Human_AmbientItems::StaticClass();
}

UCLASS()
class UItemAnimConfig_Human_Box : UDefault_Human
{
    default m_EquipData = UEquipData_Human_AmbientItems::StaticClass();
}

UCLASS()
class UItemAnimConfig_Human_Plank : UDefault_Human
{
    default m_EquipData = UEquipData_Human_AmbientItems::StaticClass();
}