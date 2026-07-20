UCLASS()
class UTerritoryConfig_BC_Tunnel : UTerritoryConfig
{
    default AssociatedAreaTag = GameplayTag::Area_BanditsCamp_CanyonTunnel_Entrance;
    default AdditionalAreaTags.AddTag(GameplayTag::Area_BanditsCamp_CanyonTunnel_01);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_BanditsCamp_CanyonTunnel_02);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_BanditsCamp_CanyonTunnel_03);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_BanditsCamp_CanyonTunnel_LiftStaircase);
}

UCLASS()
class UTerritoryConfig_BC_Balcony : UTerritoryConfig
{
    default AssociatedAreaTag = GameplayTag::Area_BanditsCamp_Plateau_ExchangeBalcony;
    default AdditionalAreaTags.AddTag(GameplayTag::Area_BanditsCamp_Plateau_Tunnel);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_BanditsCamp_CanyonTunnel_StaircaseExit);
}

UCLASS()
class UTerritoryConfig_BC_CampTunnel : UTerritoryConfig
{
    default AssociatedAreaTag = GameplayTag::Area_BanditsCamp_Plateau_Tunnel;
    default AdditionalAreaTags.AddTag(GameplayTag::Area_BanditsCamp_Plateau_ExchangeBalcony);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_BanditsCamp_Plateau_MainCamp);
}

UCLASS()
class UTerritoryConfig_BC_MainCamp : UTerritoryConfig
{
    default AssociatedAreaTag = GameplayTag::Area_BanditsCamp_Plateau_MainCamp;
    default AdditionalAreaTags.AddTag(GameplayTag::Area_BanditsCamp_Plateau_Tunnel);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_BanditsCamp_Plateau_MainCamp);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_BanditsCamp_Plateau_MainCamp_LootCave);
}