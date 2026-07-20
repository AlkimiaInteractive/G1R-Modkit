
UCLASS()
class UItFo_Potion_Dex_01: UItemDefinition
{
    default m_Name = "ItFo_Potion_Dex_01";
    default m_ItemVisual = n"Blueprint'/Game/Items/Potion/BP_ItFo_Potion_Dex_01_Visual.BP_ItFo_Potion_Dex_01_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Potion/BP_ItFo_Potion_Dex_01_World.BP_ItFo_Potion_Dex_01_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItFo_Potion_Dex_01.T_ItemIcon_ItFo_Potion_Dex_01";
    default m_Value = 200;
    default m_MaxStack = 99;
    default m_Weight = 0.15f;
    default AddOnConsume(UGE_Item_Dexterity_Insta::StaticClass()).AddMag(GameplayTag::GE_Param_Dexterity, 1.0f);
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Potion);
    default AddItemSpec(GameplayTag::Item_Property_Consumable);
    default AddItemSpec(GameplayTag::Item_Property_QuickConsumable);
    default AddItemSpec(GameplayTag::Item_Property_Throwable);
    default AddItemSpec(GameplayTag::Item_Property_Size_Small);
}

UCLASS()
class UItFo_Potion_Dex_02: UItemDefinition
{
    default m_Name = "ItFo_Potion_Dex_02";
    default m_ItemVisual = n"Blueprint'/Game/Items/Potion/BP_ItFo_Potion_Dex_02_Visual.BP_ItFo_Potion_Dex_02_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Potion/BP_ItFo_Potion_Dex_02_World.BP_ItFo_Potion_Dex_02_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItFo_Potion_Dex_02.T_ItemIcon_ItFo_Potion_Dex_02";
    default m_Value = 400;
    default m_MaxStack = 99;
    default m_Weight = 0.15f;
    default AddOnConsume(UGE_Item_Dexterity_Insta::StaticClass()).AddMag(GameplayTag::GE_Param_Dexterity, 2.0f);
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Potion);
    default AddItemSpec(GameplayTag::Item_Property_Consumable);
    default AddItemSpec(GameplayTag::Item_Property_QuickConsumable);
    default AddItemSpec(GameplayTag::Item_Property_Throwable);
    default AddItemSpec(GameplayTag::Item_Property_Size_Small);
}

UCLASS()
class UItFo_Potion_Dex_03: UItemDefinition
{
    default m_Name = "ItFo_Potion_Dex_03";
    default m_ItemVisual = n"Blueprint'/Game/Items/Potion/BP_ItFo_Potion_Dex_03_Visual.BP_ItFo_Potion_Dex_03_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Potion/BP_ItFo_Potion_Dex_03_World.BP_ItFo_Potion_Dex_03_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItFo_Potion_Dex_03.T_ItemIcon_ItFo_Potion_Dex_03";
    default m_Value = 800;
    default m_MaxStack = 99;
    default m_Weight = 0.15f;
    default AddOnConsume(UGE_Item_Dexterity_Insta::StaticClass()).AddMag(GameplayTag::GE_Param_Dexterity, 5.0f);
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Potion);
    default AddItemSpec(GameplayTag::Item_Property_Consumable);
    default AddItemSpec(GameplayTag::Item_Property_QuickConsumable);
    default AddItemSpec(GameplayTag::Item_Property_Throwable);
    default AddItemSpec(GameplayTag::Item_Property_Size_Small);
}

UCLASS()
class UItFo_Potion_Haste_01: UItemDefinition
{
    default m_Name = "ItFo_Potion_Haste_01";
    default m_ItemVisual = n"Blueprint'/Game/Items/Potion/BP_ItFo_Potion_Haste_01_Visual.BP_ItFo_Potion_Haste_01_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Potion/BP_ItFo_Potion_Haste_01_World.BP_ItFo_Potion_Haste_01_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItFo_Potion_Haste_01.T_ItemIcon_ItFo_Potion_Haste_01";
    default m_Value = 100;
    default m_MaxStack = 99;
    default m_CanBeSpawned = true;
    default m_Weight = 0.15f;
    default SetItemType(GameplayTag::Item_Potion);
    default AddItemSpec(GameplayTag::Item_Property_Consumable);
    default AddItemSpec(GameplayTag::Item_Property_QuickConsumable);
    default AddItemSpec(GameplayTag::Item_Property_Throwable);
    default AddItemSpec(GameplayTag::Item_Property_Size_Small);
    default AddItemSpec(GameplayTag::Item_Property_TraderRegen);
}

UCLASS()
class UItFo_Potion_Haste_02: UItemDefinition
{
    default m_Name = "ItFo_Potion_Haste_02";
    default m_ItemVisual = n"Blueprint'/Game/Items/Potion/BP_ItFo_Potion_Haste_02_Visual.BP_ItFo_Potion_Haste_02_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Potion/BP_ItFo_Potion_Haste_02_World.BP_ItFo_Potion_Haste_02_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItFo_Potion_Haste_02.T_ItemIcon_ItFo_Potion_Haste_02";
    default m_Value = 100;
    default m_MaxStack = 99;
    default m_CanBeSpawned = true;
    default m_Weight = 0.15f;
    default SetItemType(GameplayTag::Item_Potion);
    default AddItemSpec(GameplayTag::Item_Property_Consumable);
    default AddItemSpec(GameplayTag::Item_Property_QuickConsumable);
    default AddItemSpec(GameplayTag::Item_Property_Throwable);
    default AddItemSpec(GameplayTag::Item_Property_Size_Small);
    default AddItemSpec(GameplayTag::Item_Property_TraderRegen);
}

UCLASS()
class UItFo_Potion_Haste_03: UItemDefinition
{
    default m_Name = "ItFo_Potion_Haste_03";
    default m_ItemVisual = n"Blueprint'/Game/Items/Potion/BP_ItFo_Potion_Haste_03_Visual.BP_ItFo_Potion_Haste_03_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Potion/BP_ItFo_Potion_Haste_03_World.BP_ItFo_Potion_Haste_03_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItFo_Potion_Haste_03.T_ItemIcon_ItFo_Potion_Haste_03";
    default m_Value = 100;
    default m_MaxStack = 99;
    default m_CanBeSpawned = true;
    default m_Weight = 0.15f;
    default SetItemType(GameplayTag::Item_Potion);
    default AddItemSpec(GameplayTag::Item_Property_Consumable);
    default AddItemSpec(GameplayTag::Item_Property_QuickConsumable);
    default AddItemSpec(GameplayTag::Item_Property_Throwable);
    default AddItemSpec(GameplayTag::Item_Property_Size_Small);
    default AddItemSpec(GameplayTag::Item_Property_TraderRegen);
}

UCLASS()
class UItFo_Potion_Health_01: UItemDefinition
{
    default m_Name = "ItFo_Potion_Health_01";
    default m_ItemVisual = n"Blueprint'/Game/Items/Potion/BP_ItFo_Potion_Health_01_Visual.BP_ItFo_Potion_Health_01_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Potion/BP_ItFo_Potion_Health_01_World.BP_ItFo_Potion_Health_01_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItFo_Potion_Health_01.T_ItemIcon_ItFo_Potion_Health_01";
    default m_Value = 25;
    default m_MaxStack = 99;
    default m_Weight = 0.15f;
    default AddOnConsume(UGE_Item_Heal_Insta::StaticClass()).AddMag(GameplayTag::GE_Param_Heal, 50.0f);
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Potion);
    default AddItemSpec(GameplayTag::Item_Property_Consumable);
    default AddItemSpec(GameplayTag::Item_Property_QuickConsumable);
    default AddItemSpec(GameplayTag::Item_Property_Throwable);
    default AddItemSpec(GameplayTag::Item_Property_Size_Small);
    default AddItemSpec(GameplayTag::Item_Property_TraderRegen);
    default AddItemSpec(GameplayTag::Item_Property_NonLootUnkillable);
}

UCLASS()
class UItFo_Potion_Health_02: UItemDefinition
{
    default m_Name = "ItFo_Potion_Health_02";
    default m_ItemVisual = n"Blueprint'/Game/Items/Potion/BP_ItFo_Potion_Health_02_Visual.BP_ItFo_Potion_Health_02_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Potion/BP_ItFo_Potion_Health_02_World.BP_ItFo_Potion_Health_02_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItFo_Potion_Health_02.T_ItemIcon_ItFo_Potion_Health_02";
    default m_Value = 32;
    default m_MaxStack = 99;
    default m_Weight = 0.15f;
    default AddOnConsume(UGE_Item_Heal_Insta::StaticClass()).AddMag(GameplayTag::GE_Param_Heal, 70.0f);
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Potion);
    default AddItemSpec(GameplayTag::Item_Property_Consumable);
    default AddItemSpec(GameplayTag::Item_Property_QuickConsumable);
    default AddItemSpec(GameplayTag::Item_Property_Throwable);
    default AddItemSpec(GameplayTag::Item_Property_Size_Small);
    default AddItemSpec(GameplayTag::Item_Property_TraderRegen);
    default AddItemSpec(GameplayTag::Item_Property_NonLootUnkillable);
}

UCLASS()
class UItFo_Potion_Health_03: UItemDefinition
{
    default m_Name = "ItFo_Potion_Health_03";
    default m_ItemVisual = n"Blueprint'/Game/Items/Potion/BP_ItFo_Potion_Health_03_Visual.BP_ItFo_Potion_Health_03_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Potion/BP_ItFo_Potion_Health_03_World.BP_ItFo_Potion_Health_03_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItFo_Potion_Health_03.T_ItemIcon_ItFo_Potion_Health_03";
    default m_Value = 50;
    default m_MaxStack = 99;
    default m_Weight = 0.15f;
    default AddOnConsume(UGE_Item_Heal_Insta::StaticClass()).AddMag(GameplayTag::GE_Param_Heal, 100.0f);
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Potion);
    default AddItemSpec(GameplayTag::Item_Property_Consumable);
    default AddItemSpec(GameplayTag::Item_Property_QuickConsumable);
    default AddItemSpec(GameplayTag::Item_Property_Throwable);
    default AddItemSpec(GameplayTag::Item_Property_Size_Small);
    default AddItemSpec(GameplayTag::Item_Property_TraderRegen);
    default AddItemSpec(GameplayTag::Item_Property_NonLootUnkillable);
}

UCLASS()
class UItFo_Potion_Health_Perma_01: UItemDefinition
{
    default m_Name = "ItFo_Potion_Health_Perma_01";
    default m_ItemVisual = n"Blueprint'/Game/Items/Potion/BP_ItFo_Potion_Health_Perma_01_Visual.BP_ItFo_Potion_Health_Perma_01_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Potion/BP_ItFo_Potion_Health_Perma_01_World.BP_ItFo_Potion_Health_Perma_01_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItFo_Potion_Health_Perma_01.T_ItemIcon_ItFo_Potion_Health_Perma_01";
    default m_Value = 300;
    default m_MaxStack = 99;
    default m_Weight = 0.15f;
    default AddOnConsume(UGE_Item_MaxHeal_Insta::StaticClass()).AddMag(GameplayTag::GE_Param_MaxHeal, 5.0f);
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Potion);
    default AddItemSpec(GameplayTag::Item_Property_Consumable);
    default AddItemSpec(GameplayTag::Item_Property_QuickConsumable);
    default AddItemSpec(GameplayTag::Item_Property_Throwable);
    default AddItemSpec(GameplayTag::Item_Property_Size_Small);
}

UCLASS()
class UItFo_Potion_Health_Perma_02: UItemDefinition
{
    default m_Name = "ItFo_Potion_Health_Perma_02";
    default m_ItemVisual = n"Blueprint'/Game/Items/Potion/BP_ItFo_Potion_Health_Perma_02_Visual.BP_ItFo_Potion_Health_Perma_02_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Potion/BP_ItFo_Potion_Health_Perma_02_World.BP_ItFo_Potion_Health_Perma_02_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItFo_Potion_Health_Perma_02.T_ItemIcon_ItFo_Potion_Health_Perma_02";
    default m_Value = 600;
    default m_MaxStack = 99;
    default m_Weight = 0.15f;
    default AddOnConsume(UGE_Item_MaxHeal_Insta::StaticClass()).AddMag(GameplayTag::GE_Param_MaxHeal, 10.0f);
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Potion);
    default AddItemSpec(GameplayTag::Item_Property_Consumable);
    default AddItemSpec(GameplayTag::Item_Property_QuickConsumable);
    default AddItemSpec(GameplayTag::Item_Property_Throwable);
    default AddItemSpec(GameplayTag::Item_Property_Size_Small);
}

UCLASS()
class UItFo_Potion_Health_Perma_03: UItemDefinition
{
    default m_Name = "ItFo_Potion_Health_Perma_03";
    default m_ItemVisual = n"Blueprint'/Game/Items/Potion/BP_ItFo_Potion_Health_Perma_03_Visual.BP_ItFo_Potion_Health_Perma_03_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Potion/BP_ItFo_Potion_Health_Perma_03_World.BP_ItFo_Potion_Health_Perma_03_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItFo_Potion_Health_Perma_03.T_ItemIcon_ItFo_Potion_Health_Perma_03";
    default m_Value = 900;
    default m_MaxStack = 99;
    default m_Weight = 0.15f;
    default AddOnConsume(UGE_Item_MaxHeal_Insta::StaticClass()).AddMag(GameplayTag::GE_Param_MaxHeal, 15.0f);
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Potion);
    default AddItemSpec(GameplayTag::Item_Property_Consumable);
    default AddItemSpec(GameplayTag::Item_Property_QuickConsumable);
    default AddItemSpec(GameplayTag::Item_Property_Throwable);
    default AddItemSpec(GameplayTag::Item_Property_Size_Small);
}

UCLASS()
class UItFo_Potion_Health_Quick: UItemDefinition
{
    default m_Name = "ItFo_Potion_Health_Quick";
    default m_ItemVisual = n"Blueprint'/Game/Items/Potion/BP_ItFo_Potion_Health_Quick_Visual.BP_ItFo_Potion_Health_Quick_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Potion/BP_ItFo_Potion_Health_Quick_World.BP_ItFo_Potion_Health_Quick_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItFo_Potion_Health_Quick.T_ItemIcon_ItFo_Potion_Health_Quick";
    default m_Value = 15;
    default m_MaxStack = 99;
    default m_Weight = 0.15f;
    default AddOnConsume(UGE_Item_Heal_Insta::StaticClass()).AddMag(GameplayTag::GE_Param_Heal, 30.0f);
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Potion);
    default AddItemSpec(GameplayTag::Item_Property_Consumable);
    default AddItemSpec(GameplayTag::Item_Property_QuickConsumable);
    default AddItemSpec(GameplayTag::Item_Property_Throwable);
    default AddItemSpec(GameplayTag::Item_Property_Size_Small);
    default AddItemSpec(GameplayTag::Item_Property_TraderRegen);
}

UCLASS()
class UItFo_Potion_Mana_01: UItemDefinition
{
    default m_Name = "ItFo_Potion_Mana_01";
    default m_ItemVisual = n"Blueprint'/Game/Items/Potion/BP_ItFo_Potion_Mana_01_Visual.BP_ItFo_Potion_Mana_01_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Potion/BP_ItFo_Potion_Mana_01_World.BP_ItFo_Potion_Mana_01_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItFo_Potion_Mana_01.T_ItemIcon_ItFo_Potion_Mana_01";
    default m_Value = 24;
    default m_MaxStack = 99;
    default m_Weight = 0.15f;
    default AddOnConsume(UGE_Item_Mana_Insta::StaticClass()).AddMag(GameplayTag::GE_Param_Mana, 30.0f);
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Potion);
    default AddItemSpec(GameplayTag::Item_Property_Consumable);
    default AddItemSpec(GameplayTag::Item_Property_QuickConsumable);
    default AddItemSpec(GameplayTag::Item_Property_Throwable);
    default AddItemSpec(GameplayTag::Item_Property_Size_Small);
    default AddItemSpec(GameplayTag::Item_Property_TraderRegen);
    default AddItemSpec(GameplayTag::Item_Property_NonLootUnkillable);
}

UCLASS()
class UItFo_Potion_Mana_02: UItemDefinition
{
    default m_Name = "ItFo_Potion_Mana_02";
    default m_ItemVisual = n"Blueprint'/Game/Items/Potion/BP_ItFo_Potion_Mana_02_Visual.BP_ItFo_Potion_Mana_02_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Potion/BP_ItFo_Potion_Mana_02_World.BP_ItFo_Potion_Mana_02_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItFo_Potion_Mana_02.T_ItemIcon_ItFo_Potion_Mana_02";
    default m_Value = 44;
    default m_MaxStack = 99;
    default m_Weight = 0.15f;
    default AddOnConsume(UGE_Item_Mana_Insta::StaticClass()).AddMag(GameplayTag::GE_Param_Mana, 50.0f);
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Potion);
    default AddItemSpec(GameplayTag::Item_Property_Consumable);
    default AddItemSpec(GameplayTag::Item_Property_QuickConsumable);
    default AddItemSpec(GameplayTag::Item_Property_Throwable);
    default AddItemSpec(GameplayTag::Item_Property_Size_Small);
    default AddItemSpec(GameplayTag::Item_Property_TraderRegen);
    default AddItemSpec(GameplayTag::Item_Property_NonLootUnkillable);
}

UCLASS()
class UItFo_Potion_Mana_03: UItemDefinition
{
    default m_Name = "ItFo_Potion_Mana_03";
    default m_ItemVisual = n"Blueprint'/Game/Items/Potion/BP_ItFo_Potion_Mana_03_Visual.BP_ItFo_Potion_Mana_03_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Potion/BP_ItFo_Potion_Mana_03_World.BP_ItFo_Potion_Mana_03_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItFo_Potion_Mana_03.T_ItemIcon_ItFo_Potion_Mana_03";
    default m_Value = 65;
    default m_MaxStack = 99;
    default m_Weight = 0.15f;
    default AddOnConsume(UGE_Item_Mana_Insta::StaticClass()).AddMag(GameplayTag::GE_Param_Mana, 70.0f);
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Potion);
    default AddItemSpec(GameplayTag::Item_Property_Consumable);
    default AddItemSpec(GameplayTag::Item_Property_QuickConsumable);
    default AddItemSpec(GameplayTag::Item_Property_Throwable);
    default AddItemSpec(GameplayTag::Item_Property_Size_Small);
    default AddItemSpec(GameplayTag::Item_Property_TraderRegen);
    default AddItemSpec(GameplayTag::Item_Property_NonLootUnkillable);
}

UCLASS()
class UItFo_Potion_Mana_Perma_01: UItemDefinition
{
    default m_Name = "ItFo_Potion_Mana_Perma_01";
    default m_ItemVisual = n"Blueprint'/Game/Items/Potion/BP_ItFo_Potion_Mana_Perma_01_Visual.BP_ItFo_Potion_Mana_Perma_01_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Potion/BP_ItFo_Potion_Mana_Perma_01_World.BP_ItFo_Potion_Mana_Perma_01_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItFo_Potion_Mana_Perma_01.T_ItemIcon_ItFo_Potion_Mana_Perma_01";
    default m_Value = 300;
    default m_MaxStack = 99;
    default m_Weight = 0.15f;
    default AddOnConsume(UGE_Item_MaxMana_Insta::StaticClass()).AddMag(GameplayTag::GE_Param_MaxMana, 2.0f);
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Potion);
    default AddItemSpec(GameplayTag::Item_Property_Consumable);
    default AddItemSpec(GameplayTag::Item_Property_QuickConsumable);
    default AddItemSpec(GameplayTag::Item_Property_Throwable);
    default AddItemSpec(GameplayTag::Item_Property_Size_Small);
}

UCLASS()
class UItFo_Potion_Mana_Perma_02: UItemDefinition
{
    default m_Name = "ItFo_Potion_Mana_Perma_02";
    default m_ItemVisual = n"Blueprint'/Game/Items/Potion/BP_ItFo_Potion_Mana_Perma_02_Visual.BP_ItFo_Potion_Mana_Perma_02_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Potion/BP_ItFo_Potion_Mana_Perma_02_World.BP_ItFo_Potion_Mana_Perma_02_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItFo_Potion_Mana_Perma_02.T_ItemIcon_ItFo_Potion_Mana_Perma_02";
    default m_Value = 600;
    default m_MaxStack = 99;
    default m_Weight = 0.15f;
    default AddOnConsume(UGE_Item_MaxMana_Insta::StaticClass()).AddMag(GameplayTag::GE_Param_MaxMana, 4.0f);
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Potion);
    default AddItemSpec(GameplayTag::Item_Property_Consumable);
    default AddItemSpec(GameplayTag::Item_Property_QuickConsumable);
    default AddItemSpec(GameplayTag::Item_Property_Throwable);
    default AddItemSpec(GameplayTag::Item_Property_Size_Small);
}

UCLASS()
class UItFo_Potion_Mana_Perma_03: UItemDefinition
{
    default m_Name = "ItFo_Potion_Mana_Perma_03";
    default m_ItemVisual = n"Blueprint'/Game/Items/Potion/BP_ItFo_Potion_Mana_Perma_03_Visual.BP_ItFo_Potion_Mana_Perma_03_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Potion/BP_ItFo_Potion_Mana_Perma_03_World.BP_ItFo_Potion_Mana_Perma_03_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItFo_Potion_Mana_Perma_03.T_ItemIcon_ItFo_Potion_Mana_Perma_03";
    default m_Value = 900;
    default m_MaxStack = 99;
    default m_Weight = 0.15f;
    default AddOnConsume(UGE_Item_MaxMana_Insta::StaticClass()).AddMag(GameplayTag::GE_Param_MaxMana, 8.0f);
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Potion);
    default AddItemSpec(GameplayTag::Item_Property_Consumable);
    default AddItemSpec(GameplayTag::Item_Property_QuickConsumable);
    default AddItemSpec(GameplayTag::Item_Property_Throwable);
    default AddItemSpec(GameplayTag::Item_Property_Size_Small);
}

UCLASS()
class UItFo_Potion_Master_01: UItemDefinition
{
    default m_Name = "ItFo_Potion_Master_01";
    default m_ItemVisual = n"Blueprint'/Game/Items/Potion/BP_ItFo_Potion_Master_01_Visual.BP_ItFo_Potion_Master_01_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Potion/BP_ItFo_Potion_Master_01_World.BP_ItFo_Potion_Master_01_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItFo_Potion_Master_01.T_ItemIcon_ItFo_Potion_Master_01";
    default m_Value = 1200;
    default m_MaxStack = 99;
    default m_CanBeSpawned = true;
    default m_Weight = 0.15f;
    default SetItemType(GameplayTag::Item_Potion);
    default AddOnConsume(UGE_Item_Dexterity_Insta::StaticClass()).AddMag(GameplayTag::GE_Param_Dexterity, 2.0f);
    default AddOnConsume(UGE_Item_Strength_Insta::StaticClass()).AddMag(GameplayTag::GE_Param_Strength, 2.0f);
    default AddItemSpec(GameplayTag::Item_Property_Consumable);
    default AddItemSpec(GameplayTag::Item_Property_QuickConsumable);
    default AddItemSpec(GameplayTag::Item_Property_Throwable);
    default AddItemSpec(GameplayTag::Item_Property_Size_Small);
}

UCLASS()
class UItFo_Potion_Master_02: UItemDefinition
{
    default m_Name = "ItFo_Potion_Master_02";
    default m_ItemVisual = n"Blueprint'/Game/Items/Potion/BP_ItFo_Potion_Master_02_Visual.BP_ItFo_Potion_Master_02_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Potion/BP_ItFo_Potion_Master_02_World.BP_ItFo_Potion_Master_02_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItFo_Potion_Master_02.T_ItemIcon_ItFo_Potion_Master_02";
    default m_Value = 1600;
    default m_MaxStack = 99;
    default m_Weight = 0.15f;
    default AddOnConsume(UGE_Item_Dexterity_Insta::StaticClass()).AddMag(GameplayTag::GE_Param_Dexterity, 4.0f);
    default AddOnConsume(UGE_Item_Strength_Insta::StaticClass()).AddMag(GameplayTag::GE_Param_Strength, 4.0f);
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Potion);
    default AddItemSpec(GameplayTag::Item_Property_Consumable);
    default AddItemSpec(GameplayTag::Item_Property_QuickConsumable);
    default AddItemSpec(GameplayTag::Item_Property_Throwable);
    default AddItemSpec(GameplayTag::Item_Property_Size_Small);
}

UCLASS()
class UItFo_Potion_Orcmedicine: UItemDefinition
{
    default m_Name = "ItFo_Potion_Orcmedicine";
    default m_ItemVisual = n"Blueprint'/Game/Items/Potion/BP_ItFo_Potion_Orcmedicine_Visual.BP_ItFo_Potion_Orcmedicine_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Potion/BP_ItFo_Potion_Orcmedicine_World.BP_ItFo_Potion_Orcmedicine_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItFo_Potion_Orcmedicine.T_ItemIcon_ItFo_Potion_Orcmedicine";
    default m_Value = 0;
    default m_MaxStack = 99;
    default m_Weight = 0.15f;
    default AddOnConsume(UGE_Item_MaxHeal_Insta::StaticClass()).AddMag(GameplayTag::GE_Param_MaxHeal, 10.0f);
    default AddOnConsume(UGE_Item_MaxMana_Insta::StaticClass()).AddMag(GameplayTag::GE_Param_MaxMana, 4.0f);
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Potion);
    default AddItemSpec(GameplayTag::Item_Property_Consumable);
    default AddItemSpec(GameplayTag::Item_Property_QuickConsumable);
    default AddItemSpec(GameplayTag::Item_Property_Throwable);
    default AddItemSpec(GameplayTag::Item_Property_Size_Small);
}

UCLASS()
class UItFo_Potion_Strength_01: UItemDefinition
{
    default m_Name = "ItFo_Potion_Strength_01";
    default m_ItemVisual = n"Blueprint'/Game/Items/Potion/BP_ItFo_Potion_Strength_01_Visual.BP_ItFo_Potion_Strength_01_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Potion/BP_ItFo_Potion_Strength_01_World.BP_ItFo_Potion_Strength_01_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItFo_Potion_Strength_01.T_ItemIcon_ItFo_Potion_Strength_01";
    default m_Value = 200;
    default m_MaxStack = 99;
    default m_Weight = 0.15f;
    default AddOnConsume(UGE_Item_Strength_Insta::StaticClass()).AddMag(GameplayTag::GE_Param_Strength, 1.0f);
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Potion);
    default AddItemSpec(GameplayTag::Item_Property_Consumable);
    default AddItemSpec(GameplayTag::Item_Property_QuickConsumable);
    default AddItemSpec(GameplayTag::Item_Property_Throwable);
    default AddItemSpec(GameplayTag::Item_Property_Size_Small);
}

UCLASS()
class UItFo_Potion_Strength_02: UItemDefinition
{
    default m_Name = "ItFo_Potion_Strength_02";
    default m_ItemVisual = n"Blueprint'/Game/Items/Potion/BP_ItFo_Potion_Strength_02_Visual.BP_ItFo_Potion_Strength_02_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Potion/BP_ItFo_Potion_Strength_02_World.BP_ItFo_Potion_Strength_02_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItFo_Potion_Strength_02.T_ItemIcon_ItFo_Potion_Strength_02";
    default m_Value = 400;
    default m_MaxStack = 99;
    default m_Weight = 0.15f;
    default AddOnConsume(UGE_Item_Strength_Insta::StaticClass()).AddMag(GameplayTag::GE_Param_Strength, 2.0f);
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Potion);
    default AddItemSpec(GameplayTag::Item_Property_Consumable);
    default AddItemSpec(GameplayTag::Item_Property_QuickConsumable);
    default AddItemSpec(GameplayTag::Item_Property_Throwable);
    default AddItemSpec(GameplayTag::Item_Property_Size_Small);
}

UCLASS()
class UItFo_Potion_Strength_03: UItemDefinition
{
    default m_Name = "ItFo_Potion_Strength_03";
    default m_ItemVisual = n"Blueprint'/Game/Items/Potion/BP_ItFo_Potion_Strength_03_Visual.BP_ItFo_Potion_Strength_03_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Potion/BP_ItFo_Potion_Strength_03_World.BP_ItFo_Potion_Strength_03_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItFo_Potion_Strength_03.T_ItemIcon_ItFo_Potion_Strength_03";
    default m_Value = 1600;
    default m_MaxStack = 99;
    default m_Weight = 0.15f;
    default AddOnConsume(UGE_Item_Strength_Insta::StaticClass()).AddMag(GameplayTag::GE_Param_Strength, 5.0f);
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Potion);
    default AddItemSpec(GameplayTag::Item_Property_Consumable);
    default AddItemSpec(GameplayTag::Item_Property_QuickConsumable);
    default AddItemSpec(GameplayTag::Item_Property_Throwable);
    default AddItemSpec(GameplayTag::Item_Property_Size_Small);
}

