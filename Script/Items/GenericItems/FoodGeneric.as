
UCLASS()
class UItAt_Meatbug_01: UItemDefinition
{
    default m_Name = "ItAt_Meatbug_01";
    default m_ItemVisual = n"Blueprint'/Game/Items/Food/BP_ItAt_Meatbug_01_Visual.BP_ItAt_Meatbug_01_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Food/BP_ItAt_Meatbug_01_World.BP_ItAt_Meatbug_01_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItAt_Meatbug_01.T_ItemIcon_ItAt_Meatbug_01";
    default m_Value = 2;
    default m_MaxStack = 99;
    default m_Weight = 0.1f;
    default AddOnConsume(UGE_Item_Heal_Overtime::StaticClass()).AddMag(GameplayTag::GE_Param_Heal, 1.0f).AddMag(GameplayTag::GE_Param_Duration, 1);
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Food);
    default AddItemSpec(GameplayTag::Item_Property_Consumable);
    default AddItemSpec(GameplayTag::Item_Property_QuickConsumable);
    default AddItemSpec(GameplayTag::Item_Property_Throwable);
    default AddItemSpec(GameplayTag::Item_Property_Size_Small);
    default AddItemSpec(GameplayTag::Item_Property_TraderRegen);
    default AddItemSpec(GameplayTag::Food_Meat);
    default AddPossibleActionAfterDrop(GameplayTag::Action_Eat_Item);
}

UCLASS()
class UItFo_Apple: UItemDefinition
{
    default m_Name = "ItFo_Apple";
    default m_ItemVisual = n"Blueprint'/Game/Items/Food/BP_ItFo_Apple_Visual.BP_ItFo_Apple_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Food/BP_ItFo_Apple_World.BP_ItFo_Apple_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItFo_Apple.T_ItemIcon_ItFo_Apple";
    default m_Value = 4;
    default m_MaxStack = 99;
    default m_Weight = 0.1f;
    default AddOnConsume(UGE_Item_Heal_Overtime::StaticClass()).AddMag(GameplayTag::GE_Param_Heal, 1.0f).AddMag(GameplayTag::GE_Param_Duration, 3);
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Food);
    default AddItemSpec(GameplayTag::Item_Property_Consumable);
    default AddItemSpec(GameplayTag::Item_Property_QuickConsumable);
    default AddItemSpec(GameplayTag::Item_Property_Throwable);
    default AddItemSpec(GameplayTag::Item_Property_Size_Small);
    default AddItemSpec(GameplayTag::Item_Property_TraderRegen);
    default AddItemSpec(GameplayTag::Food_Fruit);
    default AddPossibleActionAfterDrop(GameplayTag::Action_Eat_Item);
}

UCLASS()
class UItFo_Cabbage: UItemDefinition
{
    default m_Name = "ItFo_Cabbage";
    default m_ItemVisual = n"Blueprint'/Game/Items/Food/BP_ItFo_Cabbage_Visual.BP_ItFo_Cabbage_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Food/BP_ItFo_Cabbage_World.BP_ItFo_Cabbage_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItFo_Cabbage.T_ItemIcon_ItFo_Cabbage";
    default m_Value = 3;
    default m_MaxStack = 99;
    default m_Weight = 0.2f;
    default AddOnConsume(UGE_Item_Heal_Overtime::StaticClass()).AddMag(GameplayTag::GE_Param_Heal, 1.0f).AddMag(GameplayTag::GE_Param_Duration, 2);
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Food);
    default AddItemSpec(GameplayTag::Item_Property_Consumable);
    default AddItemSpec(GameplayTag::Item_Property_QuickConsumable);
    default AddItemSpec(GameplayTag::Item_Property_Throwable);
    default AddItemSpec(GameplayTag::Item_Property_Size_Small);
    default AddItemSpec(GameplayTag::Item_Property_TraderRegen);
    default AddItemSpec(GameplayTag::Food_Vegetable);
    default AddPossibleActionAfterDrop(GameplayTag::Action_Eat_Item);
}

UCLASS()
class UItFo_Carrot: UItemDefinition
{
    default m_Name = "ItFo_Carrot";
    default m_ItemVisual = n"Blueprint'/Game/Items/Food/BP_ItFo_Carrot_Visual.BP_ItFo_Carrot_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Food/BP_ItFo_Carrot_World.BP_ItFo_Carrot_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItFo_Carrot.T_ItemIcon_ItFo_Carrot";
    default m_Value = 3;
    default m_MaxStack = 99;
    default m_Weight = 0.1f;
    default AddOnConsume(UGE_Item_Heal_Overtime::StaticClass()).AddMag(GameplayTag::GE_Param_Heal, 1.0f).AddMag(GameplayTag::GE_Param_Duration, 2);
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Food);
    default AddItemSpec(GameplayTag::Item_Property_Consumable);
    default AddItemSpec(GameplayTag::Item_Property_QuickConsumable);
    default AddItemSpec(GameplayTag::Item_Property_Throwable);
    default AddItemSpec(GameplayTag::Item_Property_Size_Small);
    default AddItemSpec(GameplayTag::Item_Property_TraderRegen);
    default AddItemSpec(GameplayTag::Food_Vegetable);
    default AddPossibleActionAfterDrop(GameplayTag::Action_Eat_Item);
}

UCLASS()
class UItFo_Cheese: UItemDefinition
{
    default m_Name = "ItFo_Cheese";
    default m_ItemVisual = n"Blueprint'/Game/Items/Food/BP_ItFo_Cheese_Visual.BP_ItFo_Cheese_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Food/BP_ItFo_Cheese_World.BP_ItFo_Cheese_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItFo_Cheese.T_ItemIcon_ItFo_Cheese";
    default m_Value = 8;
    default m_MaxStack = 99;
    default m_Weight = 0.2f;
    default AddOnConsume(UGE_Item_Heal_Overtime::StaticClass()).AddMag(GameplayTag::GE_Param_Heal, 1.0f).AddMag(GameplayTag::GE_Param_Duration, 7);
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Food);
    default AddItemSpec(GameplayTag::Item_Property_Consumable);
    default AddItemSpec(GameplayTag::Item_Property_QuickConsumable);
    default AddItemSpec(GameplayTag::Item_Property_Throwable);
    default AddItemSpec(GameplayTag::Item_Property_Size_Small);
    default AddItemSpec(GameplayTag::Item_Property_TraderRegen);
    default AddItemSpec(GameplayTag::Food_Cooked);
    default AddPossibleActionAfterDrop(GameplayTag::Action_Eat_Item);
}

UCLASS()
class UItFo_Crawlersoup: UItemDefinition
{
    default m_Name = "ItFo_Crawlersoup";
    default m_ItemVisual = n"Blueprint'/Game/Items/Food/BP_ItFo_Crawlersoup_Visual.BP_ItFo_Crawlersoup_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Food/BP_ItFo_Crawlersoup_World.BP_ItFo_Crawlersoup_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItFo_Crawlersoup.T_ItemIcon_ItFo_Crawlersoup";
    default m_Value = 15;
    default m_MaxStack = 99;
    default m_Weight = 0.4f;
    default AddOnConsume(UGE_Item_Heal_Overtime::StaticClass()).AddMag(GameplayTag::GE_Param_Heal, 1.0f).AddMag(GameplayTag::GE_Param_Duration, 20);
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Food_Bowl);
    default AddItemSpec(GameplayTag::Item_Property_Consumable);
    default AddItemSpec(GameplayTag::Item_Property_Size_Small);
    default AddItemSpec(GameplayTag::Item_Property_TraderRegen);
    default AddItemSpec(GameplayTag::Food_Cooked);
    default AddPossibleActionAfterDrop(GameplayTag::Action_Eat_Item);
}

UCLASS()
class UItFo_DragonsbreathStew: UItemDefinition
{
    default m_Name = "ItFo_DragonsbreathStew";
    default m_ItemVisual = n"Blueprint'/Game/Items/Food/BP_ItFo_DragonsbreathStew_Visual.BP_ItFo_DragonsbreathStew_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Food/BP_ItFo_DragonsbreathStew_World.BP_ItFo_DragonsbreathStew_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItFo_DragonsbreathStew.T_ItemIcon_ItFo_DragonsbreathStew";
    default m_Value = 28;
    default m_MaxStack = 99;
    default m_Weight = 0.4f;
    default AddOnConsume(UGE_Item_Heal_Overtime::StaticClass()).AddMag(GameplayTag::GE_Param_Heal, 1.0f).AddMag(GameplayTag::GE_Param_Duration, 60);
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Food_Bowl);
    default AddItemSpec(GameplayTag::Item_Property_Consumable);
    default AddItemSpec(GameplayTag::Item_Property_Size_Small);
    default AddItemSpec(GameplayTag::Item_Property_TraderRegen);
    default AddItemSpec(GameplayTag::Food_Cooked);
    default AddPossibleActionAfterDrop(GameplayTag::Action_Eat_Item);
}

UCLASS()
class UItFo_Grilledscavenger: UItemDefinition
{
    default m_Name = "ItFo_Grilledscavenger";
    default m_ItemVisual = n"Blueprint'/Game/Items/Food/BP_ItFo_Grilledscavenger_Visual.BP_ItFo_Grilledscavenger_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Food/BP_ItFo_Grilledscavenger_World.BP_ItFo_Grilledscavenger_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItFo_Grilledscavenger.T_ItemIcon_ItFo_Grilledscavenger";
    default m_Value = 7;
    default m_MaxStack = 99;
    default m_Weight = 0.2f;
    default AddOnConsume(UGE_Item_Heal_Overtime::StaticClass()).AddMag(GameplayTag::GE_Param_Heal, 1.0f).AddMag(GameplayTag::GE_Param_Duration, 10);
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Food);
    default AddItemSpec(GameplayTag::Item_Property_Consumable);
    default AddItemSpec(GameplayTag::Item_Property_QuickConsumable);
    default AddItemSpec(GameplayTag::Item_Property_Throwable);
    default AddItemSpec(GameplayTag::Item_Property_Size_Small);
    default AddItemSpec(GameplayTag::Item_Property_TraderRegen);
    default AddItemSpec(GameplayTag::Food_Meat);
    default AddPossibleActionAfterDrop(GameplayTag::Action_Eat_Item);
}

UCLASS()
class UItFo_Lemon: UItemDefinition
{
    default m_Name = "ItFo_Lemon";
    default m_ItemVisual = n"Blueprint'/Game/Items/Food/BP_ItFo_Lemon_Visual.BP_ItFo_Lemon_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Food/BP_ItFo_Lemon_World.BP_ItFo_Lemon_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItFo_Lemon.T_ItemIcon_ItFo_Lemon";
    default m_Value = 2;
    default m_MaxStack = 99;
    default m_Weight = 0.1f;
    default AddOnConsume(UGE_Item_Heal_Overtime::StaticClass()).AddMag(GameplayTag::GE_Param_Heal, 1.0f).AddMag(GameplayTag::GE_Param_Duration, 1);
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Food);
    default AddItemSpec(GameplayTag::Item_Property_Consumable);
    default AddItemSpec(GameplayTag::Item_Property_QuickConsumable);
    default AddItemSpec(GameplayTag::Item_Property_Throwable);
    default AddItemSpec(GameplayTag::Item_Property_Size_Small);
    default AddItemSpec(GameplayTag::Item_Property_TraderRegen);
    default AddItemSpec(GameplayTag::Food_Fruit);
    default AddPossibleActionAfterDrop(GameplayTag::Action_Eat_Item);
}

UCLASS()
class UItFo_Loaf: UItemDefinition
{
    default m_Name = "ItFo_Loaf";
    default m_ItemVisual = n"Blueprint'/Game/Items/Food/BP_ItFo_Loaf_Visual.BP_ItFo_Loaf_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Food/BP_ItFo_Loaf_World.BP_ItFo_Loaf_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItFo_Loaf.T_ItemIcon_ItFo_Loaf";
    default m_Value = 6;
    default m_MaxStack = 99;
    default m_Weight = 0.2f;
    default AddOnConsume(UGE_Item_Heal_Overtime::StaticClass()).AddMag(GameplayTag::GE_Param_Heal, 1.0f).AddMag(GameplayTag::GE_Param_Duration, 5);
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Food);
    default AddItemSpec(GameplayTag::Item_Property_Consumable);
    default AddItemSpec(GameplayTag::Item_Property_QuickConsumable);
    default AddItemSpec(GameplayTag::Item_Property_Throwable);
    default AddItemSpec(GameplayTag::Item_Property_Size_Small);
    default AddItemSpec(GameplayTag::Item_Property_TraderRegen);
    default AddItemSpec(GameplayTag::Food_Cooked);
    default AddPossibleActionAfterDrop(GameplayTag::Action_Eat_Item);
}

UCLASS()
class UItFo_Meatbugragout: UItemDefinition
{
    default m_Name = "ItFo_Meatbugragout";
    default m_ItemVisual = n"Blueprint'/Game/Items/Food/BP_ItFo_Meatbugragout_Visual.BP_ItFo_Meatbugragout_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Food/BP_ItFo_Meatbugragout_World.BP_ItFo_Meatbugragout_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItFo_Meatbugragout.T_ItemIcon_ItFo_Meatbugragout";
    default m_Value = 7;
    default m_MaxStack = 99;
    default m_Weight = 0.4f;
    default AddOnConsume(UGE_Item_Heal_Overtime::StaticClass()).AddMag(GameplayTag::GE_Param_Heal, 1.0f).AddMag(GameplayTag::GE_Param_Duration, 12);
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Food_Bowl);
    default AddItemSpec(GameplayTag::Item_Property_Consumable);
    default AddItemSpec(GameplayTag::Item_Property_Size_Small);
    default AddItemSpec(GameplayTag::Item_Property_TraderRegen);
    default AddItemSpec(GameplayTag::Food_Cooked);
    default AddPossibleActionAfterDrop(GameplayTag::Action_Eat_Item);
}

UCLASS()
class UItFo_Meatbugsauteed: UItemDefinition
{
    default m_Name = "ItFo_Meatbugsauteed";
    default m_ItemVisual = n"Blueprint'/Game/Items/Food/BP_ItFo_Meatbugsauteed_Visual.BP_ItFo_Meatbugsauteed_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Food/BP_ItFo_Meatbugsauteed_World.BP_ItFo_Meatbugsauteed_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItFo_Meatbugsauteed.T_ItemIcon_ItFo_Meatbugsauteed";
    default m_Value = 8;
    default m_MaxStack = 99;
    default m_Weight = 0.4f;
    default AddOnConsume(UGE_Item_Heal_Overtime::StaticClass()).AddMag(GameplayTag::GE_Param_Heal, 1.0f).AddMag(GameplayTag::GE_Param_Duration, 15);
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Food_Bowl);
    default AddItemSpec(GameplayTag::Item_Property_Consumable);
    default AddItemSpec(GameplayTag::Item_Property_Size_Small);
    default AddItemSpec(GameplayTag::Item_Property_TraderRegen);
    default AddItemSpec(GameplayTag::Food_Cooked);
    default AddPossibleActionAfterDrop(GameplayTag::Action_Eat_Item);
}

UCLASS()
class UItFo_MushroomStew: UItemDefinition
{
    default m_Name = "ItFo_MushroomStew";
    default m_ItemVisual = n"Blueprint'/Game/Items/Food/BP_ItFo_MushroomStew_Visual.BP_ItFo_MushroomStew_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Food/BP_ItFo_MushroomStew_World.BP_ItFo_MushroomStew_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItFo_MushroomStew.T_ItemIcon_ItFo_MushroomStew";
    default m_Value = 32;
    default m_MaxStack = 99;
    default m_Weight = 0.4f;
    default AddOnConsume(UGE_Item_Heal_Overtime::StaticClass()).AddMag(GameplayTag::GE_Param_Heal, 1.0f).AddMag(GameplayTag::GE_Param_Duration, 50);
    default AddOnConsume(UGE_Item_Mana_Overtime::StaticClass()).AddMag(GameplayTag::GE_Param_Mana, 1.0f).AddMag(GameplayTag::GE_Param_Duration, 25);
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Food_Bowl);
    default AddItemSpec(GameplayTag::Item_Property_Consumable);
    default AddItemSpec(GameplayTag::Item_Property_Size_Small);
    default AddItemSpec(GameplayTag::Item_Property_TraderRegen);
    default AddItemSpec(GameplayTag::Food_Cooked);
    default AddPossibleActionAfterDrop(GameplayTag::Action_Eat_Item);
}

UCLASS()
class UItFo_Mutton_01: UItemDefinition
{
    default m_Name = "ItFo_Mutton_01";
    default m_ItemVisual = n"Blueprint'/Game/Items/Food/BP_ItFo_Mutton_01_Visual.BP_ItFo_Mutton_01_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Food/BP_ItFo_Mutton_01_World.BP_ItFo_Mutton_01_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItFo_Mutton_01.T_ItemIcon_ItFo_Mutton_01";
    default m_Value = 7;
    default m_MaxStack = 99;
    default m_Weight = 0.2f;
    default AddOnConsume(UGE_Item_Heal_Overtime::StaticClass()).AddMag(GameplayTag::GE_Param_Heal, 1.0f).AddMag(GameplayTag::GE_Param_Duration, 15);
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Food);
    default AddItemSpec(GameplayTag::Item_Property_Consumable);
    default AddItemSpec(GameplayTag::Item_Property_QuickConsumable);
    default AddItemSpec(GameplayTag::Item_Property_Throwable);
    default AddItemSpec(GameplayTag::Item_Property_Size_Small);
    default AddItemSpec(GameplayTag::Item_Property_TraderRegen);
    default AddItemSpec(GameplayTag::Food_Meat);
    default AddPossibleActionAfterDrop(GameplayTag::Action_Eat_Item);
}

UCLASS()
class UItFo_Mutton_02: UItemDefinition
{
    default m_Name = "ItFo_Mutton_02";
    default m_ItemVisual = n"Blueprint'/Game/Items/Food/BP_ItFo_Mutton_02_Visual.BP_ItFo_Mutton_02_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Food/BP_ItFo_Mutton_02_World.BP_ItFo_Mutton_02_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItFo_Mutton_02.T_ItemIcon_ItFo_Mutton_02";
    default m_Value = 7;
    default m_MaxStack = 99;
    default m_Weight = 0.2f;
    default AddOnConsume(UGE_Item_Heal_Overtime::StaticClass()).AddMag(GameplayTag::GE_Param_Heal, 1.0f).AddMag(GameplayTag::GE_Param_Duration, 8);
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Food);
    default AddItemSpec(GameplayTag::Item_Property_Consumable);
    default AddItemSpec(GameplayTag::Item_Property_QuickConsumable);
    default AddItemSpec(GameplayTag::Item_Property_Throwable);
    default AddItemSpec(GameplayTag::Item_Property_Size_Small);
    default AddItemSpec(GameplayTag::Item_Property_TraderRegen);
    default AddItemSpec(GameplayTag::Food_Meat);
    default AddPossibleActionAfterDrop(GameplayTag::Action_Eat_Item);
}

UCLASS()
class UItFo_Muttonraw: UItemDefinition
{
    default m_Name = "ItFo_Muttonraw";
    default m_ItemVisual = n"Blueprint'/Game/Items/Food/BP_ItFo_Muttonraw_Visual.BP_ItFo_Muttonraw_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Food/BP_ItFo_Muttonraw_World.BP_ItFo_Muttonraw_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItFo_Muttonraw.T_ItemIcon_ItFo_Muttonraw";
    default m_Value = 4;
    default m_MaxStack = 99;
    default m_Weight = 0.2f;
    default AddOnConsume(UGE_Item_Heal_Overtime::StaticClass()).AddMag(GameplayTag::GE_Param_Heal, 1.0f).AddMag(GameplayTag::GE_Param_Duration, 2);
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Food);
    default AddItemSpec(GameplayTag::Item_Property_Consumable);
    default AddItemSpec(GameplayTag::Item_Property_QuickConsumable);
    default AddItemSpec(GameplayTag::Item_Property_Throwable);
    default AddItemSpec(GameplayTag::Item_Property_Size_Small);
    default AddItemSpec(GameplayTag::Item_Property_TraderRegen);
    default AddItemSpec(GameplayTag::Food_Meat);
    default AddPossibleActionAfterDrop(GameplayTag::Action_Eat_Item);
}

UCLASS()
class UItFo_Onion: UItemDefinition
{
    default m_Name = "ItFo_Onion";
    default m_ItemVisual = n"Blueprint'/Game/Items/Food/BP_ItFo_Onion_Visual.BP_ItFo_Onion_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Food/BP_ItFo_Onion_World.BP_ItFo_Onion_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItFo_Onion.T_ItemIcon_ItFo_Onion";
    default m_Value = 2;
    default m_MaxStack = 99;
    default m_Weight = 0.1f;
    default AddOnConsume(UGE_Item_Heal_Overtime::StaticClass()).AddMag(GameplayTag::GE_Param_Heal, 1.0f).AddMag(GameplayTag::GE_Param_Duration, 1);
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Food);
    default AddItemSpec(GameplayTag::Item_Property_Consumable);
    default AddItemSpec(GameplayTag::Item_Property_QuickConsumable);
    default AddItemSpec(GameplayTag::Item_Property_Throwable);
    default AddItemSpec(GameplayTag::Item_Property_Size_Small);
    default AddItemSpec(GameplayTag::Item_Property_TraderRegen);
    default AddItemSpec(GameplayTag::Food_Vegetable);
    default AddPossibleActionAfterDrop(GameplayTag::Action_Eat_Item);
}

UCLASS()
class UItFo_Ottostew: UItemDefinition
{
    default m_Name = "ItFo_Ottostew";
    default m_ItemVisual = n"Blueprint'/Game/Items/Food/BP_ItFo_Ottostew_Visual.BP_ItFo_Ottostew_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Food/BP_ItFo_Ottostew_World.BP_ItFo_Ottostew_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItFo_Ottostew.T_ItemIcon_ItFo_Ottostew";
    default m_Value = 32;
    default m_MaxStack = 99;
    default m_Weight = 0.4f;
    default AddOnConsume(UGE_Item_Heal_Overtime::StaticClass()).AddMag(GameplayTag::GE_Param_Heal, 1.0f).AddMag(GameplayTag::GE_Param_Duration, 75);
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Food_Bowl);
    default AddItemSpec(GameplayTag::Item_Property_Consumable);
    default AddItemSpec(GameplayTag::Item_Property_Size_Small);
    default AddItemSpec(GameplayTag::Food_Cooked);
    default AddPossibleActionAfterDrop(GameplayTag::Action_Eat_Item);
}

UCLASS()
class UItFo_Pear: UItemDefinition
{
    default m_Name = "ItFo_Pear";
    default m_ItemVisual = n"Blueprint'/Game/Items/Food/BP_ItFo_Pear_Visual.BP_ItFo_Pear_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Food/BP_ItFo_Pear_World.BP_ItFo_Pear_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItFo_Pear.T_ItemIcon_ItFo_Pear";
    default m_Value = 3;
    default m_MaxStack = 99;
    default m_Weight = 0.1f;
    default AddOnConsume(UGE_Item_Heal_Overtime::StaticClass()).AddMag(GameplayTag::GE_Param_Heal, 1.0f).AddMag(GameplayTag::GE_Param_Duration, 2);
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Food);
    default AddItemSpec(GameplayTag::Item_Property_Consumable);
    default AddItemSpec(GameplayTag::Item_Property_QuickConsumable);
    default AddItemSpec(GameplayTag::Item_Property_Throwable);
    default AddItemSpec(GameplayTag::Item_Property_Size_Small);
    default AddItemSpec(GameplayTag::Item_Property_TraderRegen);
    default AddItemSpec(GameplayTag::Food_Fruit);
    default AddPossibleActionAfterDrop(GameplayTag::Action_Eat_Item);
}

UCLASS()
class UItFo_Potato: UItemDefinition
{
    default m_Name = "ItFo_Potato";
    default m_ItemVisual = n"Blueprint'/Game/Items/Food/BP_ItFo_Potato_Visual.BP_ItFo_Potato_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Food/BP_ItFo_Potato_World.BP_ItFo_Potato_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItFo_Potato.T_ItemIcon_ItFo_Potato";
    default m_Value = 2;
    default m_MaxStack = 99;
    default m_Weight = 0.1f;
    default AddOnConsume(UGE_Item_Heal_Overtime::StaticClass()).AddMag(GameplayTag::GE_Param_Heal, 1.0f).AddMag(GameplayTag::GE_Param_Duration, 1);
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Food);
    default AddItemSpec(GameplayTag::Item_Property_Consumable);
    default AddItemSpec(GameplayTag::Item_Property_QuickConsumable);
    default AddItemSpec(GameplayTag::Item_Property_Throwable);
    default AddItemSpec(GameplayTag::Item_Property_Size_Small);
    default AddItemSpec(GameplayTag::Item_Property_TraderRegen);
    default AddItemSpec(GameplayTag::Food_Vegetable);
    default AddPossibleActionAfterDrop(GameplayTag::Action_Eat_Item);
}

UCLASS()
class UItFo_Potion_Beer: UItemDefinition
{
    default m_Name = "ItFo_Potion_Beer";
    default m_ItemVisual = n"Blueprint'/Game/Items/Food/BP_ItFo_Potion_Beer_Visual.BP_ItFo_Potion_Beer_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Food/BP_ItFo_Potion_Beer_World.BP_ItFo_Potion_Beer_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItFo_Potion_Beer.T_ItemIcon_ItFo_Potion_Beer";
    default m_Value = 10;
    default m_MaxStack = 99;
    default m_Weight = 0.3f;
    default AddOnConsume(UGE_Item_Heal_Overtime::StaticClass()).AddMag(GameplayTag::GE_Param_Heal, 1.0f).AddMag(GameplayTag::GE_Param_Duration, 7);
    default AddOnConsume(UGE_Item_Alcohol_Insta::StaticClass()).AddMag(GameplayTag::GE_Param_Alcohol, 20.0f);
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Potion);
    default AddItemSpec(GameplayTag::Item_Property_Consumable);
    default AddItemSpec(GameplayTag::Item_Property_QuickConsumable);
    default AddItemSpec(GameplayTag::Item_Property_Throwable);
    default AddItemSpec(GameplayTag::Item_Property_Size_Small);
    default AddItemSpec(GameplayTag::Item_Property_TraderRegen);
}

UCLASS()
class UItFo_Potion_Booze: UItemDefinition
{
    default m_Name = "ItFo_Potion_Booze";
    default m_ItemVisual = n"Blueprint'/Game/Items/Food/BP_ItFo_Potion_Booze_Visual.BP_ItFo_Potion_Booze_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Food/BP_ItFo_Potion_Booze_World.BP_ItFo_Potion_Booze_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItFo_Potion_Booze.T_ItemIcon_ItFo_Potion_Booze";
    default m_Value = 13;
    default m_MaxStack = 99;
    default m_Weight = 0.3f;
    default AddOnConsume(UGE_Item_Heal_Overtime::StaticClass()).AddMag(GameplayTag::GE_Param_Heal, 1.0f).AddMag(GameplayTag::GE_Param_Duration, 10);
    default AddOnConsume(UGE_Item_Alcohol_Insta::StaticClass()).AddMag(GameplayTag::GE_Param_Alcohol, 60.0f);
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Potion);
    default AddItemSpec(GameplayTag::Item_Property_Consumable);
    default AddItemSpec(GameplayTag::Item_Property_QuickConsumable);
    default AddItemSpec(GameplayTag::Item_Property_Throwable);
    default AddItemSpec(GameplayTag::Item_Property_Size_Small);
    default AddItemSpec(GameplayTag::Item_Property_TraderRegen);
}

UCLASS()
class UItFo_Potion_Strongbeer: UItemDefinition
{
    default m_Name = "ItFo_Potion_Strongbeer";
    default m_ItemVisual = n"Blueprint'/Game/Items/Food/BP_ItFo_Potion_Strongbeer_Visual.BP_ItFo_Potion_Strongbeer_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Food/BP_ItFo_Potion_Strongbeer_World.BP_ItFo_Potion_Strongbeer_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItFo_Potion_Strongbeer.T_ItemIcon_ItFo_Potion_Strongbeer";
    default m_Value = 30;
    default m_MaxStack = 99;
    default m_Weight = 0.3f;
    default AddOnConsume(UGE_Item_Heal_Overtime::StaticClass()).AddMag(GameplayTag::GE_Param_Heal, 1.0f).AddMag(GameplayTag::GE_Param_Duration, 15);
    default AddOnConsume(UGE_Item_Alcohol_Insta::StaticClass()).AddMag(GameplayTag::GE_Param_Alcohol, 40.0f);
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Potion);
    default AddItemSpec(GameplayTag::Item_Property_Consumable);
    default AddItemSpec(GameplayTag::Item_Property_QuickConsumable);
    default AddItemSpec(GameplayTag::Item_Property_Throwable);
    default AddItemSpec(GameplayTag::Item_Property_Size_Small);
    default AddItemSpec(GameplayTag::Item_Property_TraderRegen);
}

UCLASS()
class UItFo_Potion_Water_01: UItemDefinition
{
    default m_Name = "ItFo_Potion_Water_01";
    default m_ItemVisual = n"Blueprint'/Game/Items/Food/BP_ItFo_Potion_Water_01_Visual.BP_ItFo_Potion_Water_01_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Food/BP_ItFo_Potion_Water_01_World.BP_ItFo_Potion_Water_01_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItFo_Potion_Water_01.T_ItemIcon_ItFo_Potion_Water_01";
    default m_Value = 4;
    default m_MaxStack = 99;
    default m_Weight = 0.2f;
    default AddOnConsume(UGE_Item_Heal_Overtime::StaticClass()).AddMag(GameplayTag::GE_Param_Heal, 1.0f).AddMag(GameplayTag::GE_Param_Duration, 3);
    default AddOnConsume(UGE_Item_Mana_Overtime::StaticClass()).AddMag(GameplayTag::GE_Param_Mana, 1.0f).AddMag(GameplayTag::GE_Param_Duration, 3);
    default AddOnConsume(UGE_Item_AlcoholDrugDepletion_Overtime::StaticClass()).AddMag(GameplayTag::GE_Param_Alcohol, -1.0f).AddMag(GameplayTag::GE_Param_Duration, 3);
    default AddOnConsume(UGE_Item_SwampweedDrugDepletion_Overtime::StaticClass()).AddMag(GameplayTag::GE_Param_Swampweed, -1.0f).AddMag(GameplayTag::GE_Param_Duration, 3);
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Potion);
    default AddItemSpec(GameplayTag::Item_Property_Consumable);
    default AddItemSpec(GameplayTag::Item_Property_QuickConsumable);
    default AddItemSpec(GameplayTag::Item_Property_Throwable);
    default AddItemSpec(GameplayTag::Item_Property_Size_Small);
    default AddItemSpec(GameplayTag::Item_Property_TraderRegen);
}

UCLASS()
class UItFo_Potion_Wine: UItemDefinition
{
    default m_Name = "ItFo_Potion_Wine";
    default m_ItemVisual = n"Blueprint'/Game/Items/Food/BP_ItFo_Potion_Wine_Visual.BP_ItFo_Potion_Wine_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Food/BP_ItFo_Potion_Wine_World.BP_ItFo_Potion_Wine_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItFo_Potion_Wine.T_ItemIcon_ItFo_Potion_Wine";
    default m_Value = 15;
    default m_MaxStack = 99;
    default m_Weight = 0.3f;
    default AddOnConsume(UGE_Item_Heal_Overtime::StaticClass()).AddMag(GameplayTag::GE_Param_Heal, 1.0f).AddMag(GameplayTag::GE_Param_Duration, 12);
    default AddOnConsume(UGE_Item_Alcohol_Insta::StaticClass()).AddMag(GameplayTag::GE_Param_Alcohol, 50.0f);
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Potion);
    default AddItemSpec(GameplayTag::Item_Property_Consumable);
    default AddItemSpec(GameplayTag::Item_Property_QuickConsumable);
    default AddItemSpec(GameplayTag::Item_Property_Throwable);
    default AddItemSpec(GameplayTag::Item_Property_Size_Small);
    default AddItemSpec(GameplayTag::Item_Property_TraderRegen);
}

UCLASS()
class UItFo_Rice: UItemDefinition
{
    default m_Name = "ItFo_Rice";
    default m_ItemVisual = n"Blueprint'/Game/Items/Food/BP_ItFo_Rice_Visual.BP_ItFo_Rice_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Food/BP_ItFo_Rice_World.BP_ItFo_Rice_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItFo_Rice.T_ItemIcon_ItFo_Rice";
    default m_Value = 5;
    default m_MaxStack = 99;
    default m_Weight = 0.3f;
    default AddOnConsume(UGE_Item_Heal_Overtime::StaticClass()).AddMag(GameplayTag::GE_Param_Heal, 1.0f).AddMag(GameplayTag::GE_Param_Duration, 4);
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Food_Bowl);
    default AddItemSpec(GameplayTag::Item_Property_Consumable);
    default AddItemSpec(GameplayTag::Item_Property_Size_Small);
    default AddItemSpec(GameplayTag::Item_Property_TraderRegen);
    default AddItemSpec(GameplayTag::Food_Cooked);
    default AddPossibleActionAfterDrop(GameplayTag::Action_Eat_Item);
}

UCLASS()
class UItFo_Sausage: UItemDefinition
{
    default m_Name = "ItFo_Sausage";
    default m_ItemVisual = n"Blueprint'/Game/Items/Food/BP_ItFo_Sausage_Visual.BP_ItFo_Sausage_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Food/BP_ItFo_Sausage_World.BP_ItFo_Sausage_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItFo_Sausage.T_ItemIcon_ItFo_Sausage";
    default m_Value = 3;
    default m_MaxStack = 99;
    default m_Weight = 0.1f;
    default AddOnConsume(UGE_Item_Heal_Overtime::StaticClass()).AddMag(GameplayTag::GE_Param_Heal, 1.0f).AddMag(GameplayTag::GE_Param_Duration, 2);
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Food);
    default AddItemSpec(GameplayTag::Item_Property_Consumable);
    default AddItemSpec(GameplayTag::Item_Property_QuickConsumable);
    default AddItemSpec(GameplayTag::Item_Property_Throwable);
    default AddItemSpec(GameplayTag::Item_Property_Size_Small);
    default AddItemSpec(GameplayTag::Item_Property_TraderRegen);
    default AddItemSpec(GameplayTag::Food_Meat);
    default AddPossibleActionAfterDrop(GameplayTag::Action_Eat_Item);
}

UCLASS()
class UItFo_SeaforestBrew: UItemDefinition
{
    default m_Name = "ItFo_SeaforestBrew";
    default m_ItemVisual = n"Blueprint'/Game/Items/Food/BP_ItFo_SeaforestBrew_Visual.BP_ItFo_SeaforestBrew_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Food/BP_ItFo_SeaforestBrew_World.BP_ItFo_SeaforestBrew_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItFo_SeaforestBrew.T_ItemIcon_ItFo_SeaforestBrew";
    default m_Value = 45;
    default m_MaxStack = 99;
    default m_Weight = 0.3f;
    default AddOnConsume(UGE_Item_Heal_Overtime::StaticClass()).AddMag(GameplayTag::GE_Param_Heal, 1.0f).AddMag(GameplayTag::GE_Param_Duration, 80);
    default AddOnConsume(UGE_Item_Mana_Overtime::StaticClass()).AddMag(GameplayTag::GE_Param_Mana, 1.0f).AddMag(GameplayTag::GE_Param_Duration, 40);
    default AddOnConsume(UGE_Item_Alcohol_Insta::StaticClass()).AddMag(GameplayTag::GE_Param_Alcohol, 20.0f);
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Potion);
    default AddItemSpec(GameplayTag::Item_Property_Consumable);
    default AddItemSpec(GameplayTag::Item_Property_QuickConsumable);
    default AddItemSpec(GameplayTag::Item_Property_Throwable);
    default AddItemSpec(GameplayTag::Item_Property_Size_Small);
    default AddItemSpec(GameplayTag::Item_Property_TraderRegen);
    default AddItemSpec(GameplayTag::Food_Cooked);
    default AddPossibleActionAfterDrop(GameplayTag::Action_Eat_Item);
}

UCLASS()
class UItFo_Soup: UItemDefinition
{
    default m_Name = "ItFo_Soup";
    default m_ItemVisual = n"Blueprint'/Game/Items/Food/BP_ItFo_Soup_Visual.BP_ItFo_Soup_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Food/BP_ItFo_Soup_World.BP_ItFo_Soup_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItFo_Soup.T_ItemIcon_ItFo_Soup";
    default m_Value = 48;
    default m_MaxStack = 99;
    default m_Weight = 0.4f;
    default AddOnConsume(UGE_Item_Heal_Overtime::StaticClass()).AddMag(GameplayTag::GE_Param_Heal, 1.0f).AddMag(GameplayTag::GE_Param_Duration, 100);
    default AddOnConsume(UGE_Item_Mana_Overtime::StaticClass()).AddMag(GameplayTag::GE_Param_Mana, 1.0f).AddMag(GameplayTag::GE_Param_Duration, 50);
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Food_Bowl);
    default AddItemSpec(GameplayTag::Item_Property_Consumable);
    default AddItemSpec(GameplayTag::Item_Property_Size_Small);
    default AddItemSpec(GameplayTag::Item_Property_TraderRegen);
    default AddItemSpec(GameplayTag::Food_Cooked);
    default AddPossibleActionAfterDrop(GameplayTag::Action_Eat_Item);
}

UCLASS()
class UItFo_SyraRecipe: UItemDefinition
{
    default m_Name = "ItFo_SyraRecipe";
    default m_ItemVisual = n"Blueprint'/Game/Items/Food/BP_ItFo_SyraRecipe_Visual.BP_ItFo_SyraRecipe_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Food/BP_ItFo_SyraRecipe_World.BP_ItFo_SyraRecipe_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItFo_SyraRecipe.T_ItemIcon_ItFo_SyraRecipe";
    default m_Value = 55;
    default m_MaxStack = 99;
    default m_Weight = 0.4f;
    default AddOnConsume(UGE_Item_Heal_Overtime::StaticClass()).AddMag(GameplayTag::GE_Param_Heal, 1.0f).AddMag(GameplayTag::GE_Param_Duration, 100);
    default AddOnConsume(UGE_Item_Mana_Overtime::StaticClass()).AddMag(GameplayTag::GE_Param_Mana, 1.0f).AddMag(GameplayTag::GE_Param_Duration, 100);
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Food_Bowl);
    default AddItemSpec(GameplayTag::Item_Property_Consumable);
    default AddItemSpec(GameplayTag::Item_Property_Size_Small);
    default AddItemSpec(GameplayTag::Food_Cooked);
    default AddPossibleActionAfterDrop(GameplayTag::Action_Eat_Item);
}

UCLASS()
class UItFo_Whitemeat: UItemDefinition
{
    default m_Name = "ItFo_Whitemeat";
    default m_ItemVisual = n"Blueprint'/Game/Items/Food/BP_ItFo_Whitemeat_Visual.BP_ItFo_Whitemeat_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Food/BP_ItFo_Whitemeat_World.BP_ItFo_Whitemeat_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItFo_Whitemeat.T_ItemIcon_ItFo_Whitemeat";
    default m_Value = 4;
    default m_MaxStack = 99;
    default m_Weight = 0.2f;
    default AddOnConsume(UGE_Item_Heal_Overtime::StaticClass()).AddMag(GameplayTag::GE_Param_Heal, 1.0f).AddMag(GameplayTag::GE_Param_Duration, 2);
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Food);
    default AddItemSpec(GameplayTag::Item_Property_Consumable);
    default AddItemSpec(GameplayTag::Item_Property_QuickConsumable);
    default AddItemSpec(GameplayTag::Item_Property_Throwable);
    default AddItemSpec(GameplayTag::Item_Property_Size_Small);
    default AddItemSpec(GameplayTag::Item_Property_TraderRegen);
    default AddItemSpec(GameplayTag::Food_Meat);
    default AddPossibleActionAfterDrop(GameplayTag::Action_Eat_Item);
}

UCLASS()
class UItFo_Wineberrys_01: UItemDefinition
{
    default m_Name = "ItFo_Wineberrys_01";
    default m_ItemVisual = n"Blueprint'/Game/Items/Food/BP_ItFo_Wineberrys_01_Visual.BP_ItFo_Wineberrys_01_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Food/BP_ItFo_Wineberrys_01_World.BP_ItFo_Wineberrys_01_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItFo_Wineberrys_01.T_ItemIcon_ItFo_Wineberrys_01";
    default m_Value = 4;
    default m_MaxStack = 99;
    default m_Weight = 0.1f;
    default AddOnConsume(UGE_Item_Heal_Overtime::StaticClass()).AddMag(GameplayTag::GE_Param_Heal, 1.0f).AddMag(GameplayTag::GE_Param_Duration, 3);
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Food);
    default AddItemSpec(GameplayTag::Item_Property_Consumable);
    default AddItemSpec(GameplayTag::Item_Property_QuickConsumable);
    default AddItemSpec(GameplayTag::Item_Property_Throwable);
    default AddItemSpec(GameplayTag::Item_Property_Size_Small);
    default AddItemSpec(GameplayTag::Item_Property_TraderRegen);
    default AddItemSpec(GameplayTag::Food_Fruit);
    default AddPossibleActionAfterDrop(GameplayTag::Action_Eat_Item);
}

