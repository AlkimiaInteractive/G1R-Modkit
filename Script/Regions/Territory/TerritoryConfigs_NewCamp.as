UCLASS()
class UTerritoryConfig_NC_RiceFields : UTerritoryConfig
{
    default AssociatedAreaTag = GameplayTag::Area_NewCamp_Exterior_RiceFields;

    default AdditionalAreaTags.AddTag(GameplayTag::Area_NewCamp_Exterior_RiceFields_Huts);

    default ExcludedAreaTags.AddTag(GameplayTag::Area_NewCamp_Exterior_RiceFields_WatchPost_Building_Room);
    default ExcludedAreaTags.AddTag(GameplayTag::Area_NewCamp_Exterior_RiceFields_WatchPost_Building_TopFloor);
    default ExcludedAreaTags.AddTag(GameplayTag::Area_NewCamp_Exterior_RiceFields_WatchPost_Platform);
    default ExcludedAreaTags.AddTag(GameplayTag::Area_NewCamp_Exterior_RiceFields_WatchPost_SideGate);
}

UCLASS()
class UTerritoryConfig_NC_Watchpost : UTerritoryConfig
{
    default AssociatedAreaTag = GameplayTag::Area_NewCamp_Exterior_RiceFields_WatchPost_Building_Room;

    default AdditionalAreaTags.AddTag(GameplayTag::Area_NewCamp_Exterior_RiceFields_WatchPost_Building_TopFloor);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_NewCamp_Exterior_RiceFields_WatchPost_Platform);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_NewCamp_Exterior_RiceFields_WatchPost_SideGate);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_NewCamp_Exterior);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_NewCamp_Exterior_RiceFields);

    default ExcludedAreaTags.AddTag(GameplayTag::Area_NewCamp_Exterior_LakeNorthShore);
    default ExcludedAreaTags.AddTag(GameplayTag::Area_NewCamp_Exterior_Lake);
}

UCLASS()
class UTerritoryConfig_NC_Lake : UTerritoryConfig
{
    default AnyOneToBeForbiddenTags.AddTag(GameplayTag::Species_Creature_Lurker);
    default AnyOneToBeForbiddenTags.AddTag(GameplayTag::Species_Creature_Lizard);

    default AssociatedAreaTag = GameplayTag::Area_NewCamp_Exterior_LakeNorthShore;
}

UCLASS()
class UTerritoryConfig_NC_SouthShore : UTerritoryConfig
{
    default AnyOneToBeForbiddenTags.AddTag(GameplayTag::Species_Creature_Lurker);
    default AnyOneToBeForbiddenTags.AddTag(GameplayTag::Species_Creature_Lizard);

    default AssociatedAreaTag = GameplayTag::Area_NewCamp_Exterior_Island;
    default AdditionalAreaTags.AddTag(GameplayTag::Area_NewCamp_Exterior);

    default ExcludedAreaTags.AddTag(GameplayTag::Area_NewCamp_Exterior_LakeNorthShore);
    default ExcludedAreaTags.AddTag(GameplayTag::Area_NewCamp_Exterior_Lake);
}

UCLASS()
class UTerritoryConfig_NC_Lake_Aquatic : UTerritoryConfig
{
    default AnyOneToBeValidTags.AddTag(GameplayTag::Species_Creature_Lurker);
    default AnyOneToBeValidTags.AddTag(GameplayTag::Species_Creature_Lizard);

    default AssociatedAreaTag = GameplayTag::Area_NewCamp_Exterior_LakeNorthShore;
    default AdditionalAreaTags.AddTag(GameplayTag::Area_NewCamp_Exterior_Lake);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_NewCamp_Exterior_Island);

    default ExcludedAreaTags.AddTag(GameplayTag::Area_NewCamp_Exterior_Island);
    default ExcludedAreaTags.AddTag(GameplayTag::Area_NewCamp_Exterior_Tavern);
    default ExcludedAreaTags.AddTag(GameplayTag::Area_NewCamp_Exterior_Tavern_Kitchen);
    default ExcludedAreaTags.AddTag(GameplayTag::Area_NewCamp_Exterior_Tavern_Room_Silas);
}

UCLASS()
class UTerritoryConfig_NewCamp_Cave : UTerritoryConfig
{
    default AssociatedAreaTag = GameplayTag::Area_NewCamp_Cave;
    
    default ExcludedAreaTags.AddTag(GameplayTag::Area_NewCamp_Cave_LeeCaveTunnel);
    default ExcludedAreaTags.AddTag(GameplayTag::Area_NewCamp_Cave_LeeCave);
}

UCLASS()
class UTerritoryConfig_NewCamp_WaterMages : UTerritoryConfig
{
    default AssociatedAreaTag = GameplayTag::Area_NewCamp_Cave_WaterMages;

    default AdditionalAreaTags.AddTag(GameplayTag::Area_NewCamp_Cave_WaterMages_Hub_Main);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_NewCamp_Cave_WaterMages_Hub_Cliff);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_NewCamp_Cave_WaterMages_Corridors_01);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_NewCamp_Cave_WaterMages_Corridors_02);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_NewCamp_Cave_WaterMages_Corridors_03);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_NewCamp_Cave_WaterMages_Tree);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_NewCamp_Cave_WaterMages_Library);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_NewCamp_Cave_WaterMages_TeleportArea);
}

UCLASS()
class UTerritoryConfig_NewCamp_OreMountainTunnel : UTerritoryConfig
{
    default AssociatedAreaTag = GameplayTag::Area_NewCamp_Cave_WaterMages_OreMountain;
    default AdditionalAreaTags.AddTag(GameplayTag::Area_NewCamp_Cave_WaterMages_OreMountain_01);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_NewCamp_Cave_WaterMages_OreMountain_02);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_NewCamp_Cave_WaterMages_OreMountain_03);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_NewCamp_Cave_WaterMages_OreMountain_Cave);
}

UCLASS()
class UTerritoryConfig_NewCamp_FirstGate : UTerritoryConfig
{
    default AssociatedAreaTag = GameplayTag::Area_NewCamp_Exterior_FirstGate_Hut;
    default AdditionalAreaTags.AddTag(GameplayTag::Area_NewCamp_Exterior_FirstGate_Passage);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_NewCamp_Exterior_FirstGate_Platform);

}
