UCLASS()
class UTerritoryConfigs_XT_Entrance : UTerritoryConfig
{
    default AssociatedAreaTag = GameplayTag::Area_XardasTower_Entrance;
}

UCLASS()
class UTerritoryConfigs_XT_DemonChamber : UTerritoryConfig
{
    default AssociatedAreaTag = GameplayTag::Area_XardasTower_DemonChamber;
}

UCLASS()
class UTerritoryConfigs_XT_SmallTower : UTerritoryConfig
{
    default AssociatedAreaTag = GameplayTag::Area_XardasTower_SmallTower;
    default AdditionalAreaTags.AddTag(GameplayTag::Area_XardasTower_Entrance);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_XardasTower_FirstFloor);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_XardasTower_RooftopTerrace);
}

UCLASS()
class UTerritoryConfigs_XT_Library : UTerritoryConfig
{
    default AssociatedAreaTag = GameplayTag::Area_XardasTower_MainRoom;
    default AdditionalAreaTags.AddTag(GameplayTag::Area_XardasTower_RooftopTerrace);
}

UCLASS()
class UTerritoryConfigs_XT_Dormitory : UTerritoryConfig
{
    default AssociatedAreaTag = GameplayTag::Area_XardasTower_Bedroom;
    default AdditionalAreaTags.AddTag(GameplayTag::Area_XardasTower_Balcony);
}