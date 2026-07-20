UCLASS()
class UAIAgentConfig_Human_BC_BAN_Bandit_06 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_BC_BAN_Bandit_06::StaticClass();

}



UCLASS()
class UDailyRoutine_BC_BAN_Bandit_06_Start : UAIState_DailyRoutine_Human
{
    default KnownPlaces.Add(Location::Bed, n"IO_BC_BED_BANDIT_06");
    default KnownPlaces.Add(Location::Home, n"IO_BC_BED_BANDIT_06");

    default Schedule(8, 15, UAIState_Eat(), n"IO_BC_CHAIR_05",450);
    default Schedule(9, 15, UAIState_CarryFoodBags(n"FP_BC_TakeFoodBag_01", n"FP_BC_LeaveFoodBag_02"), NAME_None);
    default Schedule(14, 15, UAIState_Eat(), n"IO_BC_CHAIR_01",600);
    default Schedule(15, 15, UAIState_CarryFoodBags(n"FP_BC_TakeFoodBag_01", n"FP_BC_LeaveFoodBag_02"), NAME_None);
    default Schedule(20, 15, UAIState_Smoke(), n"IO_BC_CHAIR_14",750);
    default Schedule(22, 15, UAIState_Sleep(),Location::Bed, WaypointRadius = 500);

    default ScheduleIfRaining(8, 15, UAIState_RainShelter(), n"FP_BC_RAINSHELTER_08",450);
    default ScheduleIfRaining(20, 15, UAIState_RainShelter(), n"FP_BC_RAINSHELTER_09",450);
    default ScheduleIfRaining(22, 15, UAIState_Sleep(),Location::Bed, WaypointRadius = 500);
}