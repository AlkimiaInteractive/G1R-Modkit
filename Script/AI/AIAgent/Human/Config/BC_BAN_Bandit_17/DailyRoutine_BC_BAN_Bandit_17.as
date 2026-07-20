UCLASS()
class UAIAgentConfig_Human_BC_BAN_Bandit_17 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_BC_BAN_Bandit_17::StaticClass();

}



UCLASS()
class UDailyRoutine_BC_BAN_Bandit_17_Start : UAIState_DailyRoutine_Human
{
    default KnownPlaces.Add(Location::Bed, n"IO_BC_BED_BANDIT_17");
    default KnownPlaces.Add(Location::Home, n"IO_BC_BED_BANDIT_17");

    default Schedule(8, 0, UAIState_Eat(), n"IO_BC_CHAIR_BENCH_09",750);
    default Schedule(9, 0, UAIState_CarryBoxesMidHigh(n"FP_BC_TakeBox_03", n"FP_BC_LeaveBox_03"), NAME_None);
    default Schedule(12, 0, UAIState_Eat(), n"IO_BC_CHAIR_BENCH_09",750);
    default Schedule(13, 0, UAIState_CarryBoxesMidHigh(n"FP_BC_TakeBox_03", n"FP_BC_LeaveBox_03"), NAME_None);
    default Schedule(19, 0, UAIState_SitCampfire(), n"IO_BC_CHAIR_BENCH_09",750);
    default Schedule(23, 25, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);

    default ScheduleIfRaining(8, 0, UAIState_RainShelter(), n"FP_BC_RAINSHELTER_20",450);
    default ScheduleIfRaining(23, 25, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);

}