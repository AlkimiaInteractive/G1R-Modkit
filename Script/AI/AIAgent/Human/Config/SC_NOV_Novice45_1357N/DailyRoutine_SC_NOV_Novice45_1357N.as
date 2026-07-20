UCLASS()
class UAIAgentConfig_Human_SC_NOV_Novice45_1357N : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_SC_NOV_Novice45_1357N::StaticClass();

}

UCLASS()
class UDailyRoutine_SC_NOV_Novice45_1357N_Start : UAIState_DailyRoutine_Human
{
    default Schedule(22, 30, UAIState_SitAround(), n"IO_SC_BENCH_18",600);
}
