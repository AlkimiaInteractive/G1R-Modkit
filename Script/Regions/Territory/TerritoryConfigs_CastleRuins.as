UCLASS()
class UTerritoryConfig_CR_InitialAscent : UTerritoryConfig
{
    default AssociatedAreaTag = GameplayTag::Area_CastleRuins_InitialAscent;
    default AdditionalAreaTags.AddTag(GameplayTag::Area_OrcTerritory_StoneGolemPath);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_CastleRuins_Terrace);
}

UCLASS()
class UTerritoryConfig_CR_Terrace : UTerritoryConfig
{
    default AssociatedAreaTag = GameplayTag::Area_CastleRuins_Terrace;
    default AdditionalAreaTags.AddTag(GameplayTag::Area_CastleRuins_InitialAscent);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_CastleRuins_FinalAscent);
}

UCLASS()
class UTerritoryConfig_CR_FinalAscent : UTerritoryConfig
{
    default AssociatedAreaTag = GameplayTag::Area_CastleRuins_FinalAscent;
    default AdditionalAreaTags.AddTag(GameplayTag::Area_CastleRuins_Terrace);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_CastleRuins_OuterGate);
}

UCLASS()
class UTerritoryConfig_CR_OuterGate : UTerritoryConfig
{
    default AssociatedAreaTag = GameplayTag::Area_CastleRuins_OuterGate;
    default AdditionalAreaTags.AddTag(GameplayTag::Area_CastleRuins_FinalAscent);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_CastleRuins_OuterCourtyard_Walkway);
}

UCLASS()
class UTerritoryConfig_CR_OuterCourtyardWalkway : UTerritoryConfig
{
    default AssociatedAreaTag = GameplayTag::Area_CastleRuins_OuterCourtyard_Walkway;
    default AdditionalAreaTags.AddTag(GameplayTag::Area_CastleRuins_OuterGate);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_CastleRuins_OuterCourtyard);
}

UCLASS()
class UTerritoryConfig_CR_OuterCourtyard : UTerritoryConfig
{
    default AssociatedAreaTag = GameplayTag::Area_CastleRuins_OuterCourtyard;
    default AdditionalAreaTags.AddTag(GameplayTag::Area_CastleRuins_OuterCourtyard_Walkway);
}

UCLASS()
class UTerritoryConfig_CR_Keep : UTerritoryConfig
{
    default AssociatedAreaTag = GameplayTag::Area_CastleRuins_Keep;
    default AdditionalAreaTags.AddTag(GameplayTag::Area_CastleRuins_NarrowOutcrop);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_CastleRuins_TowerPlateau);

    default ExcludedAreaTags.AddTag(GameplayTag::Area_CastleRuins_GolemRoom);
}

UCLASS()
class UTerritoryConfig_CR_Golem : UTerritoryConfig
{
    default AssociatedAreaTag = GameplayTag::Area_CastleRuins_GolemRoom;
}