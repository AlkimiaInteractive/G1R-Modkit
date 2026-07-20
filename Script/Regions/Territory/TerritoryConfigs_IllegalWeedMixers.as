UCLASS()
class UTerritoryConfig_IWM_Lake_Extended: UTerritoryConfig
{
    default AssociatedAreaTag = GameplayTag::Area_WeedMixers_Lake;
    default AdditionalAreaTags.AddTag(GameplayTag::Area_WeedMixers_Creek);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_WeedMixers_ForestPath);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_WeedMixers_WoodcuttersPath);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_NewCampOutskirts_GateApproach);
}

UCLASS()
class UTerritoryConfig_IWM_Cave: UTerritoryConfig
{
    default AssociatedAreaTag = GameplayTag::Area_WeedMixers_Cave_01;
    default AdditionalAreaTags.AddTag(GameplayTag::Area_WeedMixers_Cave_02);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_ILWM_Cave_Loot);
}