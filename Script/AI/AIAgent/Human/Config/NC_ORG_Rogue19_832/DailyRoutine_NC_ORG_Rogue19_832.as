UCLASS()
class UAIAgentConfig_Human_NC_ORG_Rogue19_832 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_NC_ORG_Rogue19_832::StaticClass();

}



UCLASS()
class UDailyRoutine_NC_ORG_Rogue19_832_Start : UAIState_DailyRoutine_Human
{
    default KnownPlaces.Add(Location::Bed, n"IO_NC_BED_ROGUE832");
    default KnownPlaces.Add(Location::Home, n"IO_NC_BED_ROGUE832");
    
    default Schedule(2, 6, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
    default Schedule(8, 31, UAIState_Eat(), n"IO_NC_CHAIR_BENCH_26");
    //default Schedule(9, 4, UAIState_Smalltalk(), n"FP_NC_SMALLTALK_32");
    default Schedule(19, 30, UAIState_SitAround(), n"IO_NC_CHAIR_BENCH_26");
    default Schedule(21, 32, UAIState_Eat(), n"IO_NC_CHAIR_BENCH_26");
    //default Schedule(22, 29, UAIState_Smalltalk(), n"FP_NC_SMALLTALK_32");

    default ScheduleIfRaining(2, 6, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
    default ScheduleIfRaining(8, 31, UAIState_Eat(), n"IO_NC_CHAIR_BENCH_38", 500);
    default ScheduleIfRaining(9, 4, UAIState_Smalltalk(), n"FP_NC_SMALLTALK_04");
    default ScheduleIfRaining(19, 30, UAIState_Eat(), n"IO_NC_CHAIR_BENCH_38", 500);
    default ScheduleIfRaining(22, 29, UAIState_Smalltalk(), n"FP_NC_SMALLTALK_04");
}