UCLASS()
class UTerritoryConfig_FME_MountainTunnel : UTerritoryConfig
{
    default AssociatedAreaTag = GameplayTag::Area_FreeMine_Exterior_MountainTunnel_1;
    default AdditionalAreaTags.AddTag(GameplayTag::Area_NewCampOutskirts_FreeMinePath);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_FreeMine_Exterior_MountainTunnel_2);
}

UCLASS()
class UTerritoryConfig_FME_MountainOpening : UTerritoryConfig
{
    default AssociatedAreaTag = GameplayTag::Area_FreeMine_Exterior_MountainOpening;
    default AdditionalAreaTags.AddTag(GameplayTag::Area_FreeMine_Exterior_MountainTunnel_2);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_FreeMine_Exterior_EntranceApproach);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_FreeMine_Exterior_CreekPassage);
}

UCLASS()
class UTerritoryConfig_FME_Creek : UTerritoryConfig
{
    default AssociatedAreaTag = GameplayTag::Area_FreeMine_Exterior_Creek;
    default AdditionalAreaTags.AddTag(GameplayTag::Area_FreeMine_Exterior_CreekPassage);
}

UCLASS()
class UTerritoryConfig_FME_DefilePath : UTerritoryConfig
{
    default AssociatedAreaTag = GameplayTag::Area_FreeMine_Exterior_DefilePath;
}

UCLASS()
class UTerritoryConfig_FM_OpenPit : UTerritoryConfig
{
    default AssociatedAreaTag = GameplayTag::Area_FreeMine_Interior_OpenPit;

    default AdditionalAreaTags.AddTag(GameplayTag::Area_FreeMine_Interior_MainGate);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_FreeMine_Interior_DeepMine_Gate);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_FreeMine_Interior_OpenPit_Gallery_01);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_FreeMine_Interior_OpenPit_Gallery_02);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_FreeMine_Interior_OpenPit_Gallery_03);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_FreeMine_Interior_OpenPit_Gallery_04);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_FreeMine_Interior_OpenPit_Gallery_05);
}

UCLASS()
class UTerritoryConfig_FM_DeepMineEntrance : UTerritoryConfig
{
    default AssociatedAreaTag = GameplayTag::Area_FreeMine_Interior_DeepMine_FirstChamber;

    default AdditionalAreaTags.AddTag(GameplayTag::Area_FreeMine_Interior_DeepMine_Gate);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_FreeMine_Interior_DeepMine_Adit);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_FreeMine_Interior_DeepMine_SecondChamber);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_FreeMine_Interior_DeepMine_GalleryToSecondChamber);
}

UCLASS()
class UTerritoryConfig_FM_Prison : UTerritoryConfig
{
    default AssociatedAreaTag = GameplayTag::Area_FreeMine_Interior_DeepMine_Prison;

    default AdditionalAreaTags.AddTag(GameplayTag::Area_FreeMine_Interior_DeepMine_AbandonedTunnels_01);
}

UCLASS()
class UTerritoryConfig_FM_AbandonedTunnels : UTerritoryConfig
{
    default AssociatedAreaTag = GameplayTag::Area_FreeMine_Interior_DeepMine_AbandonedTunnels_02;

    default AdditionalAreaTags.AddTag(GameplayTag::Area_FreeMine_Interior_DeepMine_AbandonedTunnels_01);
}

UCLASS()
class UTerritoryConfig_FM_FinalChamber : UTerritoryConfig
{
    default AssociatedAreaTag = GameplayTag::Area_FreeMine_Interior_DeepMine_FinalChamber;
}

UCLASS()
class UTerritoryConfig_FM_Shortcut : UTerritoryConfig
{
    default AssociatedAreaTag = GameplayTag::Area_FreeMine_Interior_DeepMine_Shortcut_01;

    default AdditionalAreaTags.AddTag(GameplayTag::Area_FreeMine_Interior_DeepMine_Shortcut_02);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_FreeMine_Interior_DeepMine_Shortcut_03);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_FreeMine_Interior_DeepMine_Shortcut_04);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_FreeMine_Interior_DeepMine_Shortcut_05);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_FreeMine_Interior_DeepMine_Shortcut_06);
}