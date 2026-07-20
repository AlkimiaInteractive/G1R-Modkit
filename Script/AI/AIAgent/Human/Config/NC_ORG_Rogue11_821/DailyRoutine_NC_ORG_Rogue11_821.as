UCLASS()
class UAIAgentConfig_Human_NC_ORG_Rogue11_821 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_NC_ORG_Rogue11_821::StaticClass();

}



UCLASS()
class UDailyRoutine_NC_ORG_Rogue11_821_Start : UAIState_DailyRoutine_Human
{
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_NewCamp_Cave_Village_Huts_18);
    default KnownPlaces.Add(Location::Bed, n"IO_NC_BED_ROGUE821_CM");
    default KnownPlaces.Add(Location::Home, n"IO_NC_BED_ROGUE821_CM");

    default Schedule(0, 5, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
    default Schedule(8, 30, UAIState_Eat(), n"FP_NC_SMALLTALK_10");
    default Schedule(9, 0, UAIState_Smalltalk(), n"FP_NC_SMALLTALK_10");
    default Schedule(12, 56, UAIState_Eat(), n"FP_NC_SMALLTALK_10");
    default Schedule(13, 56, UAIState_Smalltalk(), n"FP_NC_SMALLTALK_10");
    default Schedule(22, 0, UAIState_Eat(), n"FP_NC_SMALLTALK_10");
    default Schedule(22, 30, UAIState_Smalltalk(), n"FP_NC_SMALLTALK_10");

    default ScheduleDuringEvent(UAIWorldEvent_Explicit_Rogue31PlayLute::StaticClass(), 0, 0, UAIState_WE_LuteEvent(), n"FP_NC_PLAYLUTE");
}