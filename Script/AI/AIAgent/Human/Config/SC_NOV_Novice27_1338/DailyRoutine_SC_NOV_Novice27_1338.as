UCLASS()
class UAIAgentConfig_Human_SC_NOV_Novice27_1338 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_SC_NOV_Novice27_1338::StaticClass();

}



UCLASS()
class UDailyRoutine_SC_NOV_Novice27_1338_Start : UAIState_DailyRoutine_Human
{
    default Schedule(22, 30, UAIState_Pray(), n"FP_SC_MEDITATE_06");
}

UCLASS()
class UDailyRoutine_SC_NOV_Novice27_1338_Ritual : UAIState_DailyRoutine_Human
{
    default Schedule(8, 0, UAIState_SitAround(), n"IO_SC_BENCH_1",2000);
    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;

}

UCLASS()
class UDailyRoutine_SC_NOV_Novice27_1338_CampDivided : UAIState_DailyRoutine_Human
{
    default Schedule(10, 0, UAIState_Drained(), n"FP_OG_DRAINED_03");
    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}
