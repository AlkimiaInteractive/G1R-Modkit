UCLASS()
class UAIAgentConfig_Human_BC_BAN_Bandit_03 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_BC_BAN_Bandit_03::StaticClass();

}



UCLASS()
class UDailyRoutine_BC_BAN_Bandit_03_Start : UAIState_DailyRoutine_Human
{
    default KnownPlaces.Add(Location::Bed, n"IO_BC_BED_BANDIT_03_CM");
    default KnownPlaces.Add(Location::Home, n"IO_BC_BED_BANDIT_03_CM");

    default Schedule(8, 0, UAIState_Eat(), n"IO_BC_CHAIR_BENCH_01",550);
    default Schedule(9, 30, UAIState_PracticeBow(), n"FP_BC_PracticeBow_01");
    default Schedule(13, 0, UAIState_Eat(), n"IO_BC_CHAIR_13",750);
    default Schedule(14, 30, UAIState_PracticeBow(), n"FP_BC_PracticeBow_01");
    default Schedule(18, 0, UAIState_SitCampfire(), n"IO_BC_CHAIR_BENCH_01",550);
    default Schedule(23, 0, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);

    default ScheduleIfRaining(8, 0, UAIState_RainShelter(), n"FP_BC_RAINSHELTER_03", 300);
    default ScheduleIfRaining(9, 30, UAIState_RainShelter(), n"FP_BC_RAINSHELTER_04", 300);
    default ScheduleIfRaining(18, 0, UAIState_RainShelter(), n"FP_BC_RAINSHELTER_03", 300);
    default ScheduleIfRaining(23, 0, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
}