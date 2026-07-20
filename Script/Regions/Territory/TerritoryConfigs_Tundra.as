UCLASS()
class UTerritoryConfig_HC_Tundra_EnclosedBasin : UTerritoryConfig
{
    default AssociatedAreaTag = GameplayTag::Area_Tundra_EnclosedBasin;
    default ExcludedAreaTags.AddTag(GameplayTag::Area_Tundra_InnosTemple_Entrance);
    default ExcludedAreaTags.AddTag(GameplayTag::Area_Tundra_InnosTemple_LowerChamber);
    default ExcludedAreaTags.AddTag(GameplayTag::Area_Tundra_InnosTemple_UpperChamber);
    default ExcludedAreaTags.AddTag(GameplayTag::Area_Tundra_InnosTemple_Ring);
}

UCLASS()
class UTerritoryConfig_HC_Tundra_AbandonedCamp : UTerritoryConfig
{
    default AssociatedAreaTag = GameplayTag::Area_Tundra_AbandonedCamp;
}

UCLASS()
class UTerritoryConfig_HC_Tundra_InnosTemple : UTerritoryConfig
{
    default AssociatedAreaTag = GameplayTag::Area_Tundra_InnosTemple_LowerChamber;
    default AdditionalAreaTags.AddTag(GameplayTag::Area_Tundra_InnosTemple_UpperChamber);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_Tundra_InnosTemple_Ring);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_Tundra_InnosTemple_Entrance);
}