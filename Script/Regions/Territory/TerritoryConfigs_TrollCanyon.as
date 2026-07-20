UCLASS()
class UTerritoryConfig_TC_Arena_Only : UTerritoryConfig
{
    // Only troll can use this territory
    default AnyOneToBeValidTags.AddTag(GameplayTag::Species_Creature_Troll);

    default AssociatedAreaTag = GameplayTag::Area_TrollCanyon_Arena;
}

UCLASS()
class UTerritoryConfig_TC_Arena_Extended : UTerritoryConfig
{
    // Troll cannot use this territory
    default AnyOneToBeForbiddenTags.AddTag(GameplayTag::Species_Creature_Troll);
    
    default AssociatedAreaTag = GameplayTag::Area_TrollCanyon_Arena;
    default AdditionalAreaTags.AddTag(GameplayTag::Area_TrollCanyon_ArenaEntrance);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_TrollCanyon_RuinsSmallBuilding);
}

UCLASS()
class UTerritoryConfig_TC_RuinsBalcony : UTerritoryConfig
{    
    default AssociatedAreaTag = GameplayTag::Area_TrollCanyon_RuinsBalcony;
}

UCLASS()
class UTerritoryConfig_TC_Path : UTerritoryConfig
{    
    default AssociatedAreaTag = GameplayTag::Area_ExchangeZone_TrollCanyonPath_02;
    default AdditionalAreaTags.AddTag(GameplayTag::Area_ExchangeZone_TrollCanyonPath_01);
}

UCLASS()
class UTerritoryConfig_TC_Dungeon : UTerritoryConfig
{
    default AssociatedAreaTag = GameplayTag::Area_TrollCanyon_Dungeon_01;
    default AdditionalAreaTags.AddTag(GameplayTag::Area_TrollCanyon_Dungeon_02);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_TrollCanyon_Dungeon_03);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_TrollCanyon_Dungeon_04);
}