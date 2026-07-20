UCLASS()
class UAIAgentConfig_Human_SC_NOV_Balor_1304 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_SC_NOV_Balor_1304::StaticClass();

}

UCLASS()
class UDailyRoutine_SC_NOV_Balor_1304_Ownership : UAIState_DailyRoutine_Human
{
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_SwampCamp_WeedHarvesters_Huts_01);
    default KnownPlaces.Add(Location::Bed, n"IO_SC_BED_BALOR");
    default KnownPlaces.Add(Location::Home, n"IO_SC_BED_BALOR");
}

UCLASS()
class UDailyRoutine_SC_NOV_Balor_1304_Start : UDailyRoutine_SC_NOV_Balor_1304_Ownership
{
    default Schedule(0, 0, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
    default Schedule(6, 30, UAIState_Eat(), n"IO_SC_BENCH_9");
    default Schedule(7, 0, UAIState_GuardPatrol(), n"FP_SC_GUARD_24",3000.0f);
    default Schedule(21, 30, UAIState_Eat(), n"IO_SC_BENCH_9");
}

class UDailyRoutine_SC_NOV_Balor_1304_CampDivided : UAIState_DailyRoutine_Human
{
    default Schedule(10, 0, UAIState_Listen(), n"FP_OG_LISTEN_01");

    default ScheduleIfRaining(12, 0, UAIState_Smoke(), n"FP_OG_RAINSHELTER_04",500);
    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}

UCLASS()
class UDailyRoutine_SC_NOV_Balor_1304_Follow : UAIState_DailyRoutine_Human
{
    default bSimulateRoutineTasksFromStartTime = false;
    default Schedule(23, 0, UAIState_FollowHero(150), Location::Anywhere);
}

UCLASS()
class UDailyRoutine_SC_NOV_Balor_1304_Wait : UAIState_DailyRoutine_Human
{
    default Schedule(13, 30, UAIState_StandAround(), n"FP_OG_STANDAROUND_3",750);
}

UCLASS()
class UDailyRoutine_SC_NOV_Balor_1304_Escape : UAIState_DailyRoutine_Human
{
    default Schedule(8, 0, UAIState_RunToStandAround(),n"FP_OG_STANDAROUND_7");
}