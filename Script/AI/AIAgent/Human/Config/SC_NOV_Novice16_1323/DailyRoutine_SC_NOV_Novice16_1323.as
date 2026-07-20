UCLASS()
class UAIAgentConfig_Human_SC_NOV_Novice16_1323 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_SC_NOV_Novice16_1323::StaticClass();

}

UCLASS()
class UDailyRoutine_SC_NOV_Novice16_1323_Ownership : UAIState_DailyRoutine_Human
{
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_SwampCamp_Village_Huts_28);
    default KnownPlaces.Add(Location::Bed, n"IO_SC_BED_NOVICE16");
    default KnownPlaces.Add(Location::Home, n"IO_SC_BED_NOVICE16");
}

UCLASS()
class UDailyRoutine_SC_NOV_Novice16_1323_Start : UDailyRoutine_SC_NOV_Novice16_1323_Ownership
{
    default Schedule(1, 0, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
    default Schedule(7, 30, UAIState_Eat(), n"IO_SC_BENCH_28");
    default Schedule(8, 20, UAIState_Smoke_Ground(), n"IO_SC_WATERPIPE_04");
    default Schedule(12, 56, UAIState_Eat(), n"IO_SC_BENCH_28");
    default Schedule(13, 56, UAIState_SitAround(), n"IO_SC_BENCH_28");
    default Schedule(21, 30, UAIState_Eat(), n"IO_SC_BENCH_28");
    default Schedule(22, 30, UAIState_SitAround(), n"IO_SC_BENCH_28");

}

UCLASS()
class UDailyRoutine_SC_NOV_Novice16_1323_Ritual : UDailyRoutine_SC_NOV_Novice16_1323_Ownership
{
    default Schedule(8, 00, UAIState_StandAround(), n"FP_SC_PROPHECY_20");
    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}

UCLASS()
class UDailyRoutine_SC_NOV_Novice16_1323_AfterRitual : UDailyRoutine_SC_NOV_Novice16_1323_Ownership
{
    default Schedule(8, 00, UAIState_Shout(), n"FP_SC_PROPHECY_20");
    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}

UCLASS()
class UDailyRoutine_SC_NOV_Novice16_1323_AfterTalkingToAngar : UDailyRoutine_SC_NOV_Novice16_1323_Ownership
{
    default Schedule(8, 00, UAIState_Listen(), n"FP_SC_PROPHECY_46");
    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}