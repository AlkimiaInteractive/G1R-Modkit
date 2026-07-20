// OT TempleExterior 2, 3
UCLASS()
class UTerritoryConfig_OT_TempleExterior_Entrance : UTerritoryConfig
{
    default AssociatedAreaTag = GameplayTag::Area_OrcTown_TempleExterior_Entrance; //(MV_OT_OrcTempleExterior_02)
    default AdditionalAreaTags.AddTag(GameplayTag::Area_OrcTown_TempleExterior_Hallway); //(MV_OT_OrcTempleExterior_03)
}

// Exterior 4
UCLASS()
class UTerritoryConfig_OT_TempleExterior_Antechamber : UTerritoryConfig
{
    default AssociatedAreaTag = GameplayTag::Area_OrcTown_TempleExterior_Antechamber; //(MV_OT_OrcTempleExterior_04)
}

// Notification + MV_OT01, MV_OT02
UCLASS()
class UTerritoryConfig_SleeperTemple_FirstChamber : UTerritoryConfig
{
    default AssociatedAreaTag = GameplayTag::Area_SleeperTemple_FirstChamber_01; //(LV_TST_Notification)
    default AdditionalAreaTags.AddTag(GameplayTag::Area_SleeperTemple_FirstChamber_02); //(MV_TST_OrcTemple_01)
    default AdditionalAreaTags.AddTag(GameplayTag::Area_SleeperTemple_FirstChamber_03); //(MV_TST_OrcTemple_02)
}

// MV_OT03
UCLASS()
class UTerritoryConfig_SleeperTemple_VarragAntechamber : UTerritoryConfig
{
    default AssociatedAreaTag = GameplayTag::Area_SleeperTemple_VarragAntechamber; //(MV_TST_OrcTemple_03)
}

// Missing Lever Chamber 4 - 8
UCLASS()
class UTerritoryConfig_SleeperTemple_MissingLeverChamber : UTerritoryConfig
{
    default AssociatedAreaTag = GameplayTag::Area_SleeperTemple_MissingLeverChamber_01; //(MV_TST_OrcTemple_04)
    default AdditionalAreaTags.AddTag(GameplayTag::Area_SleeperTemple_MissingLeverChamber_02); //(MV_TST_OrcTemple_05)
    default AdditionalAreaTags.AddTag(GameplayTag::Area_SleeperTemple_MissingLeverChamber_03); //(MV_TST_OrcTemple_06)
    default AdditionalAreaTags.AddTag(GameplayTag::Area_SleeperTemple_MissingLeverChamber_04); //(MV_TST_OrcTemple_07)
    default AdditionalAreaTags.AddTag(GameplayTag::Area_SleeperTemple_MissingLeverChamber_05); //(MV_TST_OrcTemple_08)
}

// MC Tunnels - 9 + MV_OT03
UCLASS()
class UTerritoryConfig_SleeperTemple_MinecrawlerTunnels_01_02 : UTerritoryConfig
{
    default AssociatedAreaTag = GameplayTag::Area_SleeperTemple_MinecrawlerTunnels_01; //(MV_TST_OrcTemple_09)
    default AdditionalAreaTags.AddTag(GameplayTag::Area_SleeperTemple_MissingLeverChamber_02); //(MV_TST_OrcTemple_05)
    default AdditionalAreaTags.AddTag(GameplayTag::Area_SleeperTemple_MinecrawlerTunnels_02); //(MV_TST_OrcTemple_10)
}

// MC Tunnels - 11
UCLASS()
class UTerritoryConfig_SleeperTemple_MinecrawlerTunnels_03 : UTerritoryConfig
{
    default AssociatedAreaTag = GameplayTag::Area_SleeperTemple_MinecrawlerTunnels_03; //(MV_TST_OrcTemple_11)
}

// MC Tunnels - 12 + MV_OT03, 14
UCLASS()
class UTerritoryConfig_SleeperTemple_MinecrawlerTunnels_04 : UTerritoryConfig
{
    default AssociatedAreaTag = GameplayTag::Area_SleeperTemple_MinecrawlerTunnels_04; //(MV_TST_OrcTemple_12)
    default AdditionalAreaTags.AddTag(GameplayTag::Area_SleeperTemple_MissingLeverChamber_02); //(MV_TST_OrcTemple_05)
    default AdditionalAreaTags.AddTag(GameplayTag::Area_SleeperTemple_BloodPuzzlesChamber); //(MV_TST_OrcTemple_14)
}

// 13 + MV_OT03
UCLASS()
class UTerritoryConfig_SleeperTemple_MinecrawlerTunnels_05 : UTerritoryConfig
{
    default AssociatedAreaTag = GameplayTag::Area_SleeperTemple_MinecrawlerTunnels_05; //(MV_TST_OrcTemple_13)
    default AdditionalAreaTags.AddTag(GameplayTag::Area_SleeperTemple_MissingLeverChamber_02); //(MV_TST_OrcTemple_05)
}

// HashorChamber - MV OrcTempleChamber1_02 ex. 01
UCLASS()
class UTerritoryConfig_SleeperTemple_VarragChamber_Hashor : UTerritoryConfig
{
    default AssociatedAreaTag = GameplayTag::Area_SleeperTemple_VarragChamber_Hashor_Arena; //(MV_TST_OrcTempleChamber1_02)
    default ExcludedAreaTags.AddTag(GameplayTag::Area_SleeperTemple_VarragChamber_Hashor_Entrance); //(MV_TST_OrcTempleChamber1_01)
}

// KasorgChamber - MV OrcTempleChamber2_02 ex. 01
UCLASS()
class UTerritoryConfig_SleeperTemple_VarragChamber_Kasorg : UTerritoryConfig
{
    default AssociatedAreaTag = GameplayTag::Area_SleeperTemple_VarragChamber_Kasorg_Arena; //(MV_TST_OrcTempleChamber2_02)
    default ExcludedAreaTags.AddTag(GameplayTag::Area_SleeperTemple_VarragChamber_Kasorg_Entrance); //(MV_TST_OrcTempleChamber2_01)
}

// UnhilqtChamber - LV OrcTempleChamber3_02 + 03, 04 ex. 01
UCLASS()
class UTerritoryConfig_SleeperTemple_VarragChamber_Unhilqt : UTerritoryConfig
{
    default AssociatedAreaTag = GameplayTag::Area_SleeperTemple_VarragChamber_Unhilqt_Arena; //(MV_TST_OrcTempleChamber3_02)
    default AdditionalAreaTags.AddTag(GameplayTag::Area_SleeperTemple_VarragChamber_Unhilqt_01); //(MV_TST_OrcTempleChamber3_03)
    default AdditionalAreaTags.AddTag(GameplayTag::Area_SleeperTemple_VarragChamber_Unhilqt_02); //(MV_TST_OrcTempleChamber3_04)
    default ExcludedAreaTags.AddTag(GameplayTag::Area_SleeperTemple_VarragChamber_Unhilqt_Entrance); //(MV_TST_OrcTempleChamber3_01)
}

// MV OT14
UCLASS()
class UTerritoryConfig_SleeperTemple_BloodPuzzlesChamber : UTerritoryConfig
{
    default AssociatedAreaTag = GameplayTag::Area_SleeperTemple_BloodPuzzlesChamber; //(MV_TST_OrcTemple_14)
}

// MV OT15
UCLASS()
class UTerritoryConfig_SleeperTemple_VarragAntechamber_Ruuushk_01 : UTerritoryConfig
{
    default AssociatedAreaTag = GameplayTag::Area_SleeperTemple_VarragChamber_Ruuushk_Antechamber_01; //(MV_TST_OrcTemple_15)
}

// MV OT16 + MVOT25, (Ruuushk) MVOTC4_01, MVOTC4_02
UCLASS()
class UTerritoryConfig_SleeperTemple_VarragAntechamber_Ruuushk_02 : UTerritoryConfig
{
    default AssociatedAreaTag = GameplayTag::Area_SleeperTemple_VarragChamber_Ruuushk_Antechamber_02; //(MV_TST_OrcTemple_16)
    default AdditionalAreaTags.AddTag(GameplayTag::Area_SleeperTemple_VarragChamber_Ruuushk_Antechamber_04); //(MV_TST_OrcTemple_25)
    default AdditionalAreaTags.AddTag(GameplayTag::Area_SleeperTemple_VarragChamber_Ruuushk_Entrance_01); //(MV_TST_OrcTempleChamber4_01)
    default AdditionalAreaTags.AddTag(GameplayTag::Area_SleeperTemple_VarragChamber_Ruuushk_Entrance_02); //(MV_TST_OrcTempleChamber4_02)
}

// MV OT22
UCLASS()
class UTerritoryConfig_SleeperTemple_VarragAntechamber_Ruuushk_03 : UTerritoryConfig
{
    default AssociatedAreaTag = GameplayTag::Area_SleeperTemple_VarragChamber_Ruuushk_Antechamber_03; //(MV_TST_OrcTemple_22)
}

// MV OT25
UCLASS()
class UTerritoryConfig_SleeperTemple_VarragAntechamber_Ruuushk_04 : UTerritoryConfig
{
    default AssociatedAreaTag = GameplayTag::Area_SleeperTemple_VarragChamber_Ruuushk_Antechamber_04; //(MV_TST_OrcTemple_25)
}

// RuuushkChamber - MVOTC4_03 + MVOTC4_04, MVOTC4_02, MVOT17, MVOTC4_05, MVOTC4_06, MVOTC4_07, MVOTC4_08
UCLASS()
class UTerritoryConfig_SleeperTemple_VarragChamber_Ruuushk : UTerritoryConfig
{
    default AssociatedAreaTag = GameplayTag::Area_SleeperTemple_VarragChamber_Ruuushk_Arena_01; //(MV_TST_OrcTempleChamber4_03)
    default AdditionalAreaTags.AddTag(GameplayTag::Area_SleeperTemple_VarragChamber_Ruuushk_Entrance_02); //(MV_TST_OrcTempleChamber4_02)
    default AdditionalAreaTags.AddTag(GameplayTag::Area_SleeperTemple_VarragChamber_Ruuushk_Arena_02); //(MV_TST_OrcTempleChamber4_04)
    default AdditionalAreaTags.AddTag(GameplayTag::Area_SleeperTemple_VarragChamber_Ruuushk_Arena_Annex); //(MV_TST_OrcTemple_17)
    default AdditionalAreaTags.AddTag(GameplayTag::Area_SleeperTemple_VarragChamber_Ruuushk_Arena_03); //(MV_TST_OrcTempleChamber4_05)
    default AdditionalAreaTags.AddTag(GameplayTag::Area_SleeperTemple_VarragChamber_Ruuushk_Arena_04); //(MV_TST_OrcTempleChamber4_06)
    default AdditionalAreaTags.AddTag(GameplayTag::Area_SleeperTemple_VarragChamber_Ruuushk_Arena_05); //(MV_TST_OrcTempleChamber4_07)
    default AdditionalAreaTags.AddTag(GameplayTag::Area_SleeperTemple_VarragChamber_Ruuushk_Arena_06); //(MV_TST_OrcTempleChamber4_08)
}

// MVOT19 + MVOT18
UCLASS()
class UTerritoryConfig_SleeperTemple_VarragChamber_Ruuushk_SmallCave : UTerritoryConfig
{
    default AssociatedAreaTag = GameplayTag::Area_SleeperTemple_VarragChamber_Ruuushk_SmallCave_01; //(MV_TST_OrcTemple_19)
    default AdditionalAreaTags.AddTag(GameplayTag::Area_SleeperTemple_VarragChamber_Ruuushk_SmallCave_02); //(MV_TST_OrcTemple_18)
}

// MV OT21
UCLASS()
class UTerritoryConfig_SleeperTemple_MinecrawlerTunnels_06 : UTerritoryConfig
{
    default AssociatedAreaTag = GameplayTag::Area_SleeperTemple_MinecrawlerTunnels_06; //(MV_TST_OrcTemple_21)
}

// MV OT23, MV OT24
UCLASS()
class UTerritoryConfig_SleeperTemple_MinecrawlerTunnels_Forge : UTerritoryConfig
{
    default AssociatedAreaTag = GameplayTag::Area_SleeperTemple_MinecrawlerTunnels_Forge_01; //(MV_TST_OrcTemple_23)
    default AdditionalAreaTags.AddTag(GameplayTag::Area_SleeperTemple_MinecrawlerTunnels_Forge_02); //(MV_TST_OrcTemple_24)
}

// MV OT27 + MV OT26, MV OT30
UCLASS()
class UTerritoryConfig_SleeperTemple_LavaStronghold : UTerritoryConfig
{
    default AssociatedAreaTag = GameplayTag::Area_SleeperTemple_LavaStronghold_01; //(MV_TST_OrcTemple_27)
    default AdditionalAreaTags.AddTag(GameplayTag::Area_SleeperTemple_LavaStronghold_02); //(MV_TST_OrcTemple_26)
    default AdditionalAreaTags.AddTag(GameplayTag::Area_SleeperTemple_LavaStronghold_03); //(MV_TST_OrcTemple_30)
}

// MV OT28 + MVOT29 (secret hallways)
UCLASS()
class UTerritoryConfig_SleeperTemple_LavaStronghold_SecretPathways : UTerritoryConfig
{
    default AssociatedAreaTag = GameplayTag::Area_SleeperTemple_LavaStronghold_SecretPathway; //(MV_TST_OrcTemple_28)
    default AdditionalAreaTags.AddTag(GameplayTag::Area_SleeperTemple_LavaStronghold_SecretChamber); //(MV_TST_OrcTemple_29)
}

// MV OT31 + MV OT32 (Fortress) + LV Arushat bridge
UCLASS()
class UTerritoryConfig_SleeperTemple_Fortress : UTerritoryConfig
{
    default AssociatedAreaTag = GameplayTag::Area_SleeperTemple_Fortress_01; //(MV_TST_OrcTemple_31)
    default AdditionalAreaTags.AddTag(GameplayTag::Area_SleeperTemple_Fortress_02); //(MV_TST_OrcTemple_32)
    default AdditionalAreaTags.AddTag(GameplayTag::Area_SleeperTemple_VarragChamber_Arushat_Bridge); //(MV_TST_OrcTemple_33)
}

// ArushatChamber - MV Dungeons01
UCLASS()
class UTerritoryConfig_SleeperTemple_VarragArushatChamber : UTerritoryConfig
{
    default AssociatedAreaTag = GameplayTag::Area_SleeperTemple_VarragChamber_Arushat_Arena; //(MV_TST_OrcTempleSleeperDungeons_01)
}

// Final - Dungeon 02, 03
UCLASS()
class UTerritoryConfig_SleeperTemple_FinalDungeon : UTerritoryConfig
{
    default AssociatedAreaTag = GameplayTag::Area_SleeperTemple_FinalChambers_01; //(MV_TST_OrcTempleSleeperDungeons_02)
    default AdditionalAreaTags.AddTag(GameplayTag::Area_SleeperTemple_FinalChambers_02); //(MV_TST_OrcTempleSleeperDungeons_03)
}

// Sleeper chamber - MV SleeperHall
UCLASS()
class UTerritoryConfig_SleeperTemple_SleeperHall : UTerritoryConfig
{
    default AssociatedAreaTag = GameplayTag::Area_SleeperTemple_FinalChambers_SleeperHall; //(MV_TST_OrcTempleSleeperHall_01)
}