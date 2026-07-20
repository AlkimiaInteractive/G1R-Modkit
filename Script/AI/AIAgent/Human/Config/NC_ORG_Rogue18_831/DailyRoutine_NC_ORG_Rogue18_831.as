UCLASS()
class UAIAgentConfig_Human_NC_ORG_Rogue18_831 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_NC_ORG_Rogue18_831::StaticClass();

}



UCLASS()
class UDailyRoutine_NC_ORG_Rogue18_831_Start : UAIState_DailyRoutine_Human
{
    default KnownPlaces.Add(Location::Bed, n"IO_NC_BED_ROGUE831");
    default KnownPlaces.Add(Location::Home, n"IO_NC_BED_ROGUE831");

    default Schedule(2, 5, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
    default Schedule(8, 30, UAIState_Eat(), n"IO_NC_CHAIR_BENCH_27");
    default Schedule(9, 5, UAIState_CutWood_Trunk(), n"NC_IO_CUTTRUNK");
    default Schedule(19, 30, UAIState_Cook(), n"IO_NC_CAMPFIRE_PAN_07");
    default Schedule(21, 30, UAIState_Eat(), n"IO_NC_CHAIR_BENCH_27");
        default Schedule(22, 30, UAIState_CutWood_Trunk(), n"NC_IO_CUTTRUNK");


    default ScheduleIfRaining(2, 5, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
    default ScheduleIfRaining(8, 30, UAIState_Eat(), n"IO_NC_CHAIR_32");
    default ScheduleIfRaining(9, 5, UAIState_Smalltalk(), n"FP_NC_SMALLTALK_09");
    default ScheduleIfRaining(21, 30, UAIState_Eat(), n"IO_NC_CHAIR_32");
    default ScheduleIfRaining(22, 30, UAIState_Smalltalk(), n"FP_NC_SMALLTALK_09");
}