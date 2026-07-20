UCLASS()
class UTerritoryConfig_SC_Ramp_Extended : UTerritoryConfig
{
    default AssociatedAreaTag = GameplayTag::Area_SwampCampOutskirts_Ramp_EastForestPath;
    default AdditionalAreaTags.AddTag(GameplayTag::Area_SwampCampOutskirts_Ramp_NarrowPath);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_EastForest_SwampPath);
}

UCLASS()
class UTerritoryConfig_SC_EntranceSwamp : UTerritoryConfig
{
    default AssociatedAreaTag = GameplayTag::Area_SwampCampOutskirts_EntranceSwamp;
    default AdditionalAreaTags.AddTag(GameplayTag::Area_SwampCampOutskirts_Ramp_NarrowPath);
}

UCLASS()
class UTerritoryConfig_SC_EntranceWalkway : UTerritoryConfig
{
    default AssociatedAreaTag = GameplayTag::Area_SwampCampOutskirts_EntranceWalkways;
    default AdditionalAreaTags.AddTag(GameplayTag::Area_SwampCampOutskirts_Ramp_NarrowPath);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_SwampCamp);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_SwampCampOutskirts_Bridge_01);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_SwampCampOutskirts_Bridge_Long);
}

UCLASS()
class UTerritoryConfig_SC_MainCamp : UTerritoryConfig
{
    default AssociatedAreaTag = GameplayTag::Area_SwampCamp;
    default AdditionalAreaTags.AddTag(GameplayTag::Area_SwampCampOutskirts_Bridge_01);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_SwampCampOutskirts_Bridge_Long);
}

UCLASS()
class UTerritoryConfig_SC_SwampEdge : UTerritoryConfig
{
    default AssociatedAreaTag = GameplayTag::Area_SwampCampOutskirts_SwampEdge;
    default AdditionalAreaTags.AddTag(GameplayTag::Area_SwampCampOutskirts_Bridge_Long);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_SwampCampOutskirts_Coast_01);
}

UCLASS()
class UTerritoryConfig_SC_WildSwamp : UTerritoryConfig
{
    default AnyOneToBeForbiddenTags.AddTag(GameplayTag::Species_Creature_Lurker);
    default AnyOneToBeForbiddenTags.AddTag(GameplayTag::Species_Creature_Lizard);
    default AnyOneToBeForbiddenTags.AddTag(GameplayTag::Species_Creature_Swampshark);

    default AssociatedAreaTag = GameplayTag::Area_SwampCampOutskirts_WildSwamp;
    default AdditionalAreaTags.AddTag(GameplayTag::Area_SwampCampOutskirts_SwampEdge);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_SwampCampOutskirts_Coast_01);
}

UCLASS()
class UTerritoryConfig_SC_WildSwamp_Aquatic : UTerritoryConfig
{
    default AnyOneToBeValidTags.AddTag(GameplayTag::Species_Creature_Lurker);
    default AnyOneToBeValidTags.AddTag(GameplayTag::Species_Creature_Lizard);
    default AnyOneToBeValidTags.AddTag(GameplayTag::Species_Creature_Swampshark);

    default AssociatedAreaTag = GameplayTag::Area_SwampCampOutskirts_WildSwamp;
    default AdditionalAreaTags.AddTag(GameplayTag::Area_SwampCampOutskirts_SwampEdge);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_SwampCampOutskirts_Coast_01);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_SwampCampOutskirts_River_01);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_SwampCampOutskirts_River_02);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_SwampCampOutskirts_River_Delta);
}

// Coast 2
UCLASS()
class UTerritoryConfig_SC_WildSwamp_Coastline : UTerritoryConfig
{
    default AssociatedAreaTag = GameplayTag::Area_SwampCampOutskirts_Coast_02;
}

// Swamp temple
UCLASS()
class UTerritoryConfig_SC_Temple : UTerritoryConfig
{
    default AssociatedAreaTag = GameplayTag::Area_SwampCamp_Temple;
    default AdditionalAreaTags.AddTag(GameplayTag::Area_SwampCamp_TempleExterior);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_SwampCamp_Temple_Corridor);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_SwampCamp_Temple_Fountain);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_SwampCamp_Temple_Hall);
}

UCLASS()
class UTerritoryConfig_SC_WildSwamp_Shrine : UTerritoryConfig
{
    default AssociatedAreaTag = GameplayTag::Area_SwampCampOutskirts_WildSwamp_Shrine;
}

UCLASS()
class UTerritoryConfig_SC_WildSwamp_Altar : UTerritoryConfig
{
    default AssociatedAreaTag = GameplayTag::Area_SwampCampOutskirts_WildSwamp_Altar;
}

UCLASS()
class UTerritoryConfig_SC_WildSwamp_ShratCamp : UTerritoryConfig
{
    default AssociatedAreaTag = GameplayTag::Area_SwampCampOutskirts_WildSwamp_ShratCamp;
    default AdditionalAreaTags.AddTag(GameplayTag::Area_SwampCampOutskirts_WildSwamp_ShratCamp_Hut);
}