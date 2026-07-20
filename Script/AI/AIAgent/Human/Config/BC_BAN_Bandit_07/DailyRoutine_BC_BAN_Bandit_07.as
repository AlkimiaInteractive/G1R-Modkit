UCLASS()
class UAIAgentConfig_Human_BC_BAN_Bandit_07 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_BC_BAN_Bandit_07::StaticClass();

}



UCLASS()
class UDailyRoutine_BC_BAN_Bandit_07_Start : UAIState_DailyRoutine_Human
{
    default KnownPlaces.Add(Location::Bed, n"IO_BC_BED_BANDIT_07");
    default KnownPlaces.Add(Location::Home, n"IO_BC_BED_BANDIT_07");

    default Schedule(8, 25, UAIState_Eat(), n"IO_BC_CHAIR_06",450);
    default Schedule(9, 40, UAIState_CarryFoodBags(n"FP_BC_TakeFoodBag_02", n"FP_BC_LeaveFoodBag_03"), NAME_None);
    default Schedule(14,15, UAIState_Eat(), n"IO_BC_CHAIR_03",600);
    default Schedule(15, 0, UAIState_Smalltalk(), n"FP_BC_SMALLTALK_04");
    default Schedule(19, 0, UAIState_SitCampfire(), n"IO_BC_CHAIR_05",750);
    default Schedule(22, 45, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);

    default ScheduleIfRaining(8, 25, UAIState_RainShelter(), n"FP_BC_RAINSHELTER_10",450);
    default ScheduleIfRaining(15, 0, UAIState_Smalltalk(), n"FP_BC_SMALLTALK_10");
    default ScheduleIfRaining(19, 0, UAIState_RainShelter(), n"FP_BC_RAINSHELTER_10",450);
    default ScheduleIfRaining(22, 45, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
}