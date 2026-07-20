UCLASS()
class UAIAgentConfig_Human_NC_ORG_Silas_841 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_NC_ORG_Silas_841::StaticClass();
}


UCLASS()
class UDailyRoutine_NC_ORG_Silas_841_Start : UAIState_DailyRoutine_Human
{
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_NewCamp_Exterior_Tavern);
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_NewCamp_Exterior_Tavern_Kitchen);
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_NewCamp_Exterior_Tavern_Room_Silas);
    default KnownPlaces.Add(Location::Bed, n"IO_NC_BED_SILAS");
    default KnownPlaces.Add(Location::Home, n"IO_NC_BED_SILAS");

    default Schedule(0, 0, UAIState_LeanBar(), n"FP_OC_STANDAROUND_89_SILAS",170);
    default Schedule(2, 0, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
    default Schedule(6, 0, UAIState_Eat(), n"FP_OC_STANDAROUND_89_SILAS",170);
    default Schedule(8, 30, UAIState_LeanBar(), n"FP_OC_STANDAROUND_89_SILAS",170);
    default Schedule(23, 0, UAIState_Eat(), n"FP_OC_STANDAROUND_89_SILAS",170);


    default OwnedGameplayTags.AddTag(GameplayTag::Character_AllowFarInteractions);
}
