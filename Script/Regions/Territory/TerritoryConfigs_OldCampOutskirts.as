UCLASS()
class UTerritoryConfig_OC_Outskirts_Extended : UTerritoryConfig
{
    default AnyOneToBeForbiddenTags.AddTag(GameplayTag::Species_Creature_Lurker);
    default AnyOneToBeForbiddenTags.AddTag(GameplayTag::Species_Creature_Lizard);

    default AssociatedAreaTag = GameplayTag::Area_OldCampOutskirts;
    default AdditionalAreaTags.AddTag(GameplayTag::Area_OldCampOutskirts_Cave);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_OldCampOutskirts_BrokenTowerPath);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_OldCampOutskirts_WestRiverbankDefile);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_OldCampOutskirts_OrcTerritoryPath_Gorge);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_OldCampOutskirts_OrcTerritoryPath_Tunnel);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_OldCampOutskirts_OrcTerritoryPath_Cave_Entrance);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_OldCampOutskirts_OrcTerritoryPath_Cave_Tunnel);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_OldCampOutskirts_OrcTerritoryPath_Cave_EndCavern);

    default ExcludedAreaTags.AddTag(GameplayTag::Area_OldCamp_OuterRing);
    default ExcludedAreaTags.AddTag(GameplayTag::Area_OldCamp_Castle);
}

UCLASS()
class UTerritoryConfig_OC_Outskirts_Extended_Aquatic : UTerritoryConfig
{
    default AnyOneToBeValidTags.AddTag(GameplayTag::Species_Creature_Lurker);
    default AnyOneToBeValidTags.AddTag(GameplayTag::Species_Creature_Lizard);

    default AssociatedAreaTag = GameplayTag::Area_OldCampOutskirts;
    default AdditionalAreaTags.AddTag(GameplayTag::Area_OldCampOutskirts_Cave);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_OldCampOutskirts_BrokenTowerPath);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_OldCampOutskirts_WestRiverbankDefile);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_OldCampOutskirts_OrcTerritoryPath_Gorge);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_OldCampOutskirts_OrcTerritoryPath_Tunnel);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_OldCampOutskirts_OrcTerritoryPath_Cave_Entrance);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_OldCampOutskirts_OrcTerritoryPath_Cave_Tunnel);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_OldCampOutskirts_OrcTerritoryPath_Cave_EndCavern);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_OldCampOutskirts_River_Island);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_OldCampOutskirts_River);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_ExchangeZone_Forest);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_MonasteryRuins_Plane);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_EastForest_River);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_EastForest_Forest);

    default ExcludedAreaTags.AddTag(GameplayTag::Area_OldCamp_OuterRing);
    default ExcludedAreaTags.AddTag(GameplayTag::Area_OldCamp_Castle);
    default ExcludedAreaTags.AddTag(GameplayTag::Area_MonasteryRuins_Canyon_Cave);
    default ExcludedAreaTags.AddTag(GameplayTag::Area_MonasteryRuins_Canyon_Entry);
    default ExcludedAreaTags.AddTag(GameplayTag::Area_MonasteryRuins_Canyon_Tunnel);
    default ExcludedAreaTags.AddTag(GameplayTag::Area_EastForest_ShadowCavern);
}

UCLASS()
class UTerritoryConfig_OC_RiverIsland : UTerritoryConfig
{
    default AnyOneToBeForbiddenTags.AddTag(GameplayTag::Species_Creature_Lurker);
    default AnyOneToBeForbiddenTags.AddTag(GameplayTag::Species_Creature_Lizard);

    default AssociatedAreaTag = GameplayTag::Area_OldCampOutskirts_River_Island;
}

UCLASS()
class UTerritoryConfig_OC_RiverIsland_Aquatic : UTerritoryConfig
{
    default AnyOneToBeValidTags.AddTag(GameplayTag::Species_Creature_Lurker);
    default AnyOneToBeValidTags.AddTag(GameplayTag::Species_Creature_Lizard);

    default AssociatedAreaTag = GameplayTag::Area_OldCampOutskirts_River_Island;
    default AdditionalAreaTags.AddTag(GameplayTag::Area_OldCampOutskirts_River);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_OldCampOutskirts);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_ExchangeZone_Forest);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_MonasteryRuins_Plane);

    default ExcludedAreaTags.AddTag(GameplayTag::Area_OldCamp_OuterRing);
    default ExcludedAreaTags.AddTag(GameplayTag::Area_OldCamp_Castle);
    default ExcludedAreaTags.AddTag(GameplayTag::Area_MonasteryRuins_Canyon_Cave);
    default ExcludedAreaTags.AddTag(GameplayTag::Area_MonasteryRuins_Canyon_Entry);
    default ExcludedAreaTags.AddTag(GameplayTag::Area_MonasteryRuins_Canyon_Tunnel);
}