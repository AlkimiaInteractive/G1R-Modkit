UCLASS()
class UAIAgentConfig_Human_OM_TPL_GorNaKosh_1401 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OM_TPL_GorNaKosh_1401::StaticClass();

}



UCLASS()
class UDailyRoutine_OM_TPL_GorNaKosh_1401_Start : UAIState_DailyRoutine_Human
{
    default Schedule(0, 0, UAIState_SitAround(), n"IO_OM_CHAIR_BENCH_06");
}


UCLASS()
class UDailyRoutine_OM_TPL_GorNaKosh_1401_Tunnel : UAIState_DailyRoutine_Human
{
    default Schedule(0, 0, UAIState_Guard(), n"FP_OM_GUARD_30");
}

UCLASS()
class UDailyRoutine_OM_TPL_GorNaKosh_1401_Collapsed : UAIState_DailyRoutine_Human
{
    default Schedule(8, 0, UAIState_Smoke(), n"FP_OM_FL_SMOKE_01");
    default Schedule(12, 0, UAIState_SitAround(), n"FP_OM_FL_SMOKE_01");
    default Schedule(16, 0, UAIState_Eat(), n"FP_OM_FL_SMOKE_01");
    default Schedule(20, 0, UAIState_Smoke(), n"FP_OM_FL_SMOKE_01");
    default Schedule(23, 0, UAIState_SitAround(), n"FP_OM_FL_SMOKE_01");

    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}