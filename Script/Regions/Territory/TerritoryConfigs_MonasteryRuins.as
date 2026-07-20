UCLASS()
class UTerritoryConfig_AMR_Plane : UTerritoryConfig
{
    default AssociatedAreaTag = GameplayTag::Area_MonasteryRuins_Plane;
    default ExcludedAreaTags.AddTag(GameplayTag::Area_MonasteryRuins_Canyon_Entry);
    default ExcludedAreaTags.AddTag(GameplayTag::Area_MonasteryRuins_Canyon_Tunnel);
    default ExcludedAreaTags.AddTag(GameplayTag::Area_MonasteryRuins_Canyon_Cave);
}

UCLASS()
class UTerritoryConfigs_AMR_Cloister : UTerritoryConfig
{
    default AssociatedAreaTag = GameplayTag::Area_MonasteryRuins_Cloister_Patio;
    default AdditionalAreaTags.AddTag(GameplayTag::Area_MonasteryRuins_Interior_DugoutRoom);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_MonasteryRuins_Interior_ShrineRoom);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_MonasteryRuins_Interior_StorageRoom);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_MonasteryRuins_CollapsedWall);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_MonasteryRuins_Cliffside);
}

UCLASS()
class UTerritoryConfigs_AMR_Canyon : UTerritoryConfig
{
    default AssociatedAreaTag = GameplayTag::Area_MonasteryRuins_Canyon_Entry;
    default AdditionalAreaTags.AddTag(GameplayTag::Area_MonasteryRuins_Canyon_Tunnel);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_MonasteryRuins_Canyon_Cave);
}

UCLASS()
class UTerritoryConfigs_AMR_AlchemyRoom : UTerritoryConfig
{
    default AssociatedAreaTag = GameplayTag::Area_MonasteryRuins_AlchemyRoom_Laboratory;
    default AdditionalAreaTags.AddTag(GameplayTag::Area_MonasteryRuins_AlchemyRoom_Entrance);
}

UCLASS()
class UTerritoryConfigs_AMR_Terrace : UTerritoryConfig
{
    default AssociatedAreaTag = GameplayTag::Area_MonasteryRuins_Terrace_EastSide;
    default AdditionalAreaTags.AddTag(GameplayTag::Area_MonasteryRuins_Cloister_UpperLevel);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_MonasteryRuins_Tunnels_01);
}

UCLASS()
class UTerritoryConfigs_AMR_Tower : UTerritoryConfig
{
    default AssociatedAreaTag = GameplayTag::Area_MonasteryRuins_Tower;
    default AdditionalAreaTags.AddTag(GameplayTag::Area_MonasteryRuins_Terrace_WestSide);
}

UCLASS()
class UTerritoryConfigs_AMR_Tunnels : UTerritoryConfig
{
    default AssociatedAreaTag = GameplayTag::Area_MonasteryRuins_Tunnels_02;
    default AdditionalAreaTags.AddTag(GameplayTag::Area_MonasteryRuins_Tunnels_01);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_MonasteryRuins_Tunnels_03);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_MonasteryRuins_Tunnels_02B);
}

UCLASS()
class UTerritoryConfigs_AMR_TunnelEnd : UTerritoryConfig
{
    default AssociatedAreaTag = GameplayTag::Area_MonasteryRuins_Tunnels_04;
    default AdditionalAreaTags.AddTag(GameplayTag::Area_MonasteryRuins_Tunnels_03);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_MonasteryRuins_Tunnels_05);
}

UCLASS()
class UTerritoryConfigs_AMR_ShadowbeastCavernArena : UTerritoryConfig
{
    default AssociatedAreaTag = GameplayTag::Area_MonasteryRuins_ShadowbeastArena_02;
    default AdditionalAreaTags.AddTag(GameplayTag::Area_MonasteryRuins_ShadowbeastArena_01);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_MonasteryRuins_Focus);
}