UCLASS()
class UAIAgentConfig_Human_BC_BAN_Bandit_11 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_BC_BAN_Bandit_11::StaticClass();

}



UCLASS()
class UDailyRoutine_BC_BAN_Bandit_11_Start : UAIState_DailyRoutine_Human
{
    default KnownPlaces.Add(Location::Bed, n"IO_BC_BED_BANDIT_11");
    default KnownPlaces.Add(Location::Home, n"IO_BC_BED_BANDIT_11");

    default Schedule(0, 0, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
    default Schedule(8, 20, UAIState_Eat(), n"FP_BC_Campfire_01",750);
    default Schedule(10, 0, UAIState_Smalltalk(), n"FP_BC_SMALLTALK_01",750);
    default Schedule(14, 0, UAIState_Eat(), n"FP_BC_Campfire_01",750);
    default Schedule(15, 0, UAIState_Smalltalk(), n"FP_BC_SMALLTALK_01",750);
    default Schedule(22, 0, UAIState_Eat(), n"FP_BC_Campfire_01",750);

    default ScheduleIfRaining(0, 0, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
    default ScheduleIfRaining(8, 20, UAIState_RainShelter(), n"FP_BC_RAINSHELTER_14",450);
    default ScheduleIfRaining(10, 0, UAIState_Smalltalk(), n"FP_BC_SMALLTALK_14",450);
    default ScheduleIfRaining(14, 0, UAIState_RainShelter(), n"FP_BC_RAINSHELTER_14",450);
    default ScheduleIfRaining(15, 0, UAIState_Smalltalk(), n"FP_BC_SMALLTALK_14",450);
    default ScheduleIfRaining(22, 0, UAIState_RainShelter(), n"FP_BC_RAINSHELTER_14",450);
}