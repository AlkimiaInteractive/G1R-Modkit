UCLASS()
class UTerritoryConfig_OM_Adit : UTerritoryConfig
{
    default AssociatedAreaTag = GameplayTag::Area_OldMine_Exterior_Adit;
    default AdditionalAreaTags.AddTag(GameplayTag::Area_OldMine_Exterior_Yard);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_OldMine_Exterior_Adit_Tunnel);
}

UCLASS()
class UTerritoryConfig_OM_GreatStope : UTerritoryConfig
{
    default AssociatedAreaTag = GameplayTag::Area_OldMine_Interior_GreatStope;
    default AdditionalAreaTags.AddTag(GameplayTag::Area_OldMine_Interior_GreatStope_Level_04);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_OldMine_Interior_GreatStope_Level_05);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_OldMine_Interior_GreatStope_Bottom);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_OldMine_Interior_GatedExcavation);
}

UCLASS()
class UTerritoryConfig_OM_AlephGalleries : UTerritoryConfig
{
    default AssociatedAreaTag = GameplayTag::Area_OldMine_Interior_Gallery_01;
    default AdditionalAreaTags.AddTag(GameplayTag::Area_OldMine_Interior_Gallery_02);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_OldMine_Interior_Gallery_03);
}

UCLASS()
class UTerritoryConfig_OM_TemplarGalleries : UTerritoryConfig
{
    default AssociatedAreaTag = GameplayTag::Area_OldMine_Interior_Gallery_09;
    default AdditionalAreaTags.AddTag(GameplayTag::Area_OldMine_Interior_Gallery_10);
}

UCLASS()
class UTerritoryConfig_OM_AbandonedGalleries : UTerritoryConfig // Gear
{
    default AssociatedAreaTag = GameplayTag::Area_OldMine_Interior_Gallery_06;
}

UCLASS()
class UTerritoryConfig_OM_InfestedGallery_A : UTerritoryConfig
{
    default AssociatedAreaTag = GameplayTag::Area_OldMine_Interior_Gallery_08;
}

UCLASS()
class UTerritoryConfig_OM_InfestedGallery_B : UTerritoryConfig
{
    default AssociatedAreaTag = GameplayTag::Area_OldMine_Interior_Gallery_11;
}

UCLASS()
class UTerritoryConfig_OM_Hive : UTerritoryConfig
{
    default AssociatedAreaTag = GameplayTag::Area_OldMine_Interior_Hive_Hatchery;
    default AdditionalAreaTags.AddTag(GameplayTag::Area_OldMine_Interior_Hive_AccessBurrow);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_OldMine_Interior_Hive_QueenAlcove);
}