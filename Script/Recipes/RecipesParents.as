

UCLASS()
class UForgeRecipe: UItemRecipeDefinition
{
	default m_Name = "Base Forge Recipe";
	default m_Value = 1;
	default m_Icon = "";
	default m_ItemVisual = n"Blueprint'/Game/Items/Material/BP_ItMi_Orenugget_Visual.BP_ItMi_Orenugget_Visual_C'";
	default m_ItemVisualWorld = n"Blueprint'/Game/Items/Material/BP_ItMi_Orenugget_World.BP_ItMi_Orenugget_World_C'";
	default m_Description = "ApfelDesc";
	default m_MaxStack = 1;

	default m_CraftingSteps.Add(0, "Space.Forge");
	default m_CraftingSteps.Add(1, "Space.Anvil");
	default m_CraftingSteps.Add(2, "Space.BarrelOfWater");

	default m_IntermediateItem = UItMw_Smith_IntermediateSword_02::StaticClass();
	default m_FinalItemSpawn = EFinalItem::SpawnAndStore;
}

UCLASS()
class UWorkbenchRecipe: UItemRecipeDefinition
{
	default m_Name = "Base Workbench Recipe";
	default m_Value = 1;
	default m_Icon = "";
	default m_ItemVisual = n"Blueprint'/Game/Items/Material/BP_ItMi_Orenugget_Visual.BP_ItMi_Orenugget_Visual_C'";
	default m_ItemVisualWorld = n"Blueprint'/Game/Items/Material/BP_ItMi_Orenugget_World.BP_ItMi_Orenugget_World_C'";
	default m_Description = "ApfelDesc";
	default m_MaxStack = 1;

	default m_CraftingSteps.Add(0, "Space.WorkBench");
}

UCLASS()
class UWhetstoneRecipe: UItemRecipeDefinition
{
	default m_Name = "Base Whetstone Recipe";
	default m_Value = 1;
	default m_Icon = "";
	default m_ItemVisual = n"Blueprint'/Game/Items/Material/BP_ItMi_Orenugget_Visual.BP_ItMi_Orenugget_Visual_C'";
	default m_ItemVisualWorld = n"Blueprint'/Game/Items/Material/BP_ItMi_Orenugget_World.BP_ItMi_Orenugget_World_C'";
	default m_Description = "ApfelDesc";
	default m_MaxStack = 1;

	default m_CraftingSteps.Add(0, "Space.WhetStone");

	default m_FinalItemSpawn = EFinalItem::SpawnAndStore;
}

UCLASS()
class UAlchemyRecipe: UItemRecipeDefinition
{
	default m_Name = "Base Alchemy Recipe";
	default m_Value = 1;
	default m_Icon = "";
	default m_ItemVisual = n"Blueprint'/Game/Items/Material/BP_ItMi_Orenugget_Visual.BP_ItMi_Orenugget_Visual_C'";
	default m_ItemVisualWorld = n"Blueprint'/Game/Items/Material/BP_ItMi_Orenugget_World.BP_ItMi_Orenugget_World_C'";
	default m_Description = "ApfelDesc";
	default m_MaxStack = 1;

	default m_CraftingSteps.Add(0, "Space.AlchemyLab");

	default m_FinalItemSpawn = EFinalItem::NonSpawn;
}

UCLASS()
class UCauldronRecipe: UItemRecipeDefinition
{
	default m_Name = "Base Cauldron Recipe";
	default m_Value = 1;
	default m_Icon = "";
	default m_ItemVisual = n"Blueprint'/Game/Items/Material/BP_ItMi_Orenugget_Visual.BP_ItMi_Orenugget_Visual_C'";
	default m_ItemVisualWorld = n"Blueprint'/Game/Items/Material/BP_ItMi_Orenugget_World.BP_ItMi_Orenugget_World_C'";
	default m_Description = "ApfelDesc";
	default m_MaxStack = 1;

	default m_CraftingSteps.Add(0, "Space.Cauldron");

	default m_FinalItemSpawn = EFinalItem::NonSpawn;

	//default m_NextAbility = GameplayTag::Item_Weapon_Sword_OneHand;
}

UCLASS()
class UInscriptionRecipe: UItemRecipeDefinition
{
	default m_Name = "Base Inscription Recipe";
	default m_Value = 1;
	default m_Icon = "";
	default m_ItemVisual = n"Blueprint'/Game/Items/Material/BP_ItMi_Orenugget_Visual.BP_ItMi_Orenugget_Visual_C'";
	default m_ItemVisualWorld = n"Blueprint'/Game/Items/Material/BP_ItMi_Orenugget_World.BP_ItMi_Orenugget_World_C'";
	default m_Description = "ApfelDesc";
	default m_MaxStack = 1;

	default m_CraftingSteps.Add(0, "Space.Lactern");

	default m_FinalItemSpawn = EFinalItem::NonSpawn;
}

UCLASS()
class UCampfireRecipe: UItemRecipeDefinition
{
	default m_Name = "Base Campfire Recipe";
	default m_Value = 1;
	default m_Icon = "";
	default m_ItemVisual = n"Blueprint'/Game/Items/Material/BP_ItMi_Orenugget_Visual.BP_ItMi_Orenugget_Visual_C'";
	default m_ItemVisualWorld = n"Blueprint'/Game/Items/Material/BP_ItMi_Orenugget_World.BP_ItMi_Orenugget_World_C'";
	default m_Description = "ApfelDesc";
	default m_MaxStack = 1;

	default m_CraftingSteps.Add(0, "Space.Pan");

	default m_FinalItemSpawn = EFinalItem::NonSpawn;
}

UCLASS()
class UItMw_Smith_IntermediateSword_01: USword1H
{
    default m_Name = "Test Sword Recipe";
    default m_Description = "Description - Crude Sword";
	default m_Icon = "";
    default m_ItemVisual = n"Blueprint'/Game/Items/Intermediate/BP_ItMw_Smith_IntermediateSword_01_Visual.BP_ItMw_Smith_IntermediateSword_01_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Intermediate/BP_ItMw_Smith_IntermediateSword_01_Visual.BP_ItMw_Smith_IntermediateSword_01_Visual_C'";
    default m_Value = 10;
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Edge, 1.0f);
	default AddItemSpec(GameplayTag::Item_Property_NoThreat);
}

UCLASS()
class UItMw_Smith_IntermediateSword_02: USword1H
{
    default m_Name = "Test Sword Recipe";
    default m_Description = "Description - Crude Sword";
	default m_Icon = "";
    default m_ItemVisual = n"Blueprint'/Game/Items/Intermediate/BP_ItMw_Smith_IntermediateSword_02_Visual.BP_ItMw_Smith_IntermediateSword_02_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Intermediate/BP_ItMw_Smith_IntermediateSword_02_Visual.BP_ItMw_Smith_IntermediateSword_02_Visual_C'";
    default m_Value = 10;
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Edge, 1.0f);
	default AddItemSpec(GameplayTag::Item_Property_Intermediate);
	default AddItemSpec(GameplayTag::Item_Property_NoThreat);
}

UCLASS()
class UItMw_Smith_IntermediateSword_03: USword1H
{
    default m_Name = "Test Sword Recipe";
    default m_Description = "Description - Crude Sword";
	default m_Icon = "";
    default m_ItemVisual = n"Blueprint'/Game/Items/Intermediate/BP_ItMw_Smith_IntermediateSword_03_Visual.BP_ItMw_Smith_IntermediateSword_03_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Intermediate/BP_ItMw_Smith_IntermediateSword_03_Visual.BP_ItMw_Smith_IntermediateSword_03_Visual_C'";
    default m_Value = 10;
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Edge, 1.0f);
	default AddItemSpec(GameplayTag::Item_Property_Intermediate);
	default AddItemSpec(GameplayTag::Item_Property_NoThreat);
}

UCLASS()
class UItMw_Smith_IntermediateSword_04: USword1H
{
    default m_Name = "Test Sword Recipe";
    default m_Description = "Description - Crude Sword";
	default m_Icon = "";
    default m_ItemVisual = n"Blueprint'/Game/Items/Intermediate/BP_ItMw_Smith_IntermediateSword_04_Visual.BP_ItMw_Smith_IntermediateSword_04_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Intermediate/BP_ItMw_Smith_IntermediateSword_04_Visual.BP_ItMw_Smith_IntermediateSword_04_Visual_C'";
    default m_Value = 10;
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Edge, 1.0f);
	default AddItemSpec(GameplayTag::Item_Property_Intermediate);
	default AddItemSpec(GameplayTag::Item_Property_NoThreat);
}

// TEST RECIPES

UCLASS()
class UForgeTestRecipe: UForgeRecipe
{
	default m_Name = "Forge Test Recipe";
	default m_RequiredIngredients.Add( UItMi_Orenugget::StaticClass(), 1);
	default m_FinalItem.Add( UItMw_Smith_IntermediateSword_03::StaticClass(), 1);
}

UCLASS()
class UWorkbenchTestRecipe: UWorkbenchRecipe
{
	default m_Name = "Workbench Test Recipe";
	default m_RequiredIngredients.Add( UItMw_Smith_IntermediateSword_03::StaticClass(), 1);
	default m_FinalItem.Add( UItMw_Smith_IntermediateSword_04::StaticClass(), 1);
}

UCLASS()
class UWhetstoneTestRecipe: UWhetstoneRecipe
{
	default m_Name = "Whetstone Test Recipe";
	default m_RequiredIngredients.Add( UItMw_Smith_IntermediateSword_04::StaticClass(), 1);
	default m_FinalItem.Add( UItMw_1H_Sword_01::StaticClass(), 1);
}

UCLASS()
class UAlchemyTestRecipe: UAlchemyRecipe
{
	default m_Name = "Alchemy Test Recipe";
	default m_RequiredIngredients.Add( UItMi_Orenugget::StaticClass(), 1);
	default m_FinalItem.Add( UItFo_Potion_Health_01::StaticClass(), 1);
}

UCLASS()
class UCauldronTestRecipe: UCauldronRecipe
{
	default m_Name = "Base Cauldron Recipe";
	default m_RequiredIngredients.Add( UItMi_Orenugget::StaticClass(), 1);
	default m_FinalItem.Add( UItFo_Potion_Health_01::StaticClass(), 1);
}

UCLASS()
class UInscriptionTestRecipe: UInscriptionRecipe
{
	default m_Name = "Inscription Test Recipe";
	default m_RequiredIngredients.Add( UItMi_Orenugget::StaticClass(), 1);
	default m_FinalItem.Add( UItAr_Scroll_TransformMeatbug::StaticClass(), 1);
}

UCLASS()
class UCampfireTestRecipe: UCampfireRecipe
{
	default m_Name = "Campfire Test Recipe";
	default m_RequiredIngredients.Add( UItMi_Orenugget::StaticClass(), 1);
	default m_FinalItem.Add( UItFo_Grilledscavenger::StaticClass(), 2);
	default m_FinalItem.Add( UItFo_Loaf::StaticClass(), 1);
}