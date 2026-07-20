UCLASS()
class UAIAgentConfig_Human_SC_GUR_CorAngar_1202: UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_SC_GUR_CorAngar_1202::StaticClass();

}

UCLASS()
class UDailyRoutine_SC_GUR_CorAngar_1202_Ownership : UAIState_DailyRoutine_Human
{
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_SwampCamp_Village_Huts_CorAngar);
    default KnownPlaces.Add(Location::Bed, n"IO_SC_BED_CORANGAR");
    default KnownPlaces.Add(Location::Home, n"IO_SC_BED_CORANGAR");
}

UCLASS()
class UDailyRoutine_SC_GUR_CorAngar_1202_Start : UDailyRoutine_SC_GUR_CorAngar_1202_Ownership
{
    default Schedule(0, 0, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
    default Schedule(5, 30, UAIState_Eat(), n"IO_SC_BENCH_4", 200);
    default Schedule(7, 0, UAIState_Guard(), n"FP_SC_STANDAROUND_01");
    default Schedule(12, 56, UAIState_Stand(), n"FP_SC_STANDAROUND_01");
    default Schedule(13, 56, UAIState_Guard(), n"FP_SC_STANDAROUND_01");
    default Schedule(21, 30, UAIState_Stand(), n"FP_SC_STANDAROUND_01");
    default Schedule(22, 30, UAIState_Guard(), n"FP_SC_STANDAROUND_01");

    default ScheduleIfRaining(0, 0, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
    default ScheduleIfRaining(5, 30, UAIState_RainShelter(), n"FP_SC_RAINSHELTER_02");
    default ScheduleIfRaining(7, 0, UAIState_Guard(), n"FP_SC_STANDAROUND_01");
    default ScheduleIfRaining(12, 56, UAIState_Stand(), n"FP_SC_STANDAROUND_01");
    default ScheduleIfRaining(13, 56, UAIState_Guard(), n"FP_SC_STANDAROUND_01");
    default ScheduleIfRaining(21, 30, UAIState_Stand(), n"FP_SC_STANDAROUND_01");
    default ScheduleIfRaining(22, 30, UAIState_Guard(), n"FP_SC_STANDAROUND_01");
}

UCLASS()
class UDailyRoutine_SC_GUR_CorAngar_1202_Callsleeper : UDailyRoutine_SC_GUR_CorAngar_1202_Ownership
{
    default Schedule(12, 0, UAIState_Stay(), n"FP_SC_CALL_SLEEPER_RIGHT");
    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}

UCLASS()
class UDailyRoutine_SC_GUR_CorAngar_1202_AfterInvocation : UDailyRoutine_SC_GUR_CorAngar_1202_Ownership
{
    default Schedule(12, 0, UAIState_Smalltalk(), n"FP_SC_YEBERION_CHAMBER4");
    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}

UCLASS()
class UDailyRoutine_SC_GUR_CorAngar_1202_StandAroundForFiveHours : UDailyRoutine_SC_GUR_CorAngar_1202_Ownership
{
    default AutoSwitchAfterTime = FInGameTime::FromHours(5);
    default AutoSwitchToRoutine = UDailyRoutine_SC_GUR_CorAngar_1202_Start;

    default Schedule(8, 0, UAIState_StandAround(), n"FP_SC_YEBERION_CHAMBER4");
}

