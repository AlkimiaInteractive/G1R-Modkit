UCLASS()
class UTerritoryConfig_NC_Outskirts_Forest : UTerritoryConfig
{
    default AssociatedAreaTag = GameplayTag::Area_ExchangeZone_SouthWestPath;
    default AdditionalAreaTags.AddTag(GameplayTag::Area_ExchangeZone_Forest);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_NewCampOutskirts_RiverCrossing);
}

UCLASS()
class UTerritoryConfig_NC_Outskirts_RiverCrossing : UTerritoryConfig
{
    default AssociatedAreaTag = GameplayTag::Area_NewCampOutskirts_RiverCrossing;
    default AdditionalAreaTags.AddTag(GameplayTag::Area_ExchangeZone_SouthWestPath);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_NewCampOutskirts_CliffsidePath);
}

UCLASS()
class UTerritoryConfig_NC_Outskirts_CliffsidePath : UTerritoryConfig
{
    default AssociatedAreaTag = GameplayTag::Area_NewCampOutskirts_CliffsidePath;
    default AdditionalAreaTags.AddTag(GameplayTag::Area_NewCampOutskirts_RiverCrossing);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_NewCampOutskirts_GateApproach);
}

UCLASS()
class UTerritoryConfig_NC_Outskirts_GateApproach : UTerritoryConfig
{
    default AssociatedAreaTag = GameplayTag::Area_NewCampOutskirts_GateApproach;
    default AdditionalAreaTags.AddTag(GameplayTag::Area_NewCampOutskirts_CliffsidePath);
}

UCLASS()
class UTerritoryConfig_NC_ClifftopPlateau : UTerritoryConfig
{
    default AssociatedAreaTag = GameplayTag::Area_NewCampOutskirts_ClifftopPlateau;
    default AdditionalAreaTags.AddTag(GameplayTag::Area_NewCampOutskirts_ClifftopPlateau_Joint);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_NewCampOutskirts_FreeMinePath);
}