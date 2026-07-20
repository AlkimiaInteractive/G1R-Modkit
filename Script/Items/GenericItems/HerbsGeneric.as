UCLASS()
class UItFo_Plants_Berrys_01: UItemDefinition
{
    default m_Name = "ItFo_Plants_Berrys_01";
    default m_ItemVisual = n"Blueprint'/Game/Items/Herb/BP_ItFo_Plants_Berrys_01_Visual.BP_ItFo_Plants_Berrys_01_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Herb/BP_ItFo_Plants_Berrys_01_World.BP_ItFo_Plants_Berrys_01_World_C'";
    default m_ItemEmptyVisual = n"Blueprint'/Game/Items/Herb/BP_ItFo_Plants_Berrys_01_Empty_World.BP_ItFo_Plants_Berrys_01_Empty_World_C'";
    default m_ItemVisualWorldDrop = n"Blueprint'/Game/Items/Herb/BP_ItFo_Plants_Berrys_01_World_Drop.BP_ItFo_Plants_Berrys_01_World_Drop_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItFo_Plants_Berrys_01.T_ItemIcon_ItFo_Plants_Berrys_01";
    default m_Value = 4;
    default m_MaxStack = 99;
    default m_CanBeSpawned = true;
    default m_Weight = 0.1f;
    default SetItemType(GameplayTag::Item_Herb);
    default AddOnConsume(UGE_Item_Heal_Overtime::StaticClass()).AddMag(GameplayTag::GE_Param_Heal, 1.0f).AddMag(GameplayTag::GE_Param_Duration, 4);
    default AddItemSpec(GameplayTag::Item_Property_Consumable);
    default AddItemSpec(GameplayTag::Item_Property_QuickConsumable);
    default AddItemSpec(GameplayTag::Item_Property_Throwable);
    default AddItemSpec(GameplayTag::Item_Property_Size_Small);
    default AddItemSpec(GameplayTag::Item_Property_TraderRegen);
    default AddItemSpec(GameplayTag::Item_Property_DefaultNotOwnable);
    default AddItemSpec(GameplayTag::Food_Fruit);
    default AddPossibleActionAfterDrop(GameplayTag::Action_Eat_Item);
}

UCLASS()
class UItFo_Plants_Bloodwood_01: UItemDefinition
{
    default m_Name = "ItFo_Plants_Bloodwood_01";
    default m_ItemVisual = n"Blueprint'/Game/Items/Herb/BP_ItFo_Plants_Bloodwood_01_Visual.BP_ItFo_Plants_Bloodwood_01_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Herb/BP_ItFo_Plants_Bloodwood_01_World.BP_ItFo_Plants_Bloodwood_01_World_C'";
    default m_ItemEmptyVisual = n"Blueprint'/Game/Items/Herb/BP_ItFo_Plants_Bloodwood_01_Empty_World.BP_ItFo_Plants_Bloodwood_01_Empty_World_C'";
    default m_ItemVisualWorldDrop = n"Blueprint'/Game/Items/Herb/BP_ItFo_Plants_Bloodwood_01_World_Drop.BP_ItFo_Plants_Bloodwood_01_World_Drop_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItFo_Plants_Bloodwood_01.T_ItemIcon_ItFo_Plants_Bloodwood_01";
    default m_Value = 6;
    default m_MaxStack = 99;
    default m_CanBeSpawned = true;
    default m_Weight = 0.1f;
    default SetItemType(GameplayTag::Item_Herb);
    default AddOnConsume(UGE_Item_Mana_Overtime::StaticClass()).AddMag(GameplayTag::GE_Param_Mana, 1.0f).AddMag(GameplayTag::GE_Param_Duration, 4);
    default AddItemSpec(GameplayTag::Item_Property_Consumable);
    default AddItemSpec(GameplayTag::Item_Property_QuickConsumable);
    default AddItemSpec(GameplayTag::Item_Property_Throwable);
    default AddItemSpec(GameplayTag::Item_Property_Size_Small);
    default AddItemSpec(GameplayTag::Item_Property_TraderRegen);
    default AddItemSpec(GameplayTag::Item_Property_DefaultNotOwnable);
}

UCLASS()
class UItFo_Plants_Coral: UItemDefinition
{
    default m_Name = "ItFo_Plants_Coral";
    default m_ItemVisual = n"Blueprint'/Game/Items/Herb/BP_ItFo_Plants_Coral_Visual.BP_ItFo_Plants_Coral_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Herb/BP_ItFo_Plants_Coral_World.BP_ItFo_Plants_Coral_World_C'";
    default m_ItemEmptyVisual = n"Blueprint'/Game/Items/Herb/BP_ItFo_Plants_Coral_Empty_World.BP_ItFo_Plants_Coral_Empty_World_C'";
    default m_ItemVisualWorldDrop = n"Blueprint'/Game/Items/Herb/BP_ItFo_Plants_Coral_World_Drop.BP_ItFo_Plants_Coral_World_Drop_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItFo_Plants_Coral.T_ItemIcon_ItFo_Plants_Coral";
    default m_Value = 25;
    default m_MaxStack = 99;
    default m_CanBeSpawned = true;
    default m_Weight = 0.2f;
    default SetItemType(GameplayTag::Item_Herb);
    default AddOnConsume(UGE_Item_Heal_Overtime::StaticClass()).AddMag(GameplayTag::GE_Param_Heal, 1.0f).AddMag(GameplayTag::GE_Param_Duration, 19);
    default AddOnConsume(UGE_Item_Mana_Overtime::StaticClass()).AddMag(GameplayTag::GE_Param_Mana, 1.0f).AddMag(GameplayTag::GE_Param_Duration, 19);
    default AddItemSpec(GameplayTag::Item_Property_Consumable);
    default AddItemSpec(GameplayTag::Item_Property_Size_Small);
    default AddItemSpec(GameplayTag::Item_Property_TraderRegen);
    default AddItemSpec(GameplayTag::Item_Property_DefaultNotOwnable);
}

UCLASS()
class UItFo_Plants_Darkshade: UItemDefinition
{
    default m_Name = "ItFo_Plants_Darkshade";
    default m_ItemVisual = n"Blueprint'/Game/Items/Herb/BP_ItFo_Plants_Darkshade_Visual.BP_ItFo_Plants_Darkshade_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Herb/BP_ItFo_Plants_Darkshade_World.BP_ItFo_Plants_Darkshade_World_C'";
    default m_ItemEmptyVisual = n"Blueprint'/Game/Items/Herb/BP_ItFo_Plants_Darkshade_Empty_World.BP_ItFo_Plants_Darkshade_Empty_World_C'";
    default m_ItemVisualWorldDrop = n"Blueprint'/Game/Items/Herb/BP_ItFo_Plants_Darkshade_World_Drop.BP_ItFo_Plants_Darkshade_World_Drop_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItFo_Plants_Darkshade.T_ItemIcon_ItFo_Plants_Darkshade";
    default m_Value = 3;
    default m_MaxStack = 99;
    default m_CanBeSpawned = true;
    default m_Weight = 0.1f;
    default SetItemType(GameplayTag::Item_Herb);
    default AddOnConsume(UGE_Item_Heal_Overtime::StaticClass()).AddMag(GameplayTag::GE_Param_Heal, 1.0f).AddMag(GameplayTag::GE_Param_Duration, 9);
    default AddOnConsume(UGE_Item_Mana_Overtime::StaticClass()).AddMag(GameplayTag::GE_Param_Mana, -1.0f).AddMag(GameplayTag::GE_Param_Duration, 9);
    default AddItemSpec(GameplayTag::Item_Property_Consumable);
    default AddItemSpec(GameplayTag::Item_Property_QuickConsumable);
    default AddItemSpec(GameplayTag::Item_Property_Throwable);
    default AddItemSpec(GameplayTag::Item_Property_Size_Small);
    default AddItemSpec(GameplayTag::Item_Property_TraderRegen);
    default AddItemSpec(GameplayTag::Item_Property_DefaultNotOwnable);
}

UCLASS()
class UItFo_Plants_Dewleaf: UItemDefinition
{
    default m_Name = "ItFo_Plants_Dewleaf";
    default m_ItemVisual = n"Blueprint'/Game/Items/Herb/BP_ItFo_Plants_Dewleaf_Visual.BP_ItFo_Plants_Dewleaf_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Herb/BP_ItFo_Plants_Dewleaf_World.BP_ItFo_Plants_Dewleaf_World_C'";
    default m_ItemEmptyVisual = n"Blueprint'/Game/Items/Herb/BP_ItFo_Plants_Dewleaf_Empty_World.BP_ItFo_Plants_Dewleaf_Empty_World_C'";
    default m_ItemVisualWorldDrop = n"Blueprint'/Game/Items/Herb/BP_ItFo_Plants_Dewleaf_World_Drop.BP_ItFo_Plants_Dewleaf_World_Drop_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItFo_Plants_Dewleaf.T_ItemIcon_ItFo_Plants_Dewleaf";
    default m_Value = 9;
    default m_MaxStack = 99;
    default m_CanBeSpawned = true;
    default m_Weight = 0.1f;
    default SetItemType(GameplayTag::Item_Herb);
    default AddOnConsume(UGE_Item_Heal_Overtime::StaticClass()).AddMag(GameplayTag::GE_Param_Heal, 1.0f).AddMag(GameplayTag::GE_Param_Duration, 4);
    default AddOnConsume(UGE_Item_Mana_Overtime::StaticClass()).AddMag(GameplayTag::GE_Param_Mana, 1.0f).AddMag(GameplayTag::GE_Param_Duration, 4);
    default AddItemSpec(GameplayTag::Item_Property_Consumable);
    default AddItemSpec(GameplayTag::Item_Property_QuickConsumable);
    default AddItemSpec(GameplayTag::Item_Property_Throwable);
    default AddItemSpec(GameplayTag::Item_Property_Size_Small);
    default AddItemSpec(GameplayTag::Item_Property_TraderRegen);
    default AddItemSpec(GameplayTag::Item_Property_DefaultNotOwnable);
}

UCLASS()
class UItFo_Plants_Duskbell: UItemDefinition
{
    default m_Name = "ItFo_Plants_Duskbell";
    default m_ItemVisual = n"Blueprint'/Game/Items/Herb/BP_ItFo_Plants_Duskbell_Visual.BP_ItFo_Plants_Duskbell_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Herb/BP_ItFo_Plants_Duskbell_World.BP_ItFo_Plants_Duskbell_World_C'";
    default m_ItemEmptyVisual = n"Blueprint'/Game/Items/Herb/BP_ItFo_Plants_Duskbell_Empty_World.BP_ItFo_Plants_Duskbell_Empty_World_C'";
    default m_ItemVisualWorldDrop = n"Blueprint'/Game/Items/Herb/BP_ItFo_Plants_Duskbell_World_Drop.BP_ItFo_Plants_Duskbell_World_Drop_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItFo_Plants_Duskbell.T_ItemIcon_ItFo_Plants_Duskbell";
    default m_Value = 19;
    default m_MaxStack = 99;
    default m_CanBeSpawned = true;
    default m_Weight = 0.1f;
    default SetItemType(GameplayTag::Item_Herb);
    default AddOnConsume(UGE_Item_Heal_Overtime::StaticClass()).AddMag(GameplayTag::GE_Param_Heal, 1.0f).AddMag(GameplayTag::GE_Param_Duration, 12);
    default AddOnConsume(UGE_Item_Mana_Overtime::StaticClass()).AddMag(GameplayTag::GE_Param_Mana, 1.0f).AddMag(GameplayTag::GE_Param_Duration, 12);
    default AddItemSpec(GameplayTag::Item_Property_Consumable);
    default AddItemSpec(GameplayTag::Item_Property_QuickConsumable);
    default AddItemSpec(GameplayTag::Item_Property_Throwable);
    default AddItemSpec(GameplayTag::Item_Property_Size_Small);
    default AddItemSpec(GameplayTag::Item_Property_TraderRegen);
    default AddItemSpec(GameplayTag::Item_Property_DefaultNotOwnable);
}

UCLASS()
class UItFo_Plants_Flameberry_01: UItemDefinition
{
    default m_Name = "ItFo_Plants_Flameberry_01";
    default m_ItemVisual = n"Blueprint'/Game/Items/Herb/BP_ItFo_Plants_Flameberry_01_Visual.BP_ItFo_Plants_Flameberry_01_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Herb/BP_ItFo_Plants_Flameberry_01_World.BP_ItFo_Plants_Flameberry_01_World_C'";
    default m_ItemEmptyVisual = n"Blueprint'/Game/Items/Herb/BP_ItFo_Plants_Flameberry_01_Empty_World.BP_ItFo_Plants_Flameberry_01_Empty_World_C'";
    default m_ItemVisualWorldDrop = n"Blueprint'/Game/Items/Herb/BP_ItFo_Plants_Flameberry_01_World_Drop.BP_ItFo_Plants_Flameberry_01_World_Drop_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItFo_Plants_Flameberry_01.T_ItemIcon_ItFo_Plants_Flameberry_01";
    default m_Value = 5;
    default m_MaxStack = 99;
    default m_CanBeSpawned = true;
    default m_Weight = 0.1f;
    default SetItemType(GameplayTag::Item_Herb);
    default AddOnConsume(UGE_Item_Heal_Overtime::StaticClass()).AddMag(GameplayTag::GE_Param_Heal, 1.0f).AddMag(GameplayTag::GE_Param_Duration, 5);
    default AddItemSpec(GameplayTag::Item_Property_Consumable);
    default AddItemSpec(GameplayTag::Item_Property_QuickConsumable);
    default AddItemSpec(GameplayTag::Item_Property_Throwable);
    default AddItemSpec(GameplayTag::Item_Property_Size_Small);
    default AddItemSpec(GameplayTag::Item_Property_TraderRegen);
    default AddItemSpec(GameplayTag::Item_Property_DefaultNotOwnable);
}

UCLASS()
class UItFo_Plants_Herb_01: UItemDefinition
{
    default m_Name = "ItFo_Plants_Herb_01";
    default m_ItemVisual = n"Blueprint'/Game/Items/Herb/BP_ItFo_Plants_Herb_01_Visual.BP_ItFo_Plants_Herb_01_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Herb/BP_ItFo_Plants_Herb_01_World.BP_ItFo_Plants_Herb_01_World_C'";
    default m_ItemEmptyVisual = n"Blueprint'/Game/Items/Herb/BP_ItFo_Plants_Herb_01_Empty_World.BP_ItFo_Plants_Herb_01_Empty_World_C'";
    default m_ItemVisualWorldDrop = n"Blueprint'/Game/Items/Herb/BP_ItFo_Plants_Herb_01_World_Drop.BP_ItFo_Plants_Herb_01_World_Drop_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItFo_Plants_Herb_01.T_ItemIcon_ItFo_Plants_Herb_01";
    default m_Value = 16;
    default m_MaxStack = 99;
    default m_CanBeSpawned = true;
    default m_Weight = 0.1f;
    default SetItemType(GameplayTag::Item_Herb);
    default AddOnConsume(UGE_Item_Heal_Overtime::StaticClass()).AddMag(GameplayTag::GE_Param_Heal, 3.0f).AddMag(GameplayTag::GE_Param_Duration, 9);
    default AddItemSpec(GameplayTag::Item_Property_Consumable);
    default AddItemSpec(GameplayTag::Item_Property_QuickConsumable);
    default AddItemSpec(GameplayTag::Item_Property_Throwable);
    default AddItemSpec(GameplayTag::Item_Property_Size_Small);
    default AddItemSpec(GameplayTag::Item_Property_TraderRegen);
    default AddItemSpec(GameplayTag::Item_Property_DefaultNotOwnable);
}

UCLASS()
class UItFo_Plants_Herb_02: UItemDefinition
{
    default m_Name = "ItFo_Plants_Herb_02";
    default m_ItemVisual = n"Blueprint'/Game/Items/Herb/BP_ItFo_Plants_Herb_02_Visual.BP_ItFo_Plants_Herb_02_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Herb/BP_ItFo_Plants_Herb_02_World.BP_ItFo_Plants_Herb_02_World_C'";
    default m_ItemEmptyVisual = n"Blueprint'/Game/Items/Herb/BP_ItFo_Plants_Herb_02_Empty_World.BP_ItFo_Plants_Herb_02_Empty_World_C'";
    default m_ItemVisualWorldDrop = n"Blueprint'/Game/Items/Herb/BP_ItFo_Plants_Herb_02_World_Drop.BP_ItFo_Plants_Herb_02_World_Drop_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItFo_Plants_Herb_02.T_ItemIcon_ItFo_Plants_Herb_02";
    default m_Value = 20;
    default m_MaxStack = 99;
    default m_CanBeSpawned = true;
    default m_Weight = 0.1f;
    default SetItemType(GameplayTag::Item_Herb);
    default AddOnConsume(UGE_Item_Heal_Overtime::StaticClass()).AddMag(GameplayTag::GE_Param_Heal, 4.0f).AddMag(GameplayTag::GE_Param_Duration, 9);
    default AddItemSpec(GameplayTag::Item_Property_Consumable);
    default AddItemSpec(GameplayTag::Item_Property_QuickConsumable);
    default AddItemSpec(GameplayTag::Item_Property_Throwable);
    default AddItemSpec(GameplayTag::Item_Property_Size_Small);
    default AddItemSpec(GameplayTag::Item_Property_TraderRegen);
    default AddItemSpec(GameplayTag::Item_Property_DefaultNotOwnable);
}

UCLASS()
class UItFo_Plants_Herb_03: UItemDefinition
{
    default m_Name = "ItFo_Plants_Herb_03";
    default m_ItemVisual = n"Blueprint'/Game/Items/Herb/BP_ItFo_Plants_Herb_03_Visual.BP_ItFo_Plants_Herb_03_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Herb/BP_ItFo_Plants_Herb_03_World.BP_ItFo_Plants_Herb_03_World_C'";
    default m_ItemEmptyVisual = n"Blueprint'/Game/Items/Herb/BP_ItFo_Plants_Herb_03_Empty_World.BP_ItFo_Plants_Herb_03_Empty_World_C'";
    default m_ItemVisualWorldDrop = n"Blueprint'/Game/Items/Herb/BP_ItFo_Plants_Herb_03_World_Drop.BP_ItFo_Plants_Herb_03_World_Drop_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItFo_Plants_Herb_03.T_ItemIcon_ItFo_Plants_Herb_03";
    default m_Value = 25;
    default m_MaxStack = 99;
    default m_CanBeSpawned = true;
    default m_Weight = 0.1f;
    default SetItemType(GameplayTag::Item_Herb);
    default AddOnConsume(UGE_Item_Heal_Overtime::StaticClass()).AddMag(GameplayTag::GE_Param_Heal, 5.0f).AddMag(GameplayTag::GE_Param_Duration, 9);
    default AddItemSpec(GameplayTag::Item_Property_Consumable);
    default AddItemSpec(GameplayTag::Item_Property_QuickConsumable);
    default AddItemSpec(GameplayTag::Item_Property_Throwable);
    default AddItemSpec(GameplayTag::Item_Property_Size_Small);
    default AddItemSpec(GameplayTag::Item_Property_TraderRegen);
    default AddItemSpec(GameplayTag::Item_Property_DefaultNotOwnable);
}

UCLASS()
class UItFo_Plants_Lobelia: UItemDefinition
{
    default m_Name = "ItFo_Plants_Lobelia";
    default m_ItemVisual = n"Blueprint'/Game/Items/Herb/BP_ItFo_Plants_Lobelia_Visual.BP_ItFo_Plants_Lobelia_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Herb/BP_ItFo_Plants_Lobelia_World.BP_ItFo_Plants_Lobelia_World_C'";
    default m_ItemEmptyVisual = n"Blueprint'/Game/Items/Herb/BP_ItFo_Plants_Lobelia_Empty_World.BP_ItFo_Plants_Lobelia_Empty_World_C'";
    default m_ItemVisualWorldDrop = n"Blueprint'/Game/Items/Herb/BP_ItFo_Plants_Lobelia_World_Drop.BP_ItFo_Plants_Lobelia_World_Drop_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItFo_Plants_Lobelia.T_ItemIcon_ItFo_Plants_Lobelia";
    default m_Value = 14;
    default m_MaxStack = 99;
    default m_CanBeSpawned = true;
    default m_Weight = 0.1f;
    default SetItemType(GameplayTag::Item_Herb);
    default AddOnConsume(UGE_Item_Heal_Overtime::StaticClass()).AddMag(GameplayTag::GE_Param_Heal, 2.0f).AddMag(GameplayTag::GE_Param_Duration, 4);
    default AddOnConsume(UGE_Item_Mana_Overtime::StaticClass()).AddMag(GameplayTag::GE_Param_Mana, 1.0f).AddMag(GameplayTag::GE_Param_Duration, 4);
    default AddItemSpec(GameplayTag::Item_Property_Consumable);
    default AddItemSpec(GameplayTag::Item_Property_QuickConsumable);
    default AddItemSpec(GameplayTag::Item_Property_Throwable);
    default AddItemSpec(GameplayTag::Item_Property_Size_Small);
    default AddItemSpec(GameplayTag::Item_Property_TraderRegen);
    default AddItemSpec(GameplayTag::Item_Property_DefaultNotOwnable);
}

UCLASS()
class UItFo_Plants_Mistcap: UItemDefinition
{
    default m_Name = "ItFo_Plants_Mistcap";
    default m_ItemVisual = n"Blueprint'/Game/Items/Herb/BP_ItFo_Plants_Mistcap_Visual.BP_ItFo_Plants_Mistcap_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Herb/BP_ItFo_Plants_Mistcap_World.BP_ItFo_Plants_Mistcap_World_C'";
    default m_ItemEmptyVisual = n"Blueprint'/Game/Items/Herb/BP_ItFo_Plants_Mistcap_Empty_World.BP_ItFo_Plants_Mistcap_Empty_World_C'";
    default m_ItemVisualWorldDrop = n"Blueprint'/Game/Items/Herb/BP_ItFo_Plants_Mistcap_World_Drop.BP_ItFo_Plants_Mistcap_World_Drop_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItFo_Plants_Mistcap.T_ItemIcon_ItFo_Plants_Mistcap";
    default m_Value = 9;
    default m_MaxStack = 99;
    default m_CanBeSpawned = true;
    default m_Weight = 0.1f;
    default SetItemType(GameplayTag::Item_Herb);
    default AddOnConsume(UGE_Item_Mana_Overtime::StaticClass()).AddMag(GameplayTag::GE_Param_Mana, 1.0f).AddMag(GameplayTag::GE_Param_Duration, 7);
    default AddItemSpec(GameplayTag::Item_Property_Consumable);
    default AddItemSpec(GameplayTag::Item_Property_QuickConsumable);
    default AddItemSpec(GameplayTag::Item_Property_Throwable);
    default AddItemSpec(GameplayTag::Item_Property_Size_Small);
    default AddItemSpec(GameplayTag::Item_Property_TraderRegen);
    default AddItemSpec(GameplayTag::Food_Mushroom);
    default AddItemSpec(GameplayTag::Item_Property_DefaultNotOwnable);
    default AddPossibleActionAfterDrop(GameplayTag::Action_Eat_Item);
}

UCLASS()
class UItFo_Plants_Mountainmoss_01: UItemDefinition
{
    default m_Name = "ItFo_Plants_Mountainmoss_01";
    default m_ItemVisual = n"Blueprint'/Game/Items/Herb/BP_ItFo_Plants_Mountainmoss_01_Visual.BP_ItFo_Plants_Mountainmoss_01_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Herb/BP_ItFo_Plants_Mountainmoss_01_World.BP_ItFo_Plants_Mountainmoss_01_World_C'";
    default m_ItemEmptyVisual = n"Blueprint'/Game/Items/Herb/BP_ItFo_Plants_Mountainmoss_01_Empty_World.BP_ItFo_Plants_Mountainmoss_01_Empty_World_C'";
    default m_ItemVisualWorldDrop = n"Blueprint'/Game/Items/Herb/BP_ItFo_Plants_Mountainmoss_01_World_Drop.BP_ItFo_Plants_Mountainmoss_01_World_Drop_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItFo_Plants_Mountainmoss_01.T_ItemIcon_ItFo_Plants_Mountainmoss_01";
    default m_Value = 5;
    default m_MaxStack = 99;
    default m_CanBeSpawned = true;
    default m_Weight = 0.1f;
    default SetItemType(GameplayTag::Item_Herb);
    default AddOnConsume(UGE_Item_Heal_Overtime::StaticClass()).AddMag(GameplayTag::GE_Param_Heal, 1.0f).AddMag(GameplayTag::GE_Param_Duration, 8);
    default AddItemSpec(GameplayTag::Item_Property_Consumable);
    default AddItemSpec(GameplayTag::Item_Property_QuickConsumable);
    default AddItemSpec(GameplayTag::Item_Property_Throwable);
    default AddItemSpec(GameplayTag::Item_Property_Size_Small);
    default AddItemSpec(GameplayTag::Item_Property_TraderRegen);
    default AddItemSpec(GameplayTag::Item_Property_DefaultNotOwnable);
}

UCLASS()
class UItFo_Plants_Mountainmoss_02: UItemDefinition
{
    default m_Name = "ItFo_Plants_Mountainmoss_02";
    default m_ItemVisual = n"Blueprint'/Game/Items/Herb/BP_ItFo_Plants_Mountainmoss_02_Visual.BP_ItFo_Plants_Mountainmoss_02_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Herb/BP_ItFo_Plants_Mountainmoss_02_World.BP_ItFo_Plants_Mountainmoss_02_World_C'";
    default m_ItemEmptyVisual = n"Blueprint'/Game/Items/Herb/BP_ItFo_Plants_Mountainmoss_02_Empty_World.BP_ItFo_Plants_Mountainmoss_02_Empty_World_C'";
    default m_ItemVisualWorldDrop = n"Blueprint'/Game/Items/Herb/BP_ItFo_Plants_Mountainmoss_02_World_Drop.BP_ItFo_Plants_Mountainmoss_02_World_Drop_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItFo_Plants_Mountainmoss_02.T_ItemIcon_ItFo_Plants_Mountainmoss_02";
    default m_Value = 10;
    default m_MaxStack = 99;
    default m_CanBeSpawned = true;
    default m_Weight = 0.1f;
    default SetItemType(GameplayTag::Item_Herb);
    default AddOnConsume(UGE_Item_Heal_Overtime::StaticClass()).AddMag(GameplayTag::GE_Param_Heal, 2.0f).AddMag(GameplayTag::GE_Param_Duration, 9);
    default AddItemSpec(GameplayTag::Item_Property_Consumable);
    default AddItemSpec(GameplayTag::Item_Property_QuickConsumable);
    default AddItemSpec(GameplayTag::Item_Property_Throwable);
    default AddItemSpec(GameplayTag::Item_Property_Size_Small);
    default AddItemSpec(GameplayTag::Item_Property_TraderRegen);
    default AddItemSpec(GameplayTag::Item_Property_DefaultNotOwnable);
}

UCLASS()
class UItFo_Plants_Mushroom_01: UItemDefinition
{
    default m_Name = "ItFo_Plants_Mushroom_01";
    default m_ItemVisual = n"Blueprint'/Game/Items/Herb/BP_ItFo_Plants_Mushroom_01_Visual.BP_ItFo_Plants_Mushroom_01_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Herb/BP_ItFo_Plants_Mushroom_01_World.BP_ItFo_Plants_Mushroom_01_World_C'";
    default m_ItemEmptyVisual = n"Blueprint'/Game/Items/Herb/BP_ItFo_Plants_Mushroom_01_Empty_World.BP_ItFo_Plants_Mushroom_01_Empty_World_C'";
    default m_ItemVisualWorldDrop = n"Blueprint'/Game/Items/Herb/BP_ItFo_Plants_Mushroom_01_World_Drop.BP_ItFo_Plants_Mushroom_01_World_Drop_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItFo_Plants_Mushroom_01.T_ItemIcon_ItFo_Plants_Mushroom_01";
    default m_Value = 3;
    default m_MaxStack = 99;
    default m_CanBeSpawned = true;
    default m_Weight = 0.1f;
    default SetItemType(GameplayTag::Item_Herb);
    default AddOnConsume(UGE_Item_Heal_Overtime::StaticClass()).AddMag(GameplayTag::GE_Param_Heal, 1.0f).AddMag(GameplayTag::GE_Param_Duration, 2);
    default AddItemSpec(GameplayTag::Item_Property_Consumable);
    default AddItemSpec(GameplayTag::Item_Property_QuickConsumable);
    default AddItemSpec(GameplayTag::Item_Property_Throwable);
    default AddItemSpec(GameplayTag::Item_Property_Size_Small);
    default AddItemSpec(GameplayTag::Item_Property_TraderRegen);
    default AddItemSpec(GameplayTag::Food_Mushroom);
    default AddItemSpec(GameplayTag::Item_Property_DefaultNotOwnable);
    default AddPossibleActionAfterDrop(GameplayTag::Action_Eat_Item);
}

UCLASS()
class UItFo_Plants_Mushroom_02: UItemDefinition
{
    default m_Name = "ItFo_Plants_Mushroom_02";
    default m_ItemVisual = n"Blueprint'/Game/Items/Herb/BP_ItFo_Plants_Mushroom_02_Visual.BP_ItFo_Plants_Mushroom_02_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Herb/BP_ItFo_Plants_Mushroom_02_World.BP_ItFo_Plants_Mushroom_02_World_C'";
    default m_ItemEmptyVisual = n"Blueprint'/Game/Items/Herb/BP_ItFo_Plants_Mushroom_02_Empty_World.BP_ItFo_Plants_Mushroom_02_Empty_World_C'";
    default m_ItemVisualWorldDrop = n"Blueprint'/Game/Items/Herb/BP_ItFo_Plants_Mushroom_02_World_Drop.BP_ItFo_Plants_Mushroom_02_World_Drop_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItFo_Plants_Mushroom_02.T_ItemIcon_ItFo_Plants_Mushroom_02";
    default m_Value = 7;
    default m_MaxStack = 99;
    default m_CanBeSpawned = true;
    default m_Weight = 0.1f;
    default SetItemType(GameplayTag::Item_Herb);
    default AddOnConsume(UGE_Item_Heal_Overtime::StaticClass()).AddMag(GameplayTag::GE_Param_Heal, 1.0f).AddMag(GameplayTag::GE_Param_Duration, 7);
    default AddItemSpec(GameplayTag::Item_Property_Consumable);
    default AddItemSpec(GameplayTag::Item_Property_QuickConsumable);
    default AddItemSpec(GameplayTag::Item_Property_Throwable);
    default AddItemSpec(GameplayTag::Item_Property_Size_Small);
    default AddItemSpec(GameplayTag::Item_Property_TraderRegen);
    default AddItemSpec(GameplayTag::Food_Mushroom);
    default AddItemSpec(GameplayTag::Item_Property_DefaultNotOwnable);
    default AddPossibleActionAfterDrop(GameplayTag::Action_Eat_Item);
}

UCLASS()
class UItFo_Plants_Nightshadow_01: UItemDefinition
{
    default m_Name = "ItFo_Plants_Nightshadow_01";
    default m_ItemVisual = n"Blueprint'/Game/Items/Herb/BP_ItFo_Plants_Nightshadow_01_Visual.BP_ItFo_Plants_Nightshadow_01_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Herb/BP_ItFo_Plants_Nightshadow_01_World.BP_ItFo_Plants_Nightshadow_01_World_C'";
    default m_ItemEmptyVisual = n"Blueprint'/Game/Items/Herb/BP_ItFo_Plants_Nightshadow_01_Empty_World.BP_ItFo_Plants_Nightshadow_01_Empty_World_C'";
    default m_ItemVisualWorldDrop = n"Blueprint'/Game/Items/Herb/BP_ItFo_Plants_Nightshadow_01_World_Drop.BP_ItFo_Plants_Nightshadow_01_World_Drop_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItFo_Plants_Nightshadow_01.T_ItemIcon_ItFo_Plants_Nightshadow_01";
    default m_Value = 6;
    default m_MaxStack = 99;
    default m_CanBeSpawned = true;
    default m_Weight = 0.1f;
    default SetItemType(GameplayTag::Item_Herb);
    default AddOnConsume(UGE_Item_Heal_Overtime::StaticClass()).AddMag(GameplayTag::GE_Param_Heal, 1.0f).AddMag(GameplayTag::GE_Param_Duration, 9);
    default AddItemSpec(GameplayTag::Item_Property_Consumable);
    default AddItemSpec(GameplayTag::Item_Property_QuickConsumable);
    default AddItemSpec(GameplayTag::Item_Property_Throwable);
    default AddItemSpec(GameplayTag::Item_Property_Size_Small);
    default AddItemSpec(GameplayTag::Item_Property_TraderRegen);
    default AddItemSpec(GameplayTag::Item_Property_DefaultNotOwnable);
}

UCLASS()
class UItFo_Plants_Nightshadow_02: UItemDefinition
{
    default m_Name = "ItFo_Plants_Nightshadow_02";
    default m_ItemVisual = n"Blueprint'/Game/Items/Herb/BP_ItFo_Plants_Nightshadow_02_Visual.BP_ItFo_Plants_Nightshadow_02_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Herb/BP_ItFo_Plants_Nightshadow_02_World.BP_ItFo_Plants_Nightshadow_02_World_C'";
    default m_ItemEmptyVisual = n"Blueprint'/Game/Items/Herb/BP_ItFo_Plants_Nightshadow_02_Empty_World.BP_ItFo_Plants_Nightshadow_02_Empty_World_C'";
    default m_ItemVisualWorldDrop = n"Blueprint'/Game/Items/Herb/BP_ItFo_Plants_Nightshadow_02_World_Drop.BP_ItFo_Plants_Nightshadow_02_World_Drop_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItFo_Plants_Nightshadow_02.T_ItemIcon_ItFo_Plants_Nightshadow_02";
    default m_Value = 6;
    default m_MaxStack = 99;
    default m_CanBeSpawned = true;
    default m_Weight = 0.1f;
    default SetItemType(GameplayTag::Item_Herb);
    default AddOnConsume(UGE_Item_Heal_Overtime::StaticClass()).AddMag(GameplayTag::GE_Param_Heal, 1.0f).AddMag(GameplayTag::GE_Param_Duration, 10);
    default AddItemSpec(GameplayTag::Item_Property_Consumable);
    default AddItemSpec(GameplayTag::Item_Property_QuickConsumable);
    default AddItemSpec(GameplayTag::Item_Property_Throwable);
    default AddItemSpec(GameplayTag::Item_Property_Size_Small);
    default AddItemSpec(GameplayTag::Item_Property_TraderRegen);
    default AddItemSpec(GameplayTag::Item_Property_DefaultNotOwnable);
}

UCLASS()
class UItFo_Plants_Orcherb_01: UItemDefinition
{
    default m_Name = "ItFo_Plants_Orcherb_01";
    default m_ItemVisual = n"Blueprint'/Game/Items/Herb/BP_ItFo_Plants_Orcherb_01_Visual.BP_ItFo_Plants_Orcherb_01_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Herb/BP_ItFo_Plants_Orcherb_01_World.BP_ItFo_Plants_Orcherb_01_World_C'";
    default m_ItemEmptyVisual = n"Blueprint'/Game/Items/Herb/BP_ItFo_Plants_Orcherb_01_Empty_World.BP_ItFo_Plants_Orcherb_01_Empty_World_C'";
    default m_ItemVisualWorldDrop = n"Blueprint'/Game/Items/Herb/BP_ItFo_Plants_Orcherb_01_World_Drop.BP_ItFo_Plants_Orcherb_01_World_Drop_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItFo_Plants_Orcherb_01.T_ItemIcon_ItFo_Plants_Orcherb_01";
    default m_Value = 9;
    default m_MaxStack = 99;
    default m_CanBeSpawned = true;
    default m_Weight = 0.1f;
    default SetItemType(GameplayTag::Item_Herb);
    default AddOnConsume(UGE_Item_Heal_Overtime::StaticClass()).AddMag(GameplayTag::GE_Param_Heal, 1.0f).AddMag(GameplayTag::GE_Param_Duration, 12);
    default AddItemSpec(GameplayTag::Item_Property_Consumable);
    default AddItemSpec(GameplayTag::Item_Property_QuickConsumable);
    default AddItemSpec(GameplayTag::Item_Property_Throwable);
    default AddItemSpec(GameplayTag::Item_Property_Size_Small);
    default AddItemSpec(GameplayTag::Item_Property_TraderRegen);
    default AddItemSpec(GameplayTag::Item_Property_DefaultNotOwnable);
}

UCLASS()
class UItFo_Plants_Orcherb_02: UItemDefinition
{
    default m_Name = "ItFo_Plants_Orcherb_02";
    default m_ItemVisual = n"Blueprint'/Game/Items/Herb/BP_ItFo_Plants_Orcherb_02_Visual.BP_ItFo_Plants_Orcherb_02_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Herb/BP_ItFo_Plants_Orcherb_02_World.BP_ItFo_Plants_Orcherb_02_World_C'";
    default m_ItemEmptyVisual = n"Blueprint'/Game/Items/Herb/BP_ItFo_Plants_Orcherb_02_Empty_World.BP_ItFo_Plants_Orcherb_02_Empty_World_C'";
    default m_ItemVisualWorldDrop = n"Blueprint'/Game/Items/Herb/BP_ItFo_Plants_Orcherb_02_World_Drop.BP_ItFo_Plants_Orcherb_02_World_Drop_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItFo_Plants_Orcherb_02.T_ItemIcon_ItFo_Plants_Orcherb_02";
    default m_Value = 8;
    default m_MaxStack = 99;
    default m_CanBeSpawned = true;
    default m_Weight = 0.1f;
    default SetItemType(GameplayTag::Item_Herb);
    default AddOnConsume(UGE_Item_Heal_Overtime::StaticClass()).AddMag(GameplayTag::GE_Param_Heal, 1.0f).AddMag(GameplayTag::GE_Param_Duration, 11);
    default AddItemSpec(GameplayTag::Item_Property_Consumable);
    default AddItemSpec(GameplayTag::Item_Property_QuickConsumable);
    default AddItemSpec(GameplayTag::Item_Property_Throwable);
    default AddItemSpec(GameplayTag::Item_Property_Size_Small);
    default AddItemSpec(GameplayTag::Item_Property_TraderRegen);
    default AddItemSpec(GameplayTag::Item_Property_DefaultNotOwnable);
}

UCLASS()
class UItFo_Plants_OrcSpore: UItemDefinition
{
    default m_Name = "ItFo_Plants_OrcSpore";
    default m_ItemVisual = n"Blueprint'/Game/Items/Herb/BP_ItFo_Plants_OrcSpore_Visual.BP_ItFo_Plants_OrcSpore_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Herb/BP_ItFo_Plants_OrcSpore_World.BP_ItFo_Plants_OrcSpore_World_C'";
    default m_ItemEmptyVisual = n"Blueprint'/Game/Items/Herb/BP_ItFo_Plants_OrcSpore_Empty_World.BP_ItFo_Plants_OrcSpore_Empty_World_C'";
    default m_ItemVisualWorldDrop = n"Blueprint'/Game/Items/Herb/BP_ItFo_Plants_OrcSpore_World_Drop.BP_ItFo_Plants_OrcSpore_World_Drop_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItFo_Plants_OrcSpore.T_ItemIcon_ItFo_Plants_OrcSpore";
    default m_Value = 8;
    default m_MaxStack = 99;
    default m_CanBeSpawned = true;
    default m_Weight = 0.1f;
    default SetItemType(GameplayTag::Item_Herb);
    default AddItemSpec(GameplayTag::Item_Property_Consumable);
    default AddItemSpec(GameplayTag::Item_Property_Size_Small);
    default AddItemSpec(GameplayTag::Item_Property_Unique);
    default AddItemSpec(GameplayTag::Item_Property_DefaultNotOwnable);
}

UCLASS()
class UItFo_Plants_Ravenherb_01: UItemDefinition
{
    default m_Name = "ItFo_Plants_Ravenherb_01";
    default m_ItemVisual = n"Blueprint'/Game/Items/Herb/BP_ItFo_Plants_Ravenherb_01_Visual.BP_ItFo_Plants_Ravenherb_01_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Herb/BP_ItFo_Plants_Ravenherb_01_World.BP_ItFo_Plants_Ravenherb_01_World_C'";
    default m_ItemEmptyVisual = n"Blueprint'/Game/Items/Herb/BP_ItFo_Plants_Ravenherb_01_Empty_World.BP_ItFo_Plants_Ravenherb_01_Empty_World_C'";
    default m_ItemVisualWorldDrop = n"Blueprint'/Game/Items/Herb/BP_ItFo_Plants_Ravenherb_01_World_Drop.BP_ItFo_Plants_Ravenherb_01_World_Drop_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItFo_Plants_Ravenherb_01.T_ItemIcon_ItFo_Plants_Ravenherb_01";
    default m_Value = 13;
    default m_MaxStack = 99;
    default m_CanBeSpawned = true;
    default m_Weight = 0.1f;
    default SetItemType(GameplayTag::Item_Herb);
    default AddOnConsume(UGE_Item_Mana_Overtime::StaticClass()).AddMag(GameplayTag::GE_Param_Mana, 1.0f).AddMag(GameplayTag::GE_Param_Duration, 14);
    default AddItemSpec(GameplayTag::Item_Property_Consumable);
    default AddItemSpec(GameplayTag::Item_Property_QuickConsumable);
    default AddItemSpec(GameplayTag::Item_Property_Throwable);
    default AddItemSpec(GameplayTag::Item_Property_Size_Small);
    default AddItemSpec(GameplayTag::Item_Property_TraderRegen);
    default AddItemSpec(GameplayTag::Item_Property_DefaultNotOwnable);
}

UCLASS()
class UItFo_Plants_Ravenherb_02: UItemDefinition
{
    default m_Name = "ItFo_Plants_Ravenherb_02";
    default m_ItemVisual = n"Blueprint'/Game/Items/Herb/BP_ItFo_Plants_Ravenherb_02_Visual.BP_ItFo_Plants_Ravenherb_02_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Herb/BP_ItFo_Plants_Ravenherb_02_World.BP_ItFo_Plants_Ravenherb_02_World_C'";
    default m_ItemEmptyVisual = n"Blueprint'/Game/Items/Herb/BP_ItFo_Plants_Ravenherb_02_Empty_World.BP_ItFo_Plants_Ravenherb_02_Empty_World_C'";
    default m_ItemVisualWorldDrop = n"Blueprint'/Game/Items/Herb/BP_ItFo_Plants_Ravenherb_02_World_Drop.BP_ItFo_Plants_Ravenherb_02_World_Drop_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItFo_Plants_Ravenherb_02.T_ItemIcon_ItFo_Plants_Ravenherb_02";
    default m_Value = 10;
    default m_MaxStack = 99;
    default m_CanBeSpawned = true;
    default m_Weight = 0.1f;
    default SetItemType(GameplayTag::Item_Herb);
    default AddOnConsume(UGE_Item_Mana_Overtime::StaticClass()).AddMag(GameplayTag::GE_Param_Mana, 1.0f).AddMag(GameplayTag::GE_Param_Duration, 9);
    default AddItemSpec(GameplayTag::Item_Property_Consumable);
    default AddItemSpec(GameplayTag::Item_Property_QuickConsumable);
    default AddItemSpec(GameplayTag::Item_Property_Throwable);
    default AddItemSpec(GameplayTag::Item_Property_Size_Small);
    default AddItemSpec(GameplayTag::Item_Property_TraderRegen);
    default AddItemSpec(GameplayTag::Item_Property_DefaultNotOwnable);
}

UCLASS()
class UItFo_Plants_Seraphis_01: UItemDefinition
{
    default m_Name = "ItFo_Plants_Seraphis_01";
    default m_ItemVisual = n"Blueprint'/Game/Items/Herb/BP_ItFo_Plants_Seraphis_01_Visual.BP_ItFo_Plants_Seraphis_01_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Herb/BP_ItFo_Plants_Seraphis_01_World.BP_ItFo_Plants_Seraphis_01_World_C'";
    default m_ItemEmptyVisual = n"Blueprint'/Game/Items/Herb/BP_ItFo_Plants_Seraphis_01_Empty_World.BP_ItFo_Plants_Seraphis_01_Empty_World_C'";
    default m_ItemVisualWorldDrop = n"Blueprint'/Game/Items/Herb/BP_ItFo_Plants_Seraphis_01_World_Drop.BP_ItFo_Plants_Seraphis_01_World_Drop_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItFo_Plants_Seraphis_01.T_ItemIcon_ItFo_Plants_Seraphis_01";
    default m_Value = 6;
    default m_MaxStack = 99;
    default m_CanBeSpawned = true;
    default m_Weight = 0.1f;
    default SetItemType(GameplayTag::Item_Herb);
    default AddOnConsume(UGE_Item_Heal_Overtime::StaticClass()).AddMag(GameplayTag::GE_Param_Heal, 1.0f).AddMag(GameplayTag::GE_Param_Duration, 6);
    default AddItemSpec(GameplayTag::Item_Property_Consumable);
    default AddItemSpec(GameplayTag::Item_Property_QuickConsumable);
    default AddItemSpec(GameplayTag::Item_Property_Throwable);
    default AddItemSpec(GameplayTag::Item_Property_Size_Small);
    default AddItemSpec(GameplayTag::Item_Property_TraderRegen);
    default AddItemSpec(GameplayTag::Item_Property_DefaultNotOwnable);
}

UCLASS()
class UItFo_Plants_Siren: UItemDefinition
{
    default m_Name = "ItFo_Plants_Siren";
    default m_ItemVisual = n"Blueprint'/Game/Items/Herb/BP_ItFo_Plants_Siren_Visual.BP_ItFo_Plants_Siren_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Herb/BP_ItFo_Plants_Siren_World.BP_ItFo_Plants_Siren_World_C'";
    default m_ItemEmptyVisual = n"Blueprint'/Game/Items/Herb/BP_ItFo_Plants_Siren_Empty_World.BP_ItFo_Plants_Siren_Empty_World_C'";
    default m_ItemVisualWorldDrop = n"Blueprint'/Game/Items/Herb/BP_ItFo_Plants_Siren_World_Drop.BP_ItFo_Plants_Siren_World_Drop_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItFo_Plants_Siren.T_ItemIcon_ItFo_Plants_Siren";
    default m_Value = 16;
    default m_MaxStack = 99;
    default m_CanBeSpawned = true;
    default m_Weight = 0.1f;
    default SetItemType(GameplayTag::Item_Herb);
    default AddOnConsume(UGE_Item_Heal_Overtime::StaticClass()).AddMag(GameplayTag::GE_Param_Heal, 1.0f).AddMag(GameplayTag::GE_Param_Duration, 9);
    default AddOnConsume(UGE_Item_Mana_Overtime::StaticClass()).AddMag(GameplayTag::GE_Param_Mana, 1.0f).AddMag(GameplayTag::GE_Param_Duration, 9);
    default AddItemSpec(GameplayTag::Item_Property_Consumable);
    default AddItemSpec(GameplayTag::Item_Property_QuickConsumable);
    default AddItemSpec(GameplayTag::Item_Property_Throwable);
    default AddItemSpec(GameplayTag::Item_Property_Size_Small);
    default AddItemSpec(GameplayTag::Item_Property_TraderRegen);
    default AddItemSpec(GameplayTag::Item_Property_DefaultNotOwnable);
}

UCLASS()
class UItFo_Plants_Stoneroot_01: UItemDefinition
{
    default m_Name = "ItFo_Plants_Stoneroot_01";
    default m_ItemVisual = n"Blueprint'/Game/Items/Herb/BP_ItFo_Plants_Stoneroot_01_Visual.BP_ItFo_Plants_Stoneroot_01_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Herb/BP_ItFo_Plants_Stoneroot_01_World.BP_ItFo_Plants_Stoneroot_01_World_C'";
    default m_ItemEmptyVisual = n"Blueprint'/Game/Items/Herb/BP_ItFo_Plants_Stoneroot_01_Empty_World.BP_ItFo_Plants_Stoneroot_01_Empty_World_C'";
    default m_ItemVisualWorldDrop = n"Blueprint'/Game/Items/Herb/BP_ItFo_Plants_Stoneroot_01_World_Drop.BP_ItFo_Plants_Stoneroot_01_World_Drop_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItFo_Plants_Stoneroot_01.T_ItemIcon_ItFo_Plants_Stoneroot_01";
    default m_Value = 16;
    default m_MaxStack = 99;
    default m_CanBeSpawned = true;
    default m_Weight = 0.1f;
    default SetItemType(GameplayTag::Item_Herb);
    default AddOnConsume(UGE_Item_Mana_Overtime::StaticClass()).AddMag(GameplayTag::GE_Param_Mana, 1.5f).AddMag(GameplayTag::GE_Param_Duration, 9);
    default AddItemSpec(GameplayTag::Item_Property_Consumable);
    default AddItemSpec(GameplayTag::Item_Property_QuickConsumable);
    default AddItemSpec(GameplayTag::Item_Property_Throwable);
    default AddItemSpec(GameplayTag::Item_Property_Size_Small);
    default AddItemSpec(GameplayTag::Item_Property_TraderRegen);
    default AddItemSpec(GameplayTag::Item_Property_DefaultNotOwnable);
}

UCLASS()
class UItFo_Plants_Stoneroot_02: UItemDefinition
{
    default m_Name = "ItFo_Plants_Stoneroot_02";
    default m_ItemVisual = n"Blueprint'/Game/Items/Herb/BP_ItFo_Plants_Stoneroot_02_Visual.BP_ItFo_Plants_Stoneroot_02_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Herb/BP_ItFo_Plants_Stoneroot_02_World.BP_ItFo_Plants_Stoneroot_02_World_C'";
    default m_ItemEmptyVisual = n"Blueprint'/Game/Items/Herb/BP_ItFo_Plants_Stoneroot_02_Empty_World.BP_ItFo_Plants_Stoneroot_02_Empty_World_C'";
    default m_ItemVisualWorldDrop = n"Blueprint'/Game/Items/Herb/BP_ItFo_Plants_Stoneroot_02_World_Drop.BP_ItFo_Plants_Stoneroot_02_World_Drop_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItFo_Plants_Stoneroot_02.T_ItemIcon_ItFo_Plants_Stoneroot_02";
    default m_Value = 16;
    default m_MaxStack = 99;
    default m_CanBeSpawned = true;
    default m_Weight = 0.1f;
    default SetItemType(GameplayTag::Item_Herb);
    default AddOnConsume(UGE_Item_Mana_Overtime::StaticClass()).AddMag(GameplayTag::GE_Param_Mana, 2.0f).AddMag(GameplayTag::GE_Param_Duration, 9);
    default AddItemSpec(GameplayTag::Item_Property_Consumable);
    default AddItemSpec(GameplayTag::Item_Property_QuickConsumable);
    default AddItemSpec(GameplayTag::Item_Property_Throwable);
    default AddItemSpec(GameplayTag::Item_Property_Size_Small);
    default AddItemSpec(GameplayTag::Item_Property_TraderRegen);
    default AddItemSpec(GameplayTag::Item_Property_DefaultNotOwnable);
}

UCLASS()
class UItFo_Plants_Trollbane: UItemDefinition
{
    default m_Name = "ItFo_Plants_Trollbane";
    default m_ItemVisual = n"Blueprint'/Game/Items/Herb/BP_ItFo_Plants_Trollbane_Visual.BP_ItFo_Plants_Trollbane_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Herb/BP_ItFo_Plants_Trollbane_World.BP_ItFo_Plants_Trollbane_World_C'";
    default m_ItemEmptyVisual = n"Blueprint'/Game/Items/Herb/BP_ItFo_Plants_Trollbane_Empty_World.BP_ItFo_Plants_Trollbane_Empty_World_C'";
    default m_ItemVisualWorldDrop = n"Blueprint'/Game/Items/Herb/BP_ItFo_Plants_Trollbane_World_Drop.BP_ItFo_Plants_Trollbane_World_Drop_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItFo_Plants_Trollbane.T_ItemIcon_ItFo_Plants_Trollbane";
    default m_Value = 13;
    default m_MaxStack = 99;
    default m_CanBeSpawned = true;
    default m_Weight = 0.1f;
    default SetItemType(GameplayTag::Item_Herb);
    default AddOnConsume(UGE_Item_Heal_Overtime::StaticClass()).AddMag(GameplayTag::GE_Param_Heal, -1.0f).AddMag(GameplayTag::GE_Param_Duration, 14);
    default AddOnConsume(UGE_Item_Mana_Overtime::StaticClass()).AddMag(GameplayTag::GE_Param_Mana, 2.0f).AddMag(GameplayTag::GE_Param_Duration, 14);
    default AddItemSpec(GameplayTag::Item_Property_Consumable);
    default AddItemSpec(GameplayTag::Item_Property_QuickConsumable);
    default AddItemSpec(GameplayTag::Item_Property_Throwable);
    default AddItemSpec(GameplayTag::Item_Property_Size_Small);
    default AddItemSpec(GameplayTag::Item_Property_TraderRegen);
    default AddItemSpec(GameplayTag::Item_Property_DefaultNotOwnable);
}

UCLASS()
class UItFo_Plants_Velayis_01: UItemDefinition
{
    default m_Name = "ItFo_Plants_Velayis_01";
    default m_ItemVisual = n"Blueprint'/Game/Items/Herb/BP_ItFo_Plants_Velayis_01_Visual.BP_ItFo_Plants_Velayis_01_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Herb/BP_ItFo_Plants_Velayis_01_World.BP_ItFo_Plants_Velayis_01_World_C'";
    default m_ItemEmptyVisual = n"Blueprint'/Game/Items/Herb/BP_ItFo_Plants_Velayis_01_Empty_World.BP_ItFo_Plants_Velayis_01_Empty_World_C'";
    default m_ItemVisualWorldDrop = n"Blueprint'/Game/Items/Herb/BP_ItFo_Plants_Velayis_01_World_Drop.BP_ItFo_Plants_Velayis_01_World_Drop_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItFo_Plants_Velayis_01.T_ItemIcon_ItFo_Plants_Velayis_01";
    default m_Value = 9;
    default m_MaxStack = 99;
    default m_CanBeSpawned = true;
    default m_Weight = 0.1f;
    default SetItemType(GameplayTag::Item_Herb);
    default AddOnConsume(UGE_Item_Heal_Overtime::StaticClass()).AddMag(GameplayTag::GE_Param_Heal, 1.0f).AddMag(GameplayTag::GE_Param_Duration, 15);
    default AddItemSpec(GameplayTag::Item_Property_Consumable);
    default AddItemSpec(GameplayTag::Item_Property_QuickConsumable);
    default AddItemSpec(GameplayTag::Item_Property_Throwable);
    default AddItemSpec(GameplayTag::Item_Property_Size_Small);
    default AddItemSpec(GameplayTag::Item_Property_TraderRegen);
    default AddItemSpec(GameplayTag::Item_Property_DefaultNotOwnable);
}

UCLASS()
class UItFo_Plants_Widow: UItemDefinition
{
    default m_Name = "ItFo_Plants_Widow";
    default m_ItemVisual = n"Blueprint'/Game/Items/Herb/BP_ItFo_Plants_Widow_Visual.BP_ItFo_Plants_Widow_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Herb/BP_ItFo_Plants_Widow_World.BP_ItFo_Plants_Widow_World_C'";
    default m_ItemEmptyVisual = n"Blueprint'/Game/Items/Herb/BP_ItFo_Plants_Widow_Empty_World.BP_ItFo_Plants_Widow_Empty_World_C'";
    default m_ItemVisualWorldDrop = n"Blueprint'/Game/Items/Herb/BP_ItFo_Plants_Widow_World_Drop.BP_ItFo_Plants_Widow_World_Drop_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItFo_Plants_Widow.T_ItemIcon_ItFo_Plants_Widow";
    default m_Value = 6;
    default m_MaxStack = 99;
    default m_CanBeSpawned = true;
    default m_Weight = 0.1f;
    default SetItemType(GameplayTag::Item_Herb);
    default AddOnConsume(UGE_Item_Heal_Overtime::StaticClass()).AddMag(GameplayTag::GE_Param_Heal, -1.0f).AddMag(GameplayTag::GE_Param_Duration, 9);
    default AddOnConsume(UGE_Item_Mana_Overtime::StaticClass()).AddMag(GameplayTag::GE_Param_Mana, 1.0f).AddMag(GameplayTag::GE_Param_Duration, 9);
    default AddItemSpec(GameplayTag::Item_Property_Consumable);
    default AddItemSpec(GameplayTag::Item_Property_QuickConsumable);
    default AddItemSpec(GameplayTag::Item_Property_Throwable);
    default AddItemSpec(GameplayTag::Item_Property_Size_Small);
    default AddItemSpec(GameplayTag::Item_Property_TraderRegen);
    default AddItemSpec(GameplayTag::Item_Property_DefaultNotOwnable);
}

UCLASS()
class UItMi_Joint_01: UItemDefinition
{
    default m_Name = "ItMi_Joint_01";
    default m_ItemVisual = n"Blueprint'/Game/Items/Herb/BP_ItMi_Joint_01_Visual.BP_ItMi_Joint_01_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Herb/BP_ItMi_Joint_01_World.BP_ItMi_Joint_01_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMi_Joint_01.T_ItemIcon_ItMi_Joint_01";
    default m_Value = 8;
    default m_MaxStack = 99;
    default m_CanBeSpawned = true;
    default m_Weight = 0.05f;
    default SetItemType(GameplayTag::Item_Drug);
    default AddOnConsume(UGE_Item_Mana_Overtime::StaticClass()).AddMag(GameplayTag::GE_Param_Mana, 1.5f).AddMag(GameplayTag::GE_Param_Duration, 4);
    default AddOnConsume(UGE_Item_Swampweed_Insta::StaticClass()).AddMag(GameplayTag::GE_Param_Swampweed, 20.0f);
    default AddItemSpec(GameplayTag::Item_Property_Consumable);
    default AddItemSpec(GameplayTag::Item_Property_QuickConsumable);
    default AddItemSpec(GameplayTag::Item_Property_Throwable);
    default AddItemSpec(GameplayTag::Item_Property_Size_Small);
    default AddItemSpec(GameplayTag::Item_Property_TraderRegen);
    default AddItemSpec(GameplayTag::Item_Property_DefaultNotOwnable);
}

UCLASS()
class UItMi_Joint_02: UItemDefinition
{
    default m_Name = "ItMi_Joint_02";
    default m_ItemVisual = n"Blueprint'/Game/Items/Herb/BP_ItMi_Joint_02_Visual.BP_ItMi_Joint_02_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Herb/BP_ItMi_Joint_02_World.BP_ItMi_Joint_02_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMi_Joint_02.T_ItemIcon_ItMi_Joint_02";
    default m_Value = 15;
    default m_MaxStack = 99;
    default m_CanBeSpawned = true;
    default m_Weight = 0.05f;
    default SetItemType(GameplayTag::Item_Drug);
    default AddOnConsume(UGE_Item_Mana_Overtime::StaticClass()).AddMag(GameplayTag::GE_Param_Mana, 2.0f).AddMag(GameplayTag::GE_Param_Duration, 8);
    default AddOnConsume(UGE_Item_Swampweed_Insta::StaticClass()).AddMag(GameplayTag::GE_Param_Swampweed, 40.0f);
    default AddItemSpec(GameplayTag::Item_Property_Consumable);
    default AddItemSpec(GameplayTag::Item_Property_QuickConsumable);
    default AddItemSpec(GameplayTag::Item_Property_Throwable);
    default AddItemSpec(GameplayTag::Item_Property_Size_Small);
    default AddItemSpec(GameplayTag::Item_Property_TraderRegen);
    default AddItemSpec(GameplayTag::Item_Property_DefaultNotOwnable);
}

UCLASS()
class UItMi_Joint_03: UItemDefinition
{
    default m_Name = "ItMi_Joint_03";
    default m_ItemVisual = n"Blueprint'/Game/Items/Herb/BP_ItMi_Joint_03_Visual.BP_ItMi_Joint_03_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Herb/BP_ItMi_Joint_03_World.BP_ItMi_Joint_03_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMi_Joint_03.T_ItemIcon_ItMi_Joint_03";
    default m_Value = 20;
    default m_MaxStack = 99;
    default m_CanBeSpawned = true;
    default m_Weight = 0.05f;
    default SetItemType(GameplayTag::Item_Drug);
    default AddOnConsume(UGE_Item_Mana_Overtime::StaticClass()).AddMag(GameplayTag::GE_Param_Mana, 2.0f).AddMag(GameplayTag::GE_Param_Duration, 11);
    default AddOnConsume(UGE_Item_Swampweed_Insta::StaticClass()).AddMag(GameplayTag::GE_Param_Swampweed, 100.0f);
    default AddItemSpec(GameplayTag::Item_Property_Consumable);
    default AddItemSpec(GameplayTag::Item_Property_QuickConsumable);
    default AddItemSpec(GameplayTag::Item_Property_Throwable);
    default AddItemSpec(GameplayTag::Item_Property_Size_Small);
    default AddItemSpec(GameplayTag::Item_Property_TraderRegen);
    default AddItemSpec(GameplayTag::Item_Property_DefaultNotOwnable);
}

UCLASS()
class UItMi_Plants_Swampherb_01: UItemDefinition
{
    default m_Name = "ItMi_Plants_Swampherb_01";
    default m_ItemVisual = n"Blueprint'/Game/Items/Herb/BP_ItMi_Plants_Swampherb_01_Visual.BP_ItMi_Plants_Swampherb_01_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Herb/BP_ItMi_Plants_Swampherb_01_World.BP_ItMi_Plants_Swampherb_01_World_C'";
    default m_ItemEmptyVisual = n"Blueprint'/Game/Items/Herb/BP_ItMi_Plants_Swampherb_01_Empty_World.BP_ItMi_Plants_Swampherb_01_Empty_World_C'";
    default m_ItemVisualWorldDrop = n"Blueprint'/Game/Items/Herb/BP_ItMi_Plants_Swampherb_01_World_Drop.BP_ItMi_Plants_Swampherb_01_World_Drop_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMi_Plants_Swampherb_01.T_ItemIcon_ItMi_Plants_Swampherb_01";
    default m_Value = 6;
    default m_MaxStack = 99;
    default m_CanBeSpawned = true;
    default m_Weight = 0.1f;
    default SetItemType(GameplayTag::Item_Herb);
    default AddOnConsume(UGE_Item_Mana_Overtime::StaticClass()).AddMag(GameplayTag::GE_Param_Mana, 1.0f).AddMag(GameplayTag::GE_Param_Duration, 4);
    default AddOnConsume(UGE_Item_Swampweed_Insta::StaticClass()).AddMag(GameplayTag::GE_Param_Swampweed, 10.0f);
    default AddItemSpec(GameplayTag::Item_Property_Consumable);
    default AddItemSpec(GameplayTag::Item_Property_QuickConsumable);
    default AddItemSpec(GameplayTag::Item_Property_Throwable);
    default AddItemSpec(GameplayTag::Item_Property_Size_Small);
    default AddItemSpec(GameplayTag::Item_Property_TraderRegen);
    default AddItemSpec(GameplayTag::Item_Property_DefaultNotOwnable);
}