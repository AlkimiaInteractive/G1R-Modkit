UCLASS()
class UTerritoryConfig_ST_Stonehenge : UTerritoryConfig
{
    default AssociatedAreaTag = GameplayTag::Area_Stonehenge_MainArea;
    default AdditionalAreaTags.AddTag(GameplayTag::Area_OrcTerritory_StonehengePath);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_Stonehenge_NorthPath);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_Stonehenge_WestPath);

    default ExcludedAreaTags.AddTag(GameplayTag::Area_Stonehenge_Grotto);
    default ExcludedAreaTags.AddTag(GameplayTag::Area_Stonehenge_Dungeon);
    default ExcludedAreaTags.AddTag(GameplayTag::Area_Stonehenge_Dungeon_Focus);
}

UCLASS()
class UTerritoryConfig_ST_Grotto_Extended : UTerritoryConfig
{
    default AllToBeValidTags.AddTag(GameplayTag::Species_Creature_Shadowbeast);
    
    default AssociatedAreaTag = GameplayTag::Area_Stonehenge_Grotto;
    default AdditionalAreaTags.AddTag(GameplayTag::Area_Stonehenge_MainArea);

    default ExcludedAreaTags.AddTag(GameplayTag::Area_Stonehenge_Dungeon);
    default ExcludedAreaTags.AddTag(GameplayTag::Area_Stonehenge_Dungeon_Focus);
}

UCLASS()
class UTerritoryConfig_ST_DungeonFocus : UTerritoryConfig
{    
    default AssociatedAreaTag = GameplayTag::Area_Stonehenge_Dungeon_Focus;
}