UCLASS()
class UAIAgentConfig_Human_SC_NOV_Novice21_1328 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_SC_NOV_Novice21_1328::StaticClass();

}



UCLASS()
class UDailyRoutine_SC_NOV_Novice21_1328_Start : UAIState_DailyRoutine_Human
{
    default KnownPlaces.Add(Location::Bed, n"IO_SC_BED_NOVICE21");
    default KnownPlaces.Add(Location::Home, n"IO_SC_BED_NOVICE21");

    default Schedule(0, 0, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
    default Schedule(6, 0, UAIState_Eat(), n"IO_SC_BENCH_12");
    default Schedule(7, 0, UAIState_PickRice(), n"FP_SC_PICKRICE_01");
    default Schedule(12, 56, UAIState_Rest(), n"FP_SC_PICKRICE_04");
    default Schedule(13, 56, UAIState_PickRice(), n"FP_SC_PICKRICE_01");
    default Schedule(21, 30, UAIState_SitAround(), n"IO_SC_BENCH_36");
}