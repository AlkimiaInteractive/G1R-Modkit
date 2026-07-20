UCLASS()
class UTerritoryConfig_MF_WestPlain: UTerritoryConfig
{
    default AssociatedAreaTag = GameplayTag::Area_MountainFortress_Plain_West;
    default AdditionalAreaTags.AddTag(GameplayTag::Area_MountainFortress_Plain_Path);
}

UCLASS()
class UTerritoryConfig_MF_EastPlain: UTerritoryConfig
{
    default AssociatedAreaTag = GameplayTag::Area_MountainFortress_Plain_East;
    default AdditionalAreaTags.AddTag(GameplayTag::Area_MountainFortress_Plain_Path);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_EastForest_OrcGraveyardPath);
}

UCLASS()
class UTerritoryConfig_MF_Bridge: UTerritoryConfig
{
    default AssociatedAreaTag = GameplayTag::Area_MountainFortress_Bridge;
    default AdditionalAreaTags.AddTag(GameplayTag::Area_MountainFortress_BridgeClearing);
}

UCLASS()
class UTerritoryConfig_MF_Courtyard: UTerritoryConfig
{
    default AssociatedAreaTag = GameplayTag::Area_MountainFortress_ZwingerCourtyard;
}

UCLASS()
class UTerritoryConfigs_MF_Focus : UTerritoryConfig
{
    default AssociatedAreaTag = GameplayTag::Area_MountainFortress_Keep_Focus;
    default AdditionalAreaTags.AddTag(GameplayTag::Area_MountainFortress_Keep_Cliffside);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_MountainFortress_Keep_KeepSurroundings_Balcony_01);
}

UCLASS()
class UTerritoryConfigs_MF_KeepSurroundings : UTerritoryConfig
{
    /** Exterior + Tower and Top floor interiors */
    default AssociatedAreaTag = GameplayTag::Area_MountainFortress_Keep_KeepSurroundings_Balcony_01;
    default AdditionalAreaTags.AddTag(GameplayTag::Area_MountainFortress_Keep_Cliffside);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_MountainFortress_Keep_Focus);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_MountainFortress_Keep_Interior_Tower_1);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_MountainFortress_Keep_KeepSurroundings_FlyArea_01);

    default ExcludedAreaTags.AddTag(GameplayTag::Area_MountainFortress_Keep_Interior_FirstFloor_Antechamber);
    default ExcludedAreaTags.AddTag(GameplayTag::Area_MountainFortress_Keep_Interior_FirstFloor_Chambers_DiningRoom);
    default ExcludedAreaTags.AddTag(GameplayTag::Area_MountainFortress_Keep_Interior_FirstFloor_Chambers_DiningRoomAnnex);
    default ExcludedAreaTags.AddTag(GameplayTag::Area_MountainFortress_Keep_Interior_FirstFloor_Chambers_Library);
}

UCLASS()
class UTerritoryConfigs_MF_Entrance : UTerritoryConfig
{
    default AssociatedAreaTag = GameplayTag::Area_MountainFortress_Keep_Interior_Entrance;
    default AdditionalAreaTags.AddTag(GameplayTag::Area_MountainFortress_Keep_Interior_Tower_1);
}

UCLASS()
class UTerritoryConfigs_MF_TowerBase : UTerritoryConfig
{
    default AssociatedAreaTag = GameplayTag::Area_MountainFortress_Keep_Interior_Tower_1;
    default AdditionalAreaTags.AddTag(GameplayTag::Area_MountainFortress_Keep_Interior_Entrance);
}

UCLASS()
class UTerritoryConfigs_MF_TowerMid : UTerritoryConfig
{
    default AssociatedAreaTag = GameplayTag::Area_MountainFortress_Keep_Interior_Tower_2;
    default AdditionalAreaTags.AddTag(GameplayTag::Area_MountainFortress_Keep_Interior_Tower_3);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_MountainFortress_Keep_KeepSurroundings_Balcony_02);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_MountainFortress_Keep_KeepSurroundings_Balcony_03);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_MountainFortress_Keep_KeepSurroundings_FlyArea_02);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_MountainFortress_Keep_KeepSurroundings_FlyArea_03);
}

UCLASS()
class UTerritoryConfigs_MF_TowerTop : UTerritoryConfig
{
    default AssociatedAreaTag = GameplayTag::Area_MountainFortress_Keep_Interior_Tower_3;
    default AdditionalAreaTags.AddTag(GameplayTag::Area_MountainFortress_Keep_Interior_Tower_2);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_MountainFortress_Keep_KeepSurroundings_Balcony_02);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_MountainFortress_Keep_KeepSurroundings_Balcony_03);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_MountainFortress_Keep_KeepSurroundings_FlyArea_02);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_MountainFortress_Keep_KeepSurroundings_FlyArea_03);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_MountainFortress_Keep_KeepSurroundings_FlyArea_04);
}

UCLASS()
class UTerritoryConfigs_MF_Cellar : UTerritoryConfig
{
    default AssociatedAreaTag = GameplayTag::Area_MountainFortress_Keep_Interior_Cellar;
}

UCLASS()
class UTerritoryConfigs_MF_FirstFloor : UTerritoryConfig
{
    default AssociatedAreaTag = GameplayTag::Area_MountainFortress_Keep_Interior_FirstFloor_Chambers_Library;
    default AdditionalAreaTags.AddTag(GameplayTag::Area_MountainFortress_Keep_Interior_FirstFloor_Chambers_DiningRoom);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_MountainFortress_Keep_Interior_FirstFloor_Chambers_DiningRoomAnnex);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_MountainFortress_Keep_Interior_FirstFloor_Chambers_Pantry);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_MountainFortress_Keep_Interior_FirstFloor_Antechamber);
}

UCLASS()
class UTerritoryConfigs_MF_Hall : UTerritoryConfig
{
    default AssociatedAreaTag = GameplayTag::Area_MountainFortress_Keep_Interior_Hall;
    default AdditionalAreaTags.AddTag(GameplayTag::Area_MountainFortress_Keep_Interior_Tower_1);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_MountainFortress_Keep_Cliffside);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_MountainFortress_Keep_KeepSurroundings_Balcony_01);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_MountainFortress_Keep_KeepSurroundings_FlyArea_01);
}