UCLASS()
class UAIAgentConfig_Human_SC_NOV_Viran_1302 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_SC_NOV_Viran_1302::StaticClass();

}

UCLASS()
class UDailyRoutine_SC_NOV_Viran_1302_Ownership : UAIState_DailyRoutine_Human
{
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_SwampCamp_Village_Huts_Viran);
    default KnownPlaces.Add(Location::Bed, n"IO_SC_BED_VIRAN_CM");
    default KnownPlaces.Add(Location::Home, n"IO_SC_BED_VIRAN_CM");
}

UCLASS()
class UDailyRoutine_SC_NOV_Viran_1302_Start : UDailyRoutine_SC_NOV_Viran_1302_Ownership
{
    

    default Schedule(0, 0, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
    default Schedule(6, 30, UAIState_Eat(), n"IO_SC_BENCH_4");
    default Schedule(7, 0, UAIState_GuardPatrol(), n"FP_SC_GUARD_20",3000);
    default Schedule(11, 30, UAIState_Cook(), n"IO_SC_CAMP_CAULDRON_04");
    default Schedule(13, 30, UAIState_Eat(), n"FP_SC_EAT_06");
    default Schedule(14, 30, UAIState_GuardPatrol(), n"FP_SC_GUARD_21",3000);
    default Schedule(18, 30, UAIState_Cook(), n"IO_SC_CAMP_CAULDRON_04");
    default Schedule(21, 30, UAIState_Eat(), n"IO_SC_BENCH_4");

    default ScheduleIfRaining(0, 0, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
    default ScheduleIfRaining(6, 30, UAIState_RainShelter(), n"FP_SC_RAINSHELTER_08");
    default ScheduleIfRaining(7, 0, UAIState_GuardPatrol(), n"FP_SC_GUARD_45",3000);
    default ScheduleIfRaining(13, 30, UAIState_Eat(), n"FP_SC_GUARD_46");
    default ScheduleIfRaining(14, 30, UAIState_GuardPatrol(), n"FP_SC_GUARD_46",3000);
    default ScheduleIfRaining(21, 30, UAIState_RainShelter(), n"FP_SC_RAINSHELTER_08");
}

UCLASS()
class UDailyRoutine_SC_NOV_Viran_1302_CampDivided : UAIState_DailyRoutine_Human
{
    //default Schedule(13, 30, UAIState_Eat(), n"FP_OG_GROUND_02",500);
    //default Schedule(18, 30, UAIState_Smoke(), n"FP_OG_SMOKE_01",500);
    //default Schedule(20, 30, UAIState_Eat(), n"FP_OG_GROUND_02",500);
    default Schedule(0, 30, UAIState_Pray(), n"FP_OG_PRAY_02",500);
    default Schedule(4, 30, UAIState_Smoke(), n"FP_OG_SMOKE_02",500);

    default ScheduleIfRaining(12, 0, UAIState_Meditate(), n"FP_OG_RAINSHELTER_05",500);
    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}

UCLASS()
class UDailyRoutine_SC_NOV_Viran_1302_Follow : UAIState_DailyRoutine_Human
{
    default bSimulateRoutineTasksFromStartTime = false;
    default Schedule(23, 0, UAIState_FollowHero(150), Location::Anywhere);
}

UCLASS()
class UDailyRoutine_SC_NOV_Viran_1302_Wait : UAIState_DailyRoutine_Human
{
    default Schedule(13, 30, UAIState_StandAround(), n"FP_OG_STANDAROUND_3",750);
}

UCLASS()
class UDailyRoutine_SC_NOV_Viran_1302_Escape : UAIState_DailyRoutine_Human
{
    default Schedule(8, 0, UAIState_RunToStandAround(),n"FP_OG_STANDAROUND_6");
}