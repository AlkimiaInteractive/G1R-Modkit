UCLASS()
class UTerritoryConfig_OT_ShamanCaves : UTerritoryConfig
{
    default AssociatedAreaTag = GameplayTag::Area_OrcTown_ShamansCaves_1;
    default AdditionalAreaTags.AddTag(GameplayTag::Area_OrcTown_ShamansCaves_2);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_OrcTown_ShamansCaves_3);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_OrcTown_ShamansCaves_4);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_OrcTown_ShamansCaves_5);
}

UCLASS()
class UTerritoryConfig_OT_Enclave_Limited : UTerritoryConfig
{
    default AssociatedAreaTag = GameplayTag::Area_OrcEnclave;
    default AdditionalAreaTags.AddTag(GameplayTag::Area_OrcEnclave_Gate);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_OrcTerritory_BridgeToOrcEnclave);
}

// UCLASS()
// class UTerritoryConfig_OT_Enclave_Extended : UTerritoryConfig
// {
//     default AssociatedAreaTag = GameplayTag::Area_OrcEnclave;
//     default AdditionalAreaTags.AddTag(GameplayTag::Area_OrcEnclave_Gate);
//     default AdditionalAreaTags.AddTag(GameplayTag::Area_OrcTown_SleepersSquare);
//     default AdditionalAreaTags.AddTag(GameplayTag::Area_OrcTerritory_BridgeToOrcEnclave);
//     // restrict accesss by guild?
// }

// Guards go into OA temple

UCLASS()
class UTerritoryConfig_OT_SleeperSquare : UTerritoryConfig
{
    default AssociatedAreaTag = GameplayTag::Area_OrcTown_SleepersSquare;
    default AdditionalAreaTags.AddTag(GameplayTag::Area_OrcEnclave);

    default AdditionalAreaTags.AddTag(GameplayTag::Area_OrcTown_ShamansCaves_1);
    default AdditionalAreaTags.AddTag(GameplayTag::Area_OrcTown_ShamansCaves_2);
}