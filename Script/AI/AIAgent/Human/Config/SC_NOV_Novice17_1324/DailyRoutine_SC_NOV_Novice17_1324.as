UCLASS()
class UAIAgentConfig_Human_SC_NOV_Novice17_1324 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_SC_NOV_Novice17_1324::StaticClass();

}

UCLASS()
class UDailyRoutine_SC_NOV_Novice17_1324_Ownership : UAIState_DailyRoutine_Human
{
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_SwampCamp_Village_Huts_29);
    default KnownPlaces.Add(Location::Bed, n"IO_SC_BED_NOVICE17");
    default KnownPlaces.Add(Location::Home, n"IO_SC_BED_NOVICE17");
}

UCLASS()
class UDailyRoutine_SC_NOV_Novice17_1324_Start : UDailyRoutine_SC_NOV_Novice17_1324_Ownership
{
    default Schedule(0, 0, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
    default Schedule(7, 30, UAIState_Eat(), n"IO_SC_BENCH_32", 300);
    default Schedule(8, 0, UAIState_SitAround(), n"IO_SC_BENCH_32", 300);
    default Schedule(12, 56, UAIState_Eat(), n"IO_SC_BENCH_32", 300);
    default Schedule(13, 56, UAIState_Smoke_Ground(), n"IO_SC_WATERPIPE_04",500.0f);
    default Schedule(21, 30, UAIState_Eat(), n"IO_SC_BENCH_32", 300);
    default Schedule(22, 30, UAIState_SitAround(), n"IO_SC_BENCH_32", 300);

}