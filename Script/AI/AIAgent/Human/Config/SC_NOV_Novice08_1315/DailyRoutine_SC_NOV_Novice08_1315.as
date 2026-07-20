UCLASS()
class UAIAgentConfig_Human_SC_NOV_Novice08_1315 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_SC_NOV_Novice08_1315::StaticClass();

}

UCLASS()
class UDailyRoutine_SC_NOV_Novice08_1315_Ownership : UAIState_DailyRoutine_Human
{
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_SwampCamp_Village_Huts_36);
    default KnownPlaces.Add(Location::Bed, n"IO_SC_BED_NOVICE08");
    default KnownPlaces.Add(Location::Home, n"IO_SC_BED_NOVICE08");
}

UCLASS()
class UDailyRoutine_SC_NOV_Novice08_1315_Start : UDailyRoutine_SC_NOV_Novice07_1314_Ownership
{
    default Schedule(7, 25, UAIState_Eat(), n"IO_SC_BENCH_14");
    default Schedule(8, 10, UAIState_Listen(), n"FP_SC_LISTEN_06");
    default Schedule(12, 56, UAIState_Eat(), n"IO_SC_BENCH_14");
    default Schedule(13, 56, UAIState_Listen(), n"FP_SC_LISTEN_06");
    default Schedule(21, 30, UAIState_Eat(), n"IO_SC_BENCH_14");
    default Schedule(22, 30, UAIState_Listen(), n"FP_SC_LISTEN_06");
    default Schedule(23, 50, UAIState_Sleep(), Location::Bed, WaypointRadius = 300);
}