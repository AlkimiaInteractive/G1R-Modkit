UCLASS()
class UAIAgentConfig_Human_SC_NOV_Novice44_1356N : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_SC_NOV_Novice44_1356N::StaticClass();

}

UCLASS()
class UDailyRoutine_SC_NOV_Novice44_1356N_Start : UAIState_DailyRoutine_Human
{
    default Schedule(22, 30, UAIState_Smoke_Ground(), n"IO_SC_WATERPIPE_01",600);
}
