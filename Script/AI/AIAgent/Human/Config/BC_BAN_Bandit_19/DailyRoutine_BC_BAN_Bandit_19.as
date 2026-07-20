UCLASS()
class UAIAgentConfig_Human_BC_BAN_Bandit_19 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_BC_BAN_Bandit_19::StaticClass();

}



UCLASS()
class UDailyRoutine_BC_BAN_Bandit_19_Start : UAIState_DailyRoutine_Human
{
    default KnownPlaces.Add(Location::Bed, n"IO_BC_BED_BANDIT_19_CM");
    default KnownPlaces.Add(Location::Home, n"IO_BC_BED_BANDIT_19_CM");

    default Schedule(8, 0, UAIState_Eat(), n"IO_BC_CHAIR_BENCH_07",750);
    default Schedule(9, 0, UAIState_CarryBoxes(n"FP_BC_TakeBox_04", n"FP_BC_LeaveBox_04"), NAME_None);
    default Schedule(12, 0, UAIState_Eat(), n"IO_BC_CHAIR_BENCH_07",750);
    default Schedule(13, 0, UAIState_CarryBoxesMidHigh(n"FP_BC_TakeBox_05", n"FP_BC_LeaveBox_04"), NAME_None);
    default Schedule(19, 0, UAIState_SitCampfire(), n"IO_BC_CHAIR_BENCH_07",750);
    default Schedule(23, 25, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);

    default ScheduleIfRaining(8, 0, UAIState_RainShelter(), n"FP_BC_RAINSHELTER_22",450);
    default ScheduleIfRaining(23, 25, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
}