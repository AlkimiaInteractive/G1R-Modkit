UCLASS()
class UTerritoryConfig_SunkenTower_MainBuilding : UTerritoryConfig
{
    default AssociatedAreaTag = GameplayTag::Area_XardasSunkenTower_MainBuilding_FirstFloor;
    default AdditionalAreaTags.AddTag(GameplayTag::Area_XardasSunkenTower_MainBuilding_SunkenEntrance);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_XardasSunkenTower_MainBuilding_RooftopTerrace);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_XardasSunkenTower_MainBuilding_SmallTower_BottomFloor);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_XardasSunkenTower_MainBuilding_SmallTower_UpperFloor);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_XardasSunkenTower_MainBuilding_LargeTower_BottomFloor);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_XardasSunkenTower_MainBuilding_LargeTower_MiddleFloor);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_XardasSunkenTower_MainBuilding_LargeTower_CrumblingTower);
}

UCLASS()
class UTerritoryConfig_SunkenTower_Dungeons : UTerritoryConfig
{
    default AssociatedAreaTag = GameplayTag::Area_XardasSunkenTower_Dungeons;
}

UCLASS()
class UTerritoryConfig_SunkenTower_DeepChamber : UTerritoryConfig
{
    default AssociatedAreaTag = GameplayTag::Area_XardasSunkenTower_DeepChamber;
    default AdditionalAreaTags.AddTag(GameplayTag::Area_XardasSunkenTower_DeepChamber_Hallway);
}

UCLASS()
class UTerritoryConfig_SunkenTower_Library : UTerritoryConfig
{
    default AssociatedAreaTag = GameplayTag::Area_XardasSunkenTower_Library;
    default AdditionalAreaTags.AddTag(GameplayTag::Area_XardasSunkenTower_Library_Staircase);
}

UCLASS()
class UTerritoryConfig_SunkenTower_DemonChamber : UTerritoryConfig
{
    default AssociatedAreaTag = GameplayTag::Area_XardasSunkenTower_DemonChamber;
}