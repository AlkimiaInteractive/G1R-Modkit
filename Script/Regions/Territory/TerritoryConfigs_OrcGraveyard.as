UCLASS()
class UTerritoryConfig_OG_OrcGraveyard: UTerritoryConfig
{
    default AssociatedAreaTag = GameplayTag::Area_OrcGraveyard;
}

UCLASS()
class UTerritoryConfig_OG_EntranceCavern : UTerritoryConfig
{
    default AssociatedAreaTag = GameplayTag::Area_OrcGraveyard_Dungeon_Cavern;
    default AdditionalAreaTags.AddTag(GameplayTag::Area_OrcGraveyard_Dungeon_EntranceTunnel);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_OrcGraveyard_Dungeon_Antechamber);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_OrcGraveyard_Dungeon_Antechamber_Hallway);
}

UCLASS()
class UTerritoryConfig_OG_Antechamber : UTerritoryConfig
{
    default AssociatedAreaTag = GameplayTag::Area_OrcGraveyard_Dungeon_Antechamber;
    default AdditionalAreaTags.AddTag(GameplayTag::Area_OrcGraveyard_Dungeon_Cavern);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_OrcGraveyard_Dungeon_Antechamber_Hallway);
}

UCLASS()
class UTerritoryConfig_OG_BrokenFloorChamber : UTerritoryConfig
{
    default AssociatedAreaTag = GameplayTag::Area_OrcGraveyard_Dungeon_BrokenFloorChamber;
    default AdditionalAreaTags.AddTag(GameplayTag::Area_OrcGraveyard_Dungeon_BrokenFloorChamber_Hallway);
}

UCLASS()
class UTerritoryConfig_OG_CellChamber : UTerritoryConfig
{
    default AssociatedAreaTag = GameplayTag::Area_OrcGraveyard_Dungeon_Crypt_CellChamber;
    default AdditionalAreaTags.AddTag(GameplayTag::Area_OrcGraveyard_Dungeon_Crypt_CellChamber_Hallway);
}

UCLASS()
class UTerritoryConfig_OG_GreatChamber : UTerritoryConfig
{
    default AssociatedAreaTag = GameplayTag::Area_OrcGraveyard_Dungeon_GreatChamber;
    default AdditionalAreaTags.AddTag(GameplayTag::Area_OrcGraveyard_Dungeon_GreatChamber_Entrance);
}

UCLASS()
class UTerritoryConfig_OG_TombChamber : UTerritoryConfig
{
    default AssociatedAreaTag = GameplayTag::Area_OrcGraveyard_Dungeon_TombChamber;
}

UCLASS()
class UTerritoryConfig_OG_CryptStaircase : UTerritoryConfig
{
    default AssociatedAreaTag = GameplayTag::Area_OrcGraveyard_Dungeon_Crypt_Staircase;
}

UCLASS()
class UTerritoryConfig_OG_Crypts : UTerritoryConfig
{
    default AssociatedAreaTag = GameplayTag::Area_OrcGraveyard_Dungeon_Crypt_Nexus;
    default AdditionalAreaTags.AddTag(GameplayTag::Area_OrcGraveyard_Dungeon_Crypt_Tunnel_01);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_OrcGraveyard_Dungeon_Crypt_Tunnel_02);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_OrcGraveyard_Dungeon_Crypt_DeepestChamber);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_OrcGraveyard_Dungeon_Crypt_CellChamber_Hallway);
}