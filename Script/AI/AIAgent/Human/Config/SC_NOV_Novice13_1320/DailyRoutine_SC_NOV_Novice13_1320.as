UCLASS()
class UAIAgentConfig_Human_SC_NOV_Novice13_1320 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_SC_NOV_Novice13_1320::StaticClass();

}

UCLASS()
class UDailyRoutine_SC_NOV_Novice13_1320_Ownership : UAIState_DailyRoutine_Human
{
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_SwampCamp_Village_Huts_33);
    default KnownPlaces.Add(Location::Bed, n"IO_SC_BED_NOVICE13");
    default KnownPlaces.Add(Location::Home, n"IO_SC_BED_NOVICE13");
}

UCLASS()
class UDailyRoutine_SC_NOV_Novice13_1320_Start : UDailyRoutine_SC_NOV_Novice13_1320_Ownership
{
    default Schedule(7, 25, UAIState_Eat(), n"IO_SC_BENCH_23");
    default Schedule(8, 0, UAIState_Smalltalk(), n"FP_SC_SMALLTALK_01");
    default Schedule(12, 56, UAIState_Eat(), n"IO_SC_BENCH_23");
    default Schedule(13, 56, UAIState_Smalltalk(), n"FP_SC_SMALLTALK_01");
    default Schedule(21, 30, UAIState_Eat(), n"IO_SC_BENCH_23");
    default Schedule(22, 30, UAIState_Smalltalk(), n"FP_SC_SMALLTALK_01");
    default Schedule(23, 0, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);

    default ScheduleIfRaining(7, 25, UAIState_Eat(), n"IO_SC_BENCH_23");
    default ScheduleIfRaining(8, 0, UAIState_Smalltalk(), n"FP_SC_SMALLTALK_05");
    default ScheduleIfRaining(12, 56, UAIState_Eat(), n"IO_SC_BENCH_23");
    default ScheduleIfRaining(13, 56, UAIState_Smalltalk(), n"FP_SC_SMALLTALK_05");
    default ScheduleIfRaining(21, 30, UAIState_Eat(), n"IO_SC_BENCH_23");
    default ScheduleIfRaining(22, 30, UAIState_Smalltalk(), n"FP_SC_SMALLTALK_05");
    default ScheduleIfRaining(23, 0, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
}

UCLASS()
class UDailyRoutine_SC_NOV_Novice13_1320_Ritual : UDailyRoutine_SC_NOV_Novice13_1320_Ownership
{
    default Schedule(8, 0, UAIState_Stay(), n"FP_SC_MEDITATE_24");
}

UCLASS()
class UDailyRoutine_SC_NOV_Novice13_1320_CampDivided : UAIState_DailyRoutine_Human
{
    default Schedule(10, 0, UAIState_Listen(), n"FP_OG_LISTEN_02");

    default ScheduleIfRaining(8, 30, UAIState_Smoke(), n"FP_OG_RAINSHELTER_06");
    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}
