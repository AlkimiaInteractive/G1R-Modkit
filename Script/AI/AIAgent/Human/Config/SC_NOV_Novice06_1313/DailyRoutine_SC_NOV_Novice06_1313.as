UCLASS()
class UAIAgentConfig_Human_SC_NOV_Novice06_1313 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_SC_NOV_Novice06_1313::StaticClass();

}

UCLASS()
class UDailyRoutine_SC_NOV_Novice06_1313_Ownership : UAIState_DailyRoutine_Human
{
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_SwampCamp_Village_Huts_35);
    default KnownPlaces.Add(Location::Bed, n"IO_SC_BED_NOVICE06_CM");
    default KnownPlaces.Add(Location::Home, n"IO_SC_BED_NOVICE06_CM");
}

UCLASS()
class UDailyRoutine_SC_NOV_Novice06_1313_Start : UDailyRoutine_SC_NOV_Novice06_1313_Ownership
{
    default Schedule(7, 25, UAIState_Eat(), n"IO_SC_BENCH_45");
    default Schedule(8, 5, UAIState_Listen(), n"FP_SC_LISTEN_05");
    default Schedule(13, 56, UAIState_Listen(), n"FP_SC_LISTEN_05");
    default Schedule(22, 30, UAIState_Listen(), n"FP_SC_LISTEN_05");
    default Schedule(23, 55, UAIState_Sleep(), Location::Bed, WaypointRadius = 300);

}