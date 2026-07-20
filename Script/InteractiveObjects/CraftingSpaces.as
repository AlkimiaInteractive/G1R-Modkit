UCLASS()
class UGenericMiningSpot: UDefaultInteractive
{
	default m_Name = "Generic Mining Spot";
	default m_Icon = "Apfel2DIcon";
	default m_Description = "ApfelDesc";
	default m_DefaultInteraction = GameplayTag::Action_Mining;
	default m_RequiredItemSpec = GameplayTag::Item_Property_Mining;
	default AddToInventory(UItMi_Orenugget::StaticClass(), 0);
	default m_RequiredIcon = GameplayTag::UI_NeedItemIcon_Pick;
};

UCLASS()
class UStoneTorchInteractiveSpot: UFireActorDefinition
{
	default m_Name = "Generic Lit Spot";
	default m_Icon = "Apfel2DIcon";
	default m_Description = "ApfelDesc";
	default m_DefaultInteraction = GameplayTag::Action_StartFire;
	//default m_RequiredItemSpec = GameplayTag::Item_Property_Lit;
	default m_ObjectInteractAngle = 0.0f;

	default m_StartActive = false;
	default m_StopWithRain = false;
	default m_AttenuatedWithRain = false;
	default m_HoursForUnLite = 0.0f;
	default m_StopWithSpell = false;
};

UCLASS()
class UGenericLitInteractiveSpot: UFireActorDefinition
{
	default m_Name = "Generic Lit Spot";
	default m_Icon = "Apfel2DIcon";
	default m_Description = "ApfelDesc";
	default m_DefaultInteraction = GameplayTag::Action_StartFire;
	//default m_RequiredItemSpec = GameplayTag::Item_Property_Lit;
	default m_ObjectInteractAngle = 0.0f;

	default m_StartActive = false;
	default m_StopWithRain = true;
	default m_AttenuatedWithRain = false;
	default m_HoursForUnLite = 0.0f;
	default m_StopWithSpell = false;
	default m_TimeRange = UTimeRange_All::StaticClass();
};

UCLASS()
class UIoHighMiningSpot: UGenericMiningSpot
{
	default m_Name = "High Mining Spot";
	default AddToInventory(UItMi_Orenugget::StaticClass(), 15);
};

UCLASS()
class UIoHighMiningSpotWall: UIoHighMiningSpot
{
	default m_DefaultInteraction = GameplayTag::Action_Mining_OnWall;
};

UCLASS()
class UIoMediumMiningSpot: UGenericMiningSpot
{
	default m_Name = "High Mining Spot";
	default AddToInventory(UItMi_Orenugget::StaticClass(), 10);
};

UCLASS()
class UIoMediumMiningSpotWall: UIoMediumMiningSpot
{
	default m_DefaultInteraction = GameplayTag::Action_Mining_OnWall;
};

UCLASS()
class UIoLowMiningSpot: UGenericMiningSpot
{
	default m_Name = "Low Mining Spot";
	default AddToInventory(UItMi_Orenugget::StaticClass(), 5);
};

UCLASS()
class UIoLowMiningSpotWall: UIoLowMiningSpot
{
	default m_DefaultInteraction = GameplayTag::Action_Mining_OnWall;
};

UCLASS()
class UForgeDefault: UDefaultInteractive
{
	default m_Name = "Forge";
	default m_Icon = "Apfel2DIcon";
	default m_Description = "ApfelDesc";
	default m_DefaultInteraction = GameplayTag::Action_Crafting_Forge;
	default m_Tags.Add("Space.Forge");
	default m_OptionalItemSpec = GameplayTag::Item_Property_Intermediate;
	default m_OptionalItemSpecSecond = GameplayTag::Skill_Crafting_Blacksmith_Master;
	default m_ExtraTags.Add(n"NoRecipesNeeded");
};

UCLASS()
class UAnvilDefault: UDefaultInteractive
{
	default m_Name = "Anvil";
	default m_Icon = "Apfel2DIcon";
	default m_Description = "ApfelDesc";
	default m_DefaultInteraction = GameplayTag::Action_Crafting_Anvil;
	default m_Tags.Add("Space.Anvil");
	default m_OptionalItemSpec = GameplayTag::Item_Property_Intermediate;
	default m_OptionalItemSpecSecond = GameplayTag::Skill_Crafting_Blacksmith_Master;
};

UCLASS()
class UBarrelWaterDefault: UDefaultInteractive
{
	default m_Name = "BarrelWater";
	default m_Icon = "Apfel2DIcon";
	default m_Description = "ApfelDesc";
	default m_DefaultInteraction = GameplayTag::Action_Crafting_Barrel;
	default m_Tags.Add("Space.BarrelOfWater");
	default m_OptionalItemSpec = GameplayTag::Item_Property_Intermediate;
	default m_OptionalItemSpecSecond = GameplayTag::Skill_Crafting_Blacksmith_Master;
};

UCLASS()
class UWorkBenchDefault: UDefaultInteractive
{
	default m_Name = "Workbench";
	default m_Icon = "Apfel2DIcon";
	default m_Description = "ApfelDesc";
	default m_DefaultInteraction = GameplayTag::Action_Crafting_Workbench;
	default m_Tags.Add("Space.WorkBench");
	default m_OptionalItemSpec = GameplayTag::Item_Property_Intermediate;
	default m_OptionalItemSpecSecond = GameplayTag::Skill_Crafting_Blacksmith_Master;
};

UCLASS()
class UWhetStoneDefault: UDefaultInteractive
{
	default m_Name = "WhetStone";
	default m_Icon = "Apfel2DIcon";
	default m_Description = "ApfelDesc";
	default m_DefaultInteraction = GameplayTag::Action_Crafting_WhetStone;
	default m_Tags.Add("Space.WhetStone");
	default m_OptionalItemSpec = GameplayTag::Item_Property_Intermediate;
	default m_OptionalItemSpecSecond = GameplayTag::Skill_Crafting_Blacksmith_Master;
};

UCLASS()
class UForgeBigCamp: UForgeDefault
{
	default m_Tags.Add("Space.BigCamp");
	default m_OptionalItemSpec = GameplayTag::Item_Property_Intermediate;
};

UCLASS()
class UForgeDestinyMountain: UForgeDefault
{
	default m_Tags.Add("Space.DestinyMontain");
	default m_OptionalItemSpec = GameplayTag::Item_Property_Intermediate;
};

UCLASS()
class UPanDefault: UDefaultInteractive
{
	default m_Name = "Pan Cook";
	default m_Icon = "Apfel2DIcon";
	default m_Description = "ApfelDesc";
	default m_DefaultInteraction = GameplayTag::Action_Crafting_Cook_Pan;
	default m_Tags.Add("Space.Pan");
	default m_OptionalItemSpec = GameplayTag::Item_Property_Intermediate;
	default m_ExtraTags.Add(n"NoRecipesNeeded");
};

UCLASS()
class UPanBigCamp: UPanDefault
{
	default m_Tags.Add("Space.BigCamp");
	default m_OptionalItemSpec = GameplayTag::Item_Property_Intermediate;
}

UCLASS()
class UCauldronDefault: UDefaultInteractive
{
	default m_Name = "Cauldron";
	default m_Icon = "Apfel2DIcon";
	default m_Description = "ApfelDesc";
	default m_DefaultInteraction = GameplayTag::Action_Crafting_Cook_Cauldron;
	default m_Tags.Add("Space.Cauldron");
	default m_ExtraTags.Add(n"NoRecipesNeeded");
};

UCLASS()
class ULacternDefault: UDefaultInteractive
{
	default m_Name = "Lactern";
	default m_Icon = "Apfel2DIcon";
	default m_Description = "ApfelDesc";
	default m_DefaultInteraction = GameplayTag::Action_Crafting_Inscription;
	default m_Tags.Add("Space.Lactern");
	default m_ExtraTags.Add(n"NoRecipesNeeded");
};

UCLASS()
class UAlchemyLabDefault: UDefaultInteractive
{
	default m_Name = "AlchemyLab";
	default m_Icon = "Apfel2DIcon";
	default m_Description = "ApfelDesc";
	default m_DefaultInteraction = GameplayTag::Action_Crafting_Alchemy;
	default m_Tags.Add("Space.AlchemyLab");
	default m_ExtraTags.Add(n"NoRecipesNeeded");
};

UCLASS()
class URostisserieDefault: UDefaultInteractive
{
	default m_Name = "Rostisserie";
	default m_Icon = "Apfel2DIcon";
	default m_Description = "ApfelDesc";
	default m_DefaultInteraction = GameplayTag::Action_EffectStation_Rostisserie;
	default m_Tags.Add("Space.Rostisserie");
	default m_OptionalItemSpec = GameplayTag::Item_Property_Intermediate;
	default AddEffect(GameplayTag::GE_Param_Heal, UGE_Item_Heal_Insta::StaticClass()).AddMag(GameplayTag::GE_Param_Heal, 50);
	default m_ExtraTags.Add(n"NoRecipesNeeded");
};

UCLASS()
class UExecutionDefault: UInteractiveObjectDefinition
{
	default m_Name = "Execution";
	default m_Icon = "Apfel2DIcon";
	default m_Description = "ApfelDesc";
	default m_DefaultInteraction = GameplayTag::Action_Execution;
	default m_Tags.Add("Space.Lactern");
	//default m_RequiredItemSpec = GameplayTag::Item_Property_Equipable;
};

UCLASS()
class USecondDream_TeleportConfig: UTeleportExtraData
{
	default m_TeleportMapFreePointName = n"QuickTeleport_SleeperDreamDesert";
	default m_RequiredData.Add(n"DreamState",1);
	default m_SetOnFinishData.Add(n"DreamState",2);
	default m_MontageName = n"Hearth1";
	default m_Id = 1;
	default m_TagsToAdd.AddTag(GameplayTag::State_NormalSaveBlocked);
	default m_MustSave = true;
};

UCLASS()
class UThirdDream_TeleportConfig: UTeleportExtraData
{
	default m_TeleportMapFreePointName = n"QuickTeleport_SleeperDreamMine";
	default m_RequiredData.Add(n"DreamState",2);
	default m_SetOnFinishData.Add(n"DreamState",3);
	default m_MontageName = n"Hearth2";
	default m_Id = 2;
	default m_TagsToAdd.AddTag(GameplayTag::State_NormalSaveBlocked);
	default m_MustSave = true;
};

UCLASS()
class UFourthDream_TeleportConfig: UTeleportExtraData
{
	default m_TeleportMapFreePointName = n"QuickTeleport_SleeperDreamDiego";
	default m_RequiredData.Add(n"DreamState",3);
	default m_SetOnFinishData.Add(n"DreamState",4);
	default m_MontageName = n"Hearth3";
	default m_Id = 3;
	default m_TagsToAdd.AddTag(GameplayTag::State_NormalSaveBlocked);
	default m_MustSave = true;
};

UCLASS()
class UFifthDream_TeleportConfig: UTeleportExtraData
{
	//default m_TeleportMapFreePointName = n"QuickTeleport_SleeperDreamDiego";
	default m_RequiredData.Add(n"DreamState",4);
	default m_SetOnStartData.Add(n"DreamState",5);
	default m_MontageName = n"Hearth4";
	default m_MustDisable = true;
	default m_Id = 4;
};

UCLASS()
class UFinalDream_TeleportConfig: UTeleportExtraData
{
	//default m_TeleportMapFreePointName = n"QuickTeleport_SleeperDreamDiego";
	default m_RequiredData.Add(n"DreamState",5);
	default m_SetOnStartData.Add(n"DreamState",6);
	default m_MontageName = n"Hearth5";
	default m_Id = 5;
	default m_UnEquipBefore = false;
};

UCLASS()
class UHearths_TeleportConfig: UTeleportCompositeExtraData
{
	default m_Teleports.Add(USecondDream_TeleportConfig::StaticClass());
	default m_Teleports.Add(UThirdDream_TeleportConfig::StaticClass());
	default m_Teleports.Add(UFourthDream_TeleportConfig::StaticClass());
	default m_Teleports.Add(UFifthDream_TeleportConfig::StaticClass());
	default m_Teleports.Add(UFinalDream_TeleportConfig::StaticClass());
};

UCLASS()
class UHearthsDefault: UDefaultInteractive
{
	default m_Name = "Hearths";
	default m_Icon = "Apfel2DIcon";
	default m_Description = "ApfelDesc";
	default m_DefaultInteraction = GameplayTag::Action_Teleport_Hearth;
	default m_Tags.Add("Space.Hearths");
	default m_OptionalObject = UHearths_TeleportConfig::StaticClass();
	default m_PlayerInteractDistance = 350.0f;
    default m_PlayerInteractDistanceFar = 1000.0f;
};