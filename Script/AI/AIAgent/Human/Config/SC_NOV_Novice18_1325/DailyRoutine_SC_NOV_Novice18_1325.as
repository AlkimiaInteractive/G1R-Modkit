UCLASS()
class UAIAgentConfig_Human_SC_NOV_Novice18_1325 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_SC_NOV_Novice18_1325::StaticClass();

}

UCLASS()
class UDailyRoutine_SC_NOV_Novice18_1325_Ownership : UAIState_DailyRoutine_Human
{
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_SwampCamp_Village_Huts_Darrion);
    default KnownPlaces.Add(Location::Bed, n"IO_SC_BED_NOVICE18");
    default KnownPlaces.Add(Location::Home, n"IO_SC_BED_NOVICE18");
}

UCLASS()
class UDailyRoutine_SC_NOV_Novice18_1325_Start : UDailyRoutine_SC_NOV_Novice18_1325_Ownership
{
    default Schedule(7, 30, UAIState_Eat(), n"FP_SC_EAT_04");
    default Schedule(8, 0, UAIState_SitAround(), n"IO_SC_BENCH_27", 400);
    default Schedule(12, 56, UAIState_Eat(), n"IO_SC_BENCH_27", 400);
    default Schedule(13, 56, UAIState_SitAround(), n"IO_SC_BENCH_27", 400);
    default Schedule(21, 30, UAIState_Eat(), n"IO_SC_BENCH_27", 400);
    default Schedule(22, 30, UAIState_SitAround(), n"IO_SC_BENCH_27", 400);
    default Schedule(23, 0, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);

}