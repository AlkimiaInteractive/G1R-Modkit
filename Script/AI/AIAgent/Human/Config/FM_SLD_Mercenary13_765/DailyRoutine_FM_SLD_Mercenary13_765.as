UCLASS()
class UAIAgentConfig_Human_FM_SLD_Mercenary13_765 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_FM_SLD_Mercenary13_765::StaticClass();

}



UCLASS()
class UDailyRoutine_FM_SLD_Mercenary13_765_Start : UAIState_DailyRoutine_Human
{
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_FreeMine_Exterior_Huts_05);
    default KnownPlaces.Add(Location::Bed, n"IO_FM_BED_MERCENARY765");
    default KnownPlaces.Add(Location::Home, n"IO_FM_BED_MERCENARY765");

    default Schedule(0, 0, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
    default Schedule(8, 0, UAIState_Eat(), n"IO_FM_CHAIR_BENCH_02");
    default Schedule(8, 30, UAIState_SitAround(), n"IO_FM_CHAIR_BENCH_02");
    default Schedule(23, 30, UAIState_Eat(), n"IO_FM_CHAIR_BENCH_02");

    default ScheduleIfRaining(0, 0, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
    default ScheduleIfRaining(8, 0, UAIState_Eat(), n"FP_FM_GUARD_43");
    default ScheduleIfRaining(8, 30, UAIState_GuardPatrol(), n"FP_FM_GUARD_43");
    default ScheduleIfRaining(23, 30, UAIState_Eat(), n"FP_FM_GUARD_43");
}