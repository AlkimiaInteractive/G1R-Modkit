UCLASS()
class UTerritoryConfig_SW_Beach : UTerritoryConfig
{
    default AssociatedAreaTag = GameplayTag::Area_Shipwreck;
    default AdditionalAreaTags.AddTag(GameplayTag::Area_EastForest_BeachCliffDescent);
}

UCLASS()
class UTerritoryConfig_SW_GoblinCave_Entrance : UTerritoryConfig
{
    default AssociatedAreaTag = GameplayTag::Area_Shipwreck_GoblinCave_Balcony;
    default AdditionalAreaTags.AddTag(GameplayTag::Area_Shipwreck_GoblinCave_Tunnels_01);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_Shipwreck_GoblinCave_Tunnels_02);
}

UCLASS()
class UTerritoryConfig_SW_GoblinCave_Interior_ForGoblins : UTerritoryConfig
{
    default AllToBeValidTags.AddTag(GameplayTag::Species_Creature_Goblin);
    default AllToBeForbiddenTags.AddTag(GameplayTag::Species_Creature_Troll);

    default AssociatedAreaTag = GameplayTag::Area_Shipwreck_GoblinCave_TrollCavern;
    default AdditionalAreaTags.AddTag(GameplayTag::Area_Shipwreck_GoblinCave_Tunnels_01);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_Shipwreck_GoblinCave_Tunnels_02);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_Shipwreck_GoblinCave_Tunnels_03);
}

UCLASS()
class UTerritoryConfig_SW_GoblinCave_Interior_ForTroll : UTerritoryConfig
{
    default AllToBeValidTags.AddTag(GameplayTag::Species_Creature_Troll);
    default AllToBeForbiddenTags.AddTag(GameplayTag::Species_Creature_Goblin);

    default AssociatedAreaTag = GameplayTag::Area_Shipwreck_GoblinCave_TrollCavern;
}

// LV SW WaterMages Volume 1
UCLASS()
class UTerritoryConfig_SW_WaterMagesTrial : UTerritoryConfig
{
    default AssociatedAreaTag = GameplayTag::Area_Shipwreck_WaterMagesTrial;

    default AdditionalAreaTags.AddTag(GameplayTag::Area_Shipwreck_WaterMagesTrial_Cave);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_Shipwreck_WaterMagesTrial_Sinkhole);
}