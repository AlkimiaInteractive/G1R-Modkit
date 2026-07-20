/// Old Camp
UCLASS()
class UTerritoryConfig_OC_Arena : UTerritoryConfig
{
    default AssociatedAreaTag = GameplayTag::Area_OldCamp_OuterRing_Arena;
}

UCLASS()
class UTerritoryConfig_OC_WholeCamp : UTerritoryConfig
{
    default AnyOneToBeValidTags.AddTag(GameplayTag::Guild_Human_OldCamp_Guard);
    default AnyOneToBeValidTags.AddTag(GameplayTag::Guild_Human_OldCamp_Shadow);

    default AssociatedAreaTag = GameplayTag::Area_OldCamp_OuterRing;
}

UCLASS()
class UTerritoryConfig_OC_Castle_NoGomezBuilding : UTerritoryConfig
{
    default AnyOneToBeValidTags.AddTag(GameplayTag::Guild_Human_OldCamp_FireMage);

    default AssociatedAreaTag = GameplayTag::Area_OldCamp_Castle;

    default ExcludedAreaTags.AddTag(GameplayTag::Area_OldCamp_Castle_Room_GomezBuilding);
    default ExcludedAreaTags.AddTag(GameplayTag::Area_OldCamp_Castle_Room_Tower);
    default ExcludedAreaTags.AddTag(GameplayTag::Area_OldCamp_Castle_Room_GuardsBarrack);
}

UCLASS()
class UTerritoryConfig_OC_Castle_All : UTerritoryConfig
{
    default AnyOneToBeValidTags.AddTag(GameplayTag::Guild_Human_OldCamp_OreBaron);

    default AssociatedAreaTag = GameplayTag::Area_OldCamp_Castle;
}

UCLASS()
class UTerritoryConfig_OC_Castle_DungeonOnly : UTerritoryConfig
{
    default AssociatedAreaTag = GameplayTag::Area_OldCamp_Castle_Room_Dungeons_CentralCellBlock;
    default AdditionalAreaTags.AddTag(GameplayTag::Area_OldCamp_Castle_Room_Dungeons_NorthWestStairs);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_OldCamp_Castle_Room_Dungeons_NorthEastStairs);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_OldCamp_Castle_Room_Dungeons_NorthCellBlock);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_OldCamp_Castle_Room_Dungeons_SouthWestStairs);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_OldCamp_Castle_Room_Dungeons_SouthEastStairs);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_OldCamp_Castle_Room_Dungeons_SouthCellBlock);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_OldCamp_Castle_Room_Dungeons_EastCellBlock);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_OldCamp_Castle_Room_Dungeons_StairsToTortureChamber);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_OldCamp_Castle_Room_Dungeons_TortureChamber);
}

UCLASS()
class UTerritoryConfigs_OC_OuterRingOnly : UTerritoryConfig
{
    default AnyOneToBeForbiddenTags.AddTag(GameplayTag::Guild_Human_OldCamp_Guard);
    default AnyOneToBeForbiddenTags.AddTag(GameplayTag::Guild_Human_OldCamp_Shadow);

    default AssociatedAreaTag = GameplayTag::Area_OldCamp_OuterRing;

    default ExcludedAreaTags.AddTag(GameplayTag::Area_OldCamp_Castle);
}