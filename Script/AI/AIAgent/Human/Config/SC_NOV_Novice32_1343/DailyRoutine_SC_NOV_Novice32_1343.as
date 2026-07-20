UCLASS()
class UAIAgentConfig_Human_SC_NOV_Novice32_1343 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_SC_NOV_Novice32_1343::StaticClass();

}



UCLASS()
class UDailyRoutine_SC_NOV_Novice32_1343_Start : UAIState_DailyRoutine_Human
{
    default Schedule(22, 30, UAIState_Pray(), n"FP_SC_MEDITATE_05");
}

UCLASS()
class UDailyRoutine_SC_NOV_Novice32_1343_Ritual : UAIState_DailyRoutine_Human
{
    default Schedule(8, 0, UAIState_SitAround(), n"IO_SC_BENCH_1",2000);
}