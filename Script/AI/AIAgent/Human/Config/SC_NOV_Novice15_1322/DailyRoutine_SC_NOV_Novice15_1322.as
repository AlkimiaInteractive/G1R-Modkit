UCLASS()
class UAIAgentConfig_Human_SC_NOV_Novice15_1322 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_SC_NOV_Novice15_1322::StaticClass();

}

UCLASS()
class UDailyRoutine_SC_NOV_Novice15_1322_Ownership : UAIState_DailyRoutine_Human
{
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_SwampCamp_Village_Huts_09);
    default KnownPlaces.Add(Location::Bed, n"IO_SC_BED_NOVICE15");
    default KnownPlaces.Add(Location::Home, n"IO_SC_BED_NOVICE15");
}

UCLASS()
class UDailyRoutine_SC_NOV_Novice15_1322_Start : UDailyRoutine_SC_NOV_Novice15_1322_Ownership
{
    default Schedule(7, 30, UAIState_Eat(), n"IO_SC_CHAIR_15", 200);
    default Schedule(8, 0, UAIState_SitAround(), n"IO_SC_BENCH_26", 1500);
    default Schedule(12, 56, UAIState_Eat(), n"IO_SC_BENCH_26", 1500);
    default Schedule(13, 56, UAIState_SitAround(), n"IO_SC_BENCH_26", 1500);
    default Schedule(21, 30, UAIState_Eat(), n"IO_SC_BENCH_26", 1500);
    default Schedule(22, 30, UAIState_SitAround(), n"IO_SC_BENCH_26", 1500);
    default Schedule(23, 0, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);

}

UCLASS()
class UDailyRoutine_SC_NOV_Novice15_1322_Ritual : UDailyRoutine_SC_NOV_Novice15_1322_Ownership
{
    default Schedule(8, 00, UAIState_StandAround(), n"FP_SC_PROPHECY_19");
    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}

UCLASS()
class UDailyRoutine_SC_NOV_Novice15_1322_AfterRitual : UDailyRoutine_SC_NOV_Novice15_1322_Ownership
{
    default Schedule(8, 00, UAIState_Shout(), n"FP_SC_PROPHECY_END_4");
    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}