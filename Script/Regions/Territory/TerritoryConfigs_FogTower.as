UCLASS()
class UTerritoryConfigs_FT_Dungeons : UTerritoryConfig
{
    default AssociatedAreaTag = GameplayTag::Area_FogTower_Prison_02;
    default AdditionalAreaTags.AddTag(GameplayTag::Area_FogTower_Prison_01);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_FogTower_Prison_03);
}

UCLASS()
class UTerritoryConfigs_FT_FirstTunnelSection : UTerritoryConfig
{
    default AssociatedAreaTag = GameplayTag::Area_FogTower_Tunnels_01;
    default AdditionalAreaTags.AddTag(GameplayTag::Area_FogTower_Tunnels_01_Joint);
}

UCLASS()
class UTerritoryConfigs_FT_SecondTunnelSection : UTerritoryConfig
{
    default AssociatedAreaTag = GameplayTag::Area_FogTower_Tunnels_02;
}

UCLASS()
class UTerritoryConfigs_FT_SkeletonMageChambers : UTerritoryConfig
{
    default AssociatedAreaTag = GameplayTag::Area_FogTower_SKMageChamber_02;
    default AdditionalAreaTags.AddTag(GameplayTag::Area_FogTower_SKMageChamber_01);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_FogTower_Tunnels_03);
}