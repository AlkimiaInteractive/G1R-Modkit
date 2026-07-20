UCLASS()
class UTerritoryConfig_OA_OuterValley : UTerritoryConfig
{
    default AssociatedAreaTag = GameplayTag::Area_OldCampOutskirts_OrcArenaPath;
    default AdditionalAreaTags.AddTag(GameplayTag::Area_OldCampOutskirts_BrokenTowerPath);
}

UCLASS()
class UTerritoryConfig_OA_InnerValley : UTerritoryConfig
{
    default AssociatedAreaTag = GameplayTag::Area_OrcTerritory_OrcArenaValley;
    default AdditionalAreaTags.AddTag(GameplayTag::Area_OrcTerritory_OrcArenaValley_Cave);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_OrcTerritory_OrcArenaPath);
}

UCLASS()
class UTerritoryConfig_OA_Arena : UTerritoryConfig
{
    default AssociatedAreaTag = GameplayTag::Area_OrcArena_Arena;
}

UCLASS()
class UTerritoryConfig_OA_DungeonEntrance : UTerritoryConfig
{
    default AllToBeValidTags.AddTag(GameplayTag::Role_OrcDungeonGuard); // FP_OTOWN_GUARD_17, FP_OTOWN_STAND_52

    default AssociatedAreaTag = GameplayTag::Area_OrcEnclave;
    default AdditionalAreaTags.AddTag(GameplayTag::Area_OrcArena_Dungeon_EntranceStairs);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_OrcArena_Dungeon_EntranceChamber);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_OrcArena_Dungeon_MainHallway);
}

UCLASS()
class UTerritoryConfig_OA_DungeonMain : UTerritoryConfig
{
    default AssociatedAreaTag = GameplayTag::Area_OrcArena_Dungeon_MainChamber;
    default AdditionalAreaTags.AddTag(GameplayTag::Area_OrcArena_Dungeon_InnerCorridors);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_OrcArena_Dungeon_Balcony);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_OrcArena_Dungeon_AltarChamber);
}