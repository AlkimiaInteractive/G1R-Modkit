UCLASS()
class UAIAgentConfig_Human_NC_ORG_Rogue14_824 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_NC_ORG_Rogue14_824::StaticClass();

}



UCLASS()
class UDailyRoutine_NC_ORG_Rogue14_824_Start : UAIState_DailyRoutine_Human
{
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_NewCamp_Cave_Village_Huts_20);
    default KnownPlaces.Add(Location::Bed, n"IO_NC_BED_ROGUE824");
    default KnownPlaces.Add(Location::Home, n"IO_NC_BED_ROGUE824");
    
    default Schedule(0, 5, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
    default Schedule(8, 30, UAIState_Eat(), n"FP_NC_SMALLTALK_11");
    default Schedule(9, 0, UAIState_Smalltalk(), n"FP_NC_SMALLTALK_11");
    default Schedule(12, 56, UAIState_Smoke(), n"FP_NC_SMOKE_01",200);
    default Schedule(13, 24, UAIState_Eat(), n"FP_NC_SMALLTALK_11");
    default Schedule(14, 1, UAIState_Smalltalk(), n"FP_NC_SMALLTALK_11");
    default Schedule(22, 0, UAIState_Drink(), n"IO_NC_CHAIR_08",400);
    default Schedule(22, 30, UAIState_Smalltalk(), n"FP_NC_SMALLTALK_11");

    default ScheduleIfRaining(0, 5, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
    default ScheduleIfRaining(8, 30, UAIState_Eat(), n"FP_NC_SMALLTALK_11");
    default ScheduleIfRaining(9, 0, UAIState_Smalltalk(), n"FP_NC_SMALLTALK_11");
    default ScheduleIfRaining(12, 56, UAIState_Smoke(), n"FP_NC_SMOKE_05",200);
    default ScheduleIfRaining(13, 24, UAIState_Eat(), n"FP_NC_SMALLTALK_11");
    default ScheduleIfRaining(14, 1, UAIState_Smalltalk(), n"FP_NC_SMALLTALK_11");
    default ScheduleIfRaining(22, 0, UAIState_Drink(), n"IO_NC_CHAIR_08",400);
    default ScheduleIfRaining(22, 30, UAIState_Smalltalk(), n"FP_NC_SMALLTALK_11");

    default ScheduleDuringEvent(UAIWorldEvent_Explicit_Rogue31PlayLute::StaticClass(), 0, 0, UAIState_WE_LuteEvent(), n"FP_NC_PLAYLUTE");

}