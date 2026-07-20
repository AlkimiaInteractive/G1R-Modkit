UCLASS()
class UAIAgentConfig_Human_SC_GUR_BaalTondral_1203: UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_SC_GUR_BaalTondral_1203::StaticClass();

}

UCLASS()
class UDailyRoutine_SC_GUR_BaalTondral_1203_Ownership : UAIState_DailyRoutine_Human
{
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_SwampCamp_Village_Huts_BaalTondral);
    default KnownPlaces.Add(Location::Bed, n"IO_SC_BED_BAALTONDRAL");
    default KnownPlaces.Add(Location::Home, n"IO_SC_BED_BAALTONDRAL");
}

UCLASS()
class UDailyRoutine_SC_GUR_BaalTondral_1203_Start : UDailyRoutine_SC_GUR_BaalTondral_1203_Ownership
{
    default Schedule(6, 0, UAIState_Eat(), n"IO_SC_BENCH_1", 200);
    default Schedule(7, 30, UAIState_Preach(), n"FP_SC_PREACHING_04");
    default Schedule(12, 56, UAIState_Meditate(), n"FP_SC_PREACHING_04");
    default Schedule(13, 56, UAIState_Preach(), n"FP_SC_PREACHING_04");
    default Schedule(21, 30, UAIState_Meditate(), n"FP_SC_PREACHING_04");
    default Schedule(22, 30, UAIState_Preach(), n"FP_SC_PREACHING_04");
    default Schedule(23, 0, UAIState_Smoke_Ground(), n"IO_SC_WATERPIPE_02",600);
    default Schedule(1, 0, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);

    default ScheduleIfRaining(7, 0, UAIState_RainShelter(), n"FP_SC_RAINSHELTER_01");
    default ScheduleIfRaining(7, 30, UAIState_Preach(), n"FP_SC_PREACHING_04");
    default ScheduleIfRaining(12, 56, UAIState_Meditate(), n"FP_SC_PREACHING_04");
    default ScheduleIfRaining(13, 56, UAIState_Preach(), n"FP_SC_PREACHING_04");
    default ScheduleIfRaining(21, 30, UAIState_Meditate(), n"FP_SC_PREACHING_04");
    default ScheduleIfRaining(22, 30, UAIState_Preach(), n"FP_SC_PREACHING_04");
    default ScheduleIfRaining(23, 0, UAIState_Smoke_Ground(), n"IO_SC_WATERPIPE_02",600);
    default ScheduleIfRaining(1, 0, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
}


UCLASS()
class UDailyRoutine_SC_GUR_BaalTondral_1203_Callsleeper : UDailyRoutine_SC_GUR_BaalTondral_1203_Ownership
{
    default Schedule(12, 0, UAIState_Stay(), n"PSI_TEMPLE_STAIRS_RIGHT");
}

UCLASS()
class UDailyRoutine_SC_GUR_BaalTondral_1203_CampDivided : UAIState_DailyRoutine_Human
{
    default Schedule(12, 0, UAIState_Preach(), n"FP_OG_PREACH_01",500);

    default ScheduleIfRaining(12, 0, UAIState_Smoke(), n"FP_OG_RAINSHELTER_01",500);
    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}

