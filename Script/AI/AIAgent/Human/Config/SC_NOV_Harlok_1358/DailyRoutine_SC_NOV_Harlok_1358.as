UCLASS()
class UAIAgentConfig_Human_SC_NOV_Harlok_1358 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_SC_NOV_Harlok_1358::StaticClass();

}



UCLASS()
class UDailyRoutine_SC_NOV_Harlok_1358_Start : UAIState_DailyRoutine_Human
{
    default Schedule(20, 0, UAIState_Smoke(), n"FP_SC_SMOKE_04", 500);
}


UCLASS()
class UDailyRoutine_SC_NOV_Harlok_1358_Work : UAIState_DailyRoutine_Human
{
    default AutoSwitchAfterTime = FInGameTime::FromHours(12);
    default AutoSwitchToRoutine = UDailyRoutine_SC_NOV_Harlok_1358_WorkComplete;

    default Schedule(23, 55, UAIState_RunToHerbAlchemy(), n"IO_SC_SMASHER_01", 200);
}

UCLASS()
class UDailyRoutine_SC_NOV_Harlok_1358_WorkComplete : UAIState_DailyRoutine_Human
{
    default Schedule(8, 50, UAIState_HerbAlchemy(), n"IO_SC_SMASHER_01",200);
    default Schedule(23, 50, UAIState_Sleep(), n"IO_SC_BENCH_18", WaypointRadius = 600);
}


