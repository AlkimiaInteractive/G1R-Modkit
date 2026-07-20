UCLASS()
class UAIAgentConfig_Human_BC_BAN_Bandit_15 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_BC_BAN_Bandit_15::StaticClass();

}



UCLASS()
class UDailyRoutine_BC_BAN_Bandit_15_Start : UAIState_DailyRoutine_Human
{
    default KnownPlaces.Add(Location::Bed, n"IO_BC_BED_BANDIT_15");
    default KnownPlaces.Add(Location::Home, n"IO_BC_BED_BANDIT_15");


    default Schedule(8, 0, UAIState_Eat(), n"IO_BC_CHAIR_09",750);
    default Schedule(9, 0, UAIState_CarryBoxes(n"FP_BC_TakeBox_01", n"FP_BC_LeaveBox_01"), NAME_None);
    default Schedule(12, 0, UAIState_Eat(), n"IO_BC_CHAIR_BENCH_04",750);
    default Schedule(13, 0, UAIState_CarryBoxes(n"FP_BC_TakeBox_01", n"FP_BC_LeaveBox_01"), NAME_None);
    default Schedule(19, 0, UAIState_Campfire(), n"FP_BC_Campfire_02",750);
    default Schedule(23, 25, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);

    default ScheduleIfRaining(8, 0, UAIState_RainShelter(), n"FP_BC_RAINSHELTER_18",450);
    default ScheduleIfRaining(23, 25, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);

}