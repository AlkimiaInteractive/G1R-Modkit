UCLASS()
class UTerritoryConfig_EF_Forest_Extended: UTerritoryConfig
{
    default AnyOneToBeForbiddenTags.AddTag(GameplayTag::Species_Creature_Lurker);
    default AnyOneToBeForbiddenTags.AddTag(GameplayTag::Species_Creature_Lizard);

    default AssociatedAreaTag = GameplayTag::Area_EastForest_Forest;
    default AdditionalAreaTags.AddTag(GameplayTag::Area_EastForest_BeachCliffDescent);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_EastForest_SwampPath);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_EastForest_OrcGraveyardPath);

    default ExcludedAreaTags.AddTag(GameplayTag::Area_EastForest_ShadowCavern);
}

UCLASS()
class UTerritoryConfig_EF_Forest_Extended_Aquatic: UTerritoryConfig
{
    default AnyOneToBeValidTags.AddTag(GameplayTag::Species_Creature_Lurker);
    default AnyOneToBeValidTags.AddTag(GameplayTag::Species_Creature_Lizard);

    default AssociatedAreaTag = GameplayTag::Area_EastForest_Forest;
    default AdditionalAreaTags.AddTag(GameplayTag::Area_EastForest_BeachCliffDescent);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_EastForest_SwampPath);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_EastForest_OrcGraveyardPath);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_EastForest_River);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_OldCampOutskirts);

    default ExcludedAreaTags.AddTag(GameplayTag::Area_EastForest_ShadowCavern);
    default ExcludedAreaTags.AddTag(GameplayTag::Area_OldCamp_OuterRing);
    default ExcludedAreaTags.AddTag(GameplayTag::Area_OldCamp_Castle);
}

UCLASS()
class UTerritoryConfig_EF_ShadowCavern_Extended: UTerritoryConfig
{
    default AllToBeValidTags.AddTag(GameplayTag::Species_Creature_Shadowbeast);
    
    default AssociatedAreaTag = GameplayTag::Area_EastForest_ShadowCavern;
    default AdditionalAreaTags.AddTag(GameplayTag::Area_EastForest_Forest);
}

UCLASS()
class UTerritoryConfig_EF_SouthCaveEntrance: UTerritoryConfig
{
    default AssociatedAreaTag = GameplayTag::Area_EastForest_SouthCaveEntrance;
}

UCLASS()
class UTerritoryConfig_EF_SouthCave_Interior: UTerritoryConfig
{
    default AssociatedAreaTag = GameplayTag::Area_EastForest_SouthCaveInterior_Tunnels_01;
    default AdditionalAreaTags.AddTag(GameplayTag::Area_EastForest_SouthCaveInterior_Entrance);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_EastForest_SouthCaveInterior_Tunnels_02);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_EastForest_SouthCaveInterior_Tunnels_03);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_EastForest_SouthCaveInterior_Tunnels_04);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_EastForest_SouthCaveInterior_Tunnels_05);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_EastForest_SouthCaveInterior_Tunnels_06);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_EastForest_SouthCaveInterior_Depths_01);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_EastForest_SouthCaveInterior_Depths_02);
}