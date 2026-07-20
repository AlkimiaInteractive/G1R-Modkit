UCLASS()
class UAIAgentConfig_Human_SC_NOV_Novice24_1335 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_SC_NOV_Novice24_1335::StaticClass();

}

UCLASS()
class UDailyRoutine_SC_NOV_Novice24_1335_Ownership : UAIState_DailyRoutine_Human
{
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_SwampCamp_WeedHarvesters_Huts_03);
    default KnownPlaces.Add(Location::Bed, n"IO_SC_BED_NOVICE24");
    default KnownPlaces.Add(Location::Home, n"IO_SC_BED_NOVICE24");
}

UCLASS()
class UDailyRoutine_SC_NOV_Novice24_1335_Start : UDailyRoutine_SC_NOV_Novice24_1335_Ownership
{
    default Schedule(0, 0, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
    default Schedule(6, 30, UAIState_Eat(), n"IO_SC_BENCH_42");
    default Schedule(7, 0, UAIState_PickRice(), n"FP_SC_PICKRICE_07");
    default Schedule(12, 56, UAIState_Rest(), n"FP_SC_PICKRICE_08");
    default Schedule(13, 56, UAIState_PickRice(), n"FP_SC_PICKRICE_07");
    default Schedule(21, 30, UAIState_SitAround(), n"IO_SC_BENCH_8");

    default ScheduleIfRaining(0, 0, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
    default ScheduleIfRaining(6, 30, UAIState_RainShelter(), n"FP_SC_RAINSHELTER_06");
    default ScheduleIfRaining(7, 0, UAIState_PickRice(), n"FP_SC_PICKRICE_07");
    default ScheduleIfRaining(12, 56, UAIState_Rest(), n"FP_SC_PICKRICE_08");
    default ScheduleIfRaining(13, 56, UAIState_PickRice(), n"FP_SC_PICKRICE_07");
    default ScheduleIfRaining(21, 30, UAIState_SitAround(), n"IO_SC_BENCH_8");
}

UCLASS()
class UDailyRoutine_SC_NOV_Novice24_1335_Ritual : UDailyRoutine_SC_NOV_Novice24_1335_Ownership
{
    default Schedule(8, 00, UAIState_StandAround(), n"FP_SC_PROPHECY_23");
    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}

UCLASS()
class UDailyRoutine_SC_NOV_Novice24_1335_AfterRitual : UDailyRoutine_SC_NOV_Novice24_1335_Ownership
{
    default Schedule(8, 00, UAIState_Shout(), n"FP_SC_PROPHECY_23");
    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}

UCLASS()
class UDailyRoutine_SC_NOV_Novice24_1335_AfterTalkingToAngar : UDailyRoutine_SC_NOV_Novice24_1335_Ownership
{
    default Schedule(8, 00, UAIState_Listen(), n"FP_SC_PROPHECY_44");
    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}