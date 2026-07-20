UCLASS()
class UAIAgentConfig_Human_SC_NOV_Novice12_1319 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_SC_NOV_Novice12_1319::StaticClass();

}

UCLASS()
class UDailyRoutine_SC_NOV_Novice12_1319_Ownership : UAIState_DailyRoutine_Human
{
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_SwampCamp_Village_Huts_Joru);
    default KnownPlaces.Add(Location::Bed, n"IO_SC_BED_NOVICE12");
    default KnownPlaces.Add(Location::Home, n"IO_SC_BED_NOVICE12");
}

UCLASS()
class UDailyRoutine_SC_NOV_Novice12_1319_Start : UDailyRoutine_SC_NOV_Novice12_1319_Ownership
{
    default Schedule(7, 25, UAIState_Eat(), n"IO_SC_CHAIR_5");
    default Schedule(8, 0, UAIState_Smalltalk(), n"FP_SC_SMALLTALK_17");
    default Schedule(12, 56, UAIState_Eat(), n"IO_SC_BENCH_21");
    default Schedule(13, 56, UAIState_Smalltalk(), n"FP_SC_SMALLTALK_17");
    default Schedule(21, 30, UAIState_Eat(), n"IO_SC_BENCH_21");
    default Schedule(22, 30, UAIState_Smalltalk(), n"FP_SC_SMALLTALK_17");
    default Schedule(23, 0, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);

    default ScheduleIfRaining(7, 25, UAIState_Eat(), n"IO_SC_CHAIR_5");
    default ScheduleIfRaining(8, 0, UAIState_Smalltalk(), n"FP_SC_SMALLTALK_21");
    default ScheduleIfRaining(12, 56, UAIState_Eat(), n"IO_SC_BENCH_21");
    default ScheduleIfRaining(13, 56, UAIState_Smalltalk(), n"FP_SC_SMALLTALK_21");
    default ScheduleIfRaining(21, 30, UAIState_Eat(), n"IO_SC_BENCH_21");
    default ScheduleIfRaining(22, 30, UAIState_Smalltalk(), n"FP_SC_SMALLTALK_21");
    default ScheduleIfRaining(23, 0, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);

}

UCLASS()
class UDailyRoutine_SC_NOV_Novice12_1319_Ritual : UDailyRoutine_SC_NOV_Novice12_1319_Ownership
{
    default Schedule(8, 00, UAIState_StandAround(), n"FP_SC_PROPHECY_1");
    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}

UCLASS()
class UDailyRoutine_SC_NOV_Novice12_1319_AfterRitual : UDailyRoutine_SC_NOV_Novice12_1319_Ownership
{
    default Schedule(8, 00, UAIState_Shout(), n"FP_SC_PROPHECY_1");
    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}