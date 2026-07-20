UCLASS()
class UAIAgentConfig_Human_BC_BAN_Bandit_05 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_BC_BAN_Bandit_05::StaticClass();

}



UCLASS()
class UDailyRoutine_BC_BAN_Bandit_05_Start : UAIState_DailyRoutine_Human
{
    default KnownPlaces.Add(Location::Bed, n"IO_BC_BED_BANDIT_05");
    default KnownPlaces.Add(Location::Home, n"IO_BC_BED_BANDIT_05");

    default Schedule(8, 30, UAIState_Eat(), n"IO_BC_CHAIR_04",450);
    default Schedule(9, 35, UAIState_CarryFoodBags(n"FP_BC_TakeFoodBag_01", n"FP_BC_LeaveFoodBag_01"), NAME_None);
    default Schedule(14, 0, UAIState_Eat(), n"IO_BC_CHAIR_BENCH_02",550);
    default Schedule(15, 0, UAIState_Smalltalk(), n"FP_BC_SMALLTALK_03");
    default Schedule(19, 0, UAIState_SitCampfire(), n"IO_BC_CHAIR_04",450);
    default Schedule(22, 45, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);

    default ScheduleIfRaining(8, 30, UAIState_RainShelter(), n"FP_BC_RAINSHELTER_07",450);
    default ScheduleIfRaining(9, 35, UAIState_RainShelter(), n"FP_BC_SMALLTALK_09", 300);
    default ScheduleIfRaining(15, 0, UAIState_Smalltalk(), n"FP_BC_SMALLTALK_09", 300);
    default ScheduleIfRaining(19, 0, UAIState_RainShelter(), n"FP_BC_RAINSHELTER_07",450);
    default ScheduleIfRaining(22, 45, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);

}