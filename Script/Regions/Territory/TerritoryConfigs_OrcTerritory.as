UCLASS()
class UTerritoryConfig_OT_Wasteland_Extended : UTerritoryConfig
{
    default AssociatedAreaTag = GameplayTag::Area_OrcTerritory_Wasteland;
    default AdditionalAreaTags.AddTag(GameplayTag::Area_OrcTerritory_OrcArenaPath);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_OrcTerritory_PathToAbandonedCamp);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_OrcTerritory_PathToOldCamp);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_OrcTerritory_Cave);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_OldCampOutskirts_OrcTerritoryPath_Tunnel);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_OldCampOutskirts_OrcTerritoryPath_Cave_Entrance);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_OldCampOutskirts_OrcTerritoryPath_Cave_Tunnel);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_OldCampOutskirts_OrcTerritoryPath_Cave_EndCavern);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_OldCampOutskirts_OrcTerritoryPath_Plateau);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_OldCampOutskirts_OrcTerritoryPath_NaturalBridge);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_OrcTerritory_StonehengePath);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_OrcTerritory_StoneGolemPath);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_OrcTerritory_Watchtower_01);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_OrcTerritory_Watchtower_02);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_OrcTerritory_Watchtower_03);
}

UCLASS()
class UTerritoryConfig_OT_StoneGolemPath : UTerritoryConfig
{
    default AssociatedAreaTag = GameplayTag::Area_OrcTerritory_StoneGolemPath;
    default AdditionalAreaTags.AddTag(GameplayTag::Area_OrcTerritory_CastleRuinsPath);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_CastleRuins_InitialAscent);
}

UCLASS()
class UTerritoryConfig_OT_IceGolem : UTerritoryConfig
{
    default AssociatedAreaTag = GameplayTag::Area_OrcTerritory_IceGolem;
}

UCLASS()
class UTerritoryConfig_OT_FireGolem : UTerritoryConfig
{
    default AssociatedAreaTag = GameplayTag::Area_OrcTerritory_FireGolem;
}

UCLASS()
class UTerritoryConfig_OT_StoneGolem : UTerritoryConfig
{
    default AssociatedAreaTag = GameplayTag::Area_OrcTerritory_StoneGolem;
}