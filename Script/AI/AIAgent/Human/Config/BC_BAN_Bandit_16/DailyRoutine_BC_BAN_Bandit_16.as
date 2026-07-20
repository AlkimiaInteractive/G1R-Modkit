UCLASS()
class UAIAgentConfig_Human_BC_BAN_Bandit_16 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_BC_BAN_Bandit_16::StaticClass();

}



UCLASS()
class UDailyRoutine_BC_BAN_Bandit_16_Start : UAIState_DailyRoutine_Human
{
    default KnownPlaces.Add(Location::Bed, n"IO_BC_BED_BANDIT_16");
    default KnownPlaces.Add(Location::Home, n"IO_BC_BED_BANDIT_16");

    default Schedule(8, 0, UAIState_Eat(), n"IO_BC_CHAIR_BENCH_08",750);
    default Schedule(9, 0, UAIState_CarryBoxes(n"FP_BC_TakeBox_02", n"FP_BC_LeaveBox_02"), NAME_None);
    default Schedule(12, 0, UAIState_Drink(), n"IO_BC_CHAIR_BENCH_08",750);
    default Schedule(13, 0, UAIState_CarryBoxes(n"FP_BC_TakeBox_02", n"FP_BC_LeaveBox_02"), NAME_None);
    default Schedule(19, 0, UAIState_SitCampfire(), n"IO_BC_CHAIR_BENCH_08",750);
    default Schedule(23, 25, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);

    default ScheduleIfRaining(8, 0, UAIState_RainShelter(), n"FP_BC_RAINSHELTER_19",450);
    default ScheduleIfRaining(23, 25, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);

}