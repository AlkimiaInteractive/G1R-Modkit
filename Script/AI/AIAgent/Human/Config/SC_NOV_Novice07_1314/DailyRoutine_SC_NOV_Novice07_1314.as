UCLASS()
class UAIAgentConfig_Human_SC_NOV_Novice07_1314 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_SC_NOV_Novice07_1314::StaticClass();

}

UCLASS()
class UDailyRoutine_SC_NOV_Novice07_1314_Ownership : UAIState_DailyRoutine_Human
{
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_SwampCamp_Village_Huts_33);
    default KnownPlaces.Add(Location::Bed, n"IO_SC_BED_NOVICE07");
    default KnownPlaces.Add(Location::Home, n"IO_SC_BED_NOVICE07");
}

UCLASS()
class UDailyRoutine_SC_NOV_Novice07_1314_Start : UDailyRoutine_SC_NOV_Novice07_1314_Ownership
{
    default Schedule(0, 30, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
    default Schedule(7, 30, UAIState_Eat(), n"FP_SC_EAT_01");
    default Schedule(8, 5, UAIState_Smoke(), n"FP_SC_SMOKE_02");
    default Schedule(12, 56, UAIState_Eat(), n"IO_SC_BENCH_16");
    default Schedule(13, 56, UAIState_Smoke(), n"FP_SC_SMOKE_02");
    default Schedule(21, 30, UAIState_Eat(), n"IO_SC_BENCH_16");
    default Schedule(22, 30, UAIState_Smoke(), n"FP_SC_SMOKE_02");

}

UCLASS()
class UDailyRoutine_SC_NOV_Novice07_1314_Ritual : UDailyRoutine_SC_NOV_Novice07_1314_Ownership
{
    default Schedule(8, 00, UAIState_StandAround(), n"FP_SC_PROPHECY_33");
    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}