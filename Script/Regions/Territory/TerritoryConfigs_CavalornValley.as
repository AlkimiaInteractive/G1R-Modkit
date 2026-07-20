UCLASS()
class UTerritoryConfig_CV_Sawmill : UTerritoryConfig
{
    default AssociatedAreaTag = GameplayTag::Area_CavalornValley_Sawmill;
    default AdditionalAreaTags.AddTag(GameplayTag::Area_WeedMixers_WoodcuttersPath);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_Stonehenge_NorthPath);
}

UCLASS()
class UTerritoryConfig_CV_Cohsel : UTerritoryConfig
{
    default AssociatedAreaTag = GameplayTag::Area_CavalornValley_Cohsel;
}

UCLASS()
class UTerritoryConfig_CV_Valley : UTerritoryConfig
{
    default AssociatedAreaTag = GameplayTag::Area_CavalornValley_Valley;
    default AdditionalAreaTags.AddTag(GameplayTag::Area_WeedMixers_Creek);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_CavalornValley_Cavalorn_SmallCave_Tunnel);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_CavalornValley_Cavalorn_SmallCave_Stash);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_CavalornValley_Cavalorn_Hut);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_CavalornValley_Cavern);
}

UCLASS()
class UTerritoryConfig_CV_SmallHillTop : UTerritoryConfig
{
    default AssociatedAreaTag = GameplayTag::Area_CavalornValley_SmallHilltop;
}

UCLASS()
class UTerritoryConfig_CV_LargeHillTop : UTerritoryConfig
{
    default AssociatedAreaTag = GameplayTag::Area_CavalornValley_LargeHilltop;
}