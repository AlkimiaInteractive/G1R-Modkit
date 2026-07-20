UCLASS()
class UAIAgentConfig_Human_BC_BAN_Bandit_14 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_BC_BAN_Bandit_14::StaticClass();

}



UCLASS()
class UDailyRoutine_BC_BAN_Bandit_14_Start : UAIState_DailyRoutine_Human
{
    default KnownPlaces.Add(Location::Bed, n"IO_BC_BED_BANDIT_14");
    default KnownPlaces.Add(Location::Home, n"IO_BC_BED_BANDIT_14");

    default Schedule(8, 20, UAIState_Eat(), n"IO_BC_CHAIR_11",750);
    default Schedule(10, 0, UAIState_StandAround(), n"FP_BC_STANDAROUND_02",3000);
    default Schedule(12, 0, UAIState_Eat(), n"IO_BC_CHAIR_11",750);
    default Schedule(13, 0, UAIState_StandAround(), n"FP_BC_STANDAROUND_02",3000);
    default Schedule(20, 0, UAIState_Eat(), n"IO_BC_CHAIR_11",750);
    default Schedule(23, 30, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);

    default ScheduleIfRaining(8, 20, UAIState_RainShelter(), n"FP_BC_RAINSHELTER_17",450);
    default ScheduleIfRaining(23, 30, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);

}