/// Exchange Zone
UCLASS()
class UTerritoryConfig_EZ_Elevator : UTerritoryConfig
{
    default AssociatedAreaTag = GameplayTag::Area_ExchangeZone_Elevator;
    default AdditionalAreaTags.AddLeafTag(GameplayTag::Area_ExchangeZone_Hut);
    default AdditionalAreaTags.AddLeafTag(GameplayTag::Area_ExchangeZone_Cage_01);
}

UCLASS()
class UTerritoryConfig_EZ_OrryGate : UTerritoryConfig
{
    default AssociatedAreaTag = GameplayTag::Area_ExchangeZone_OrryGate;
    default AdditionalAreaTags.AddLeafTag(GameplayTag::Area_ExchangeZone_NamelessGrandEntrance);
    default AdditionalAreaTags.AddLeafTag(GameplayTag::Area_ExchangeZone_ClosedMine);
}

UCLASS()
class UTerritoryConfig_EZ_ClosedMine : UTerritoryConfig
{
    default AssociatedAreaTag = GameplayTag::Area_ExchangeZone_ClosedMine;
}

UCLASS()
class UTerritoryConfig_EZ_HangedManTree : UTerritoryConfig
{
    default AssociatedAreaTag = GameplayTag::Area_ExchangeZone_HangedManTree;
}

UCLASS()
class UTerritoryConfig_EZ_Hilltop : UTerritoryConfig
{
    default AssociatedAreaTag = GameplayTag::Area_ExchangeZone_Hilltop;
}

// Abandoned mine
///Abandoned Mine REVISE
UCLASS()
class UTerritoryConfig_AM_AbandonedMine_EntranceHall_01 : UTerritoryConfig
{
    default AssociatedAreaTag = GameplayTag::Area_AbandonedMine_EntranceHall_01;
}

UCLASS()
class UTerritoryConfig_AM_AbandonedMine_EntranceHall_02 : UTerritoryConfig
{
    default AssociatedAreaTag = GameplayTag::Area_AbandonedMine_EntranceHall_02;
}

UCLASS()
class UTerritoryConfig_AM_AbandonedMine_Gallery_01 : UTerritoryConfig
{
    default AssociatedAreaTag = GameplayTag::Area_AbandonedMine_Gallery_01;
}

UCLASS()
class UTerritoryConfig_AM_AbandonedMine_Gallery_02 : UTerritoryConfig
{
    default AssociatedAreaTag = GameplayTag::Area_AbandonedMine_Gallery_02_A;
    default AdditionalAreaTags.AddLeafTag(GameplayTag::Area_AbandonedMine_Gallery_02_B);
}

UCLASS()
class UTerritoryConfig_AM_AbandonedMine_MainChamber : UTerritoryConfig
{
    default AssociatedAreaTag = GameplayTag::Area_AbandonedMine_MainChamber;
    default AdditionalAreaTags.AddLeafTag(GameplayTag::Area_AbandonedMine_MainChamber_UpperElevatorArea);
}

UCLASS()
class UTerritoryConfig_AM_AbandonedMine_Gallery_03 : UTerritoryConfig
{
    default AssociatedAreaTag = GameplayTag::Area_AbandonedMine_Gallery_03;
}

UCLASS()
class UTerritoryConfig_AM_AbandonedMine_Gallery_04 : UTerritoryConfig
{
    default AssociatedAreaTag = GameplayTag::Area_AbandonedMine_Gallery_04_A;
    default AdditionalAreaTags.AddLeafTag(GameplayTag::Area_AbandonedMine_Gallery_04_B);
    default AdditionalAreaTags.AddLeafTag(GameplayTag::Area_AbandonedMine_Gallery_04_C);
}

UCLASS()
class UTerritoryConfig_AM_AbandonedMine_Gallery_05 : UTerritoryConfig
{
    default AssociatedAreaTag = GameplayTag::Area_AbandonedMine_Gallery_05;
}

UCLASS()
class UTerritoryConfig_AM_AbandonedMine_Gallery_06 : UTerritoryConfig
{
    default AssociatedAreaTag = GameplayTag::Area_AbandonedMine_Gallery_06;
}

UCLASS()
class UTerritoryConfig_AM_AbandonedMine_Gallery_07 : UTerritoryConfig
{
    default AssociatedAreaTag = GameplayTag::Area_AbandonedMine_Gallery_07;
}

UCLASS()
class UTerritoryConfig_AM_AbandonedMine_Temple_01 : UTerritoryConfig
{
    default AssociatedAreaTag = GameplayTag::Area_AbandonedMine_Temple_01;
}

UCLASS()
class UTerritoryConfig_AM_AbandonedMine_Temple_02 : UTerritoryConfig
{
    default AssociatedAreaTag = GameplayTag::Area_AbandonedMine_Temple_02;
}

UCLASS()
class UTerritoryConfig_AM_AbandonedMine_Temple_03 : UTerritoryConfig
{
    default AssociatedAreaTag = GameplayTag::Area_AbandonedMine_Temple_03;
}

UCLASS()
class UTerritoryConfig_AM_AbandonedMine_Temple_Cavern : UTerritoryConfig
{
    default AssociatedAreaTag = GameplayTag::Area_AbandonedMine_Temple_Cavern_01;
    default AdditionalAreaTags.AddLeafTag(GameplayTag::Area_AbandonedMine_Temple_Cavern_02);
}

///

UCLASS()
class UTerritoryConfig_EZF_Forest_Road_Convoy: UTerritoryConfig
{
    default AnyOneToBeValidTags.AddTag(GameplayTag::Guild_Human_Convoy);

    default AssociatedAreaTag = GameplayTag::Area_ExchangeZone_Forest_Road;
}

UCLASS()
class UTerritoryConfig_EZF_Forest_Extended: UTerritoryConfig
{
    default AnyOneToBeForbiddenTags.AddTag(GameplayTag::Species_Creature_Lurker);
    default AnyOneToBeForbiddenTags.AddTag(GameplayTag::Species_Creature_Lizard);
    default AnyOneToBeForbiddenTags.AddTag(GameplayTag::Guild_Human_Convoy);

    default AssociatedAreaTag = GameplayTag::Area_ExchangeZone_Forest;
    default AdditionalAreaTags.AddTag(GameplayTag::Area_ExchangeZone_Forest_Road);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_ExchangeZone_TrollCanyonPath_01);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_ExchangeZone_OldMineRoad);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_ExchangeZone_NorthWestPath);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_ExchangeZone_SouthWestPath);
}

UCLASS()
class UTerritoryConfig_EZF_Forest_Extended_Aquatic : UTerritoryConfig
{
    default AnyOneToBeValidTags.AddTag(GameplayTag::Species_Creature_Lurker);
    default AnyOneToBeValidTags.AddTag(GameplayTag::Species_Creature_Lizard);

    default AssociatedAreaTag = GameplayTag::Area_ExchangeZone_Forest;
    default AdditionalAreaTags.AddTag(GameplayTag::Area_ExchangeZone_Forest_Road);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_ExchangeZone_TrollCanyonPath_01);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_ExchangeZone_OldMineRoad);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_ExchangeZone_NorthWestPath);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_ExchangeZone_SouthWestPath);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_ExchangeZone_River);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_ExchangeZone_SouthRiverBank);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_ExchangeZone_SouthRiverBank_Canyon);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_ExchangeZone_SouthRiverBank_GoblinCave);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_ExchangeZone_SouthRiverBankMeander);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_OldCampOutskirts_WestRiverbankDefile);
}

UCLASS()
class UTerritoryConfig_EZF_RiverBank : UTerritoryConfig
{
    default AnyOneToBeForbiddenTags.AddTag(GameplayTag::Species_Creature_Lurker);
    default AnyOneToBeForbiddenTags.AddTag(GameplayTag::Species_Creature_Lizard);
    default AnyOneToBeForbiddenTags.AddTag(GameplayTag::Guild_Human_Convoy);

    default AssociatedAreaTag = GameplayTag::Area_ExchangeZone_SouthRiverBank;
    default AdditionalAreaTags.AddTag(GameplayTag::Area_ExchangeZone_SouthRiverBank_Canyon);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_ExchangeZone_SouthRiverBank_GoblinCave);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_WeedMixers_ForestPath);
}

UCLASS()
class UTerritoryConfig_EZF_RiverBankMeander : UTerritoryConfig
{
    default AnyOneToBeForbiddenTags.AddTag(GameplayTag::Species_Creature_Lurker);
    default AnyOneToBeForbiddenTags.AddTag(GameplayTag::Species_Creature_Lizard);
    default AnyOneToBeForbiddenTags.AddTag(GameplayTag::Guild_Human_Convoy);

    default AssociatedAreaTag = GameplayTag::Area_ExchangeZone_SouthRiverBankMeander;
    default AdditionalAreaTags.AddTag(GameplayTag::Area_OldCampOutskirts_WestRiverbankDefile);
}

UCLASS()
class UTerritoryConfig_EZF_RiverBank_Aquatic : UTerritoryConfig
{
    default AnyOneToBeValidTags.AddTag(GameplayTag::Species_Creature_Lurker);
    default AnyOneToBeValidTags.AddTag(GameplayTag::Species_Creature_Lizard);

    default AssociatedAreaTag = GameplayTag::Area_ExchangeZone_SouthRiverBank;
    default AdditionalAreaTags.AddTag(GameplayTag::Area_ExchangeZone_SouthRiverBank_Canyon);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_ExchangeZone_SouthRiverBank_GoblinCave);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_WeedMixers_ForestPath);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_ExchangeZone_River);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_ExchangeZone_SouthRiverBankMeander);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_OldCampOutskirts_WestRiverbankDefile);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_ExchangeZone_Forest);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_ExchangeZone_Forest_Road);
}

UCLASS()
class UTerritoryConfig_EZF_RiverBankMeander_Aquatic : UTerritoryConfig
{
    default AnyOneToBeValidTags.AddTag(GameplayTag::Species_Creature_Lurker);
    default AnyOneToBeValidTags.AddTag(GameplayTag::Species_Creature_Lizard);

    default AssociatedAreaTag = GameplayTag::Area_ExchangeZone_SouthRiverBankMeander;
    default AdditionalAreaTags.AddTag(GameplayTag::Area_ExchangeZone_River);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_ExchangeZone_SouthRiverBank);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_ExchangeZone_SouthRiverBank_Canyon);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_ExchangeZone_SouthRiverBank_GoblinCave);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_OldCampOutskirts_WestRiverbankDefile);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_ExchangeZone_Forest);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_ExchangeZone_Forest_Road);
}

UCLASS()
class UTerritoryConfig_EZF_TrollCanyonPath_Extended: UTerritoryConfig
{
    default AnyOneToBeForbiddenTags.AddTag(GameplayTag::Guild_Human_Convoy);
    
    default AssociatedAreaTag = GameplayTag::Area_ExchangeZone_TrollCanyonPath_01;
    default AdditionalAreaTags.AddTag(GameplayTag::Area_ExchangeZone_Forest);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_ExchangeZone_Forest_Road);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_ExchangeZone_TrollCanyonPath_02);
}

UCLASS()
class UTerritoryConfig_EZF_WaterfallCave_InnosAltar: UTerritoryConfig
{
    default AssociatedAreaTag = GameplayTag::Area_ExchangeZone_WaterfallCave;
}