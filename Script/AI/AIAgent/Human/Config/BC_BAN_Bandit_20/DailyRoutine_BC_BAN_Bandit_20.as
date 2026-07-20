UCLASS()
class UAIAgentConfig_Human_BC_BAN_Bandit_20 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_BC_BAN_Bandit_20::StaticClass();

}



UCLASS()
class UDailyRoutine_BC_BAN_Bandit_20_Start : UAIState_DailyRoutine_Human
{
    default KnownPlaces.Add(Location::Bed, n"IO_BC_BED_BANDIT_20");
    default KnownPlaces.Add(Location::Home, n"IO_BC_BED_BANDIT_20");

    default Schedule(8, 20, UAIState_Eat(), n"IO_BC_CHAIR_BENCH_05",750);
    default Schedule(10, 0, UAIState_StandAround(), n"FP_BC_STANDAROUND_11",3000);
    default Schedule(12, 0, UAIState_Leatherworking(), n"IO_BC_TANNING_01",3000);
    default Schedule(13, 0, UAIState_Eat_Seated(), n"IO_BC_CHAIR_BENCH_05",3000);
    default Schedule(15, 0, UAIState_Leatherworking(), n"IO_BC_TANNING_01",3000);
    default Schedule(20, 0, UAIState_Eat_Seated(), n"IO_BC_CHAIR_BENCH_05",750);
    default Schedule(23, 25, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);

    default ScheduleIfRaining(8, 20, UAIState_RainShelter(), n"FP_BC_RAINSHELTER_23",450);
    default ScheduleIfRaining(23, 25, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);

}