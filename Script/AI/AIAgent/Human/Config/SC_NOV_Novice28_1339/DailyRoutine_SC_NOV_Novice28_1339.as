UCLASS()
class UAIAgentConfig_Human_SC_NOV_Novice28_1339 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_SC_NOV_Novice28_1339::StaticClass();

}

UCLASS()
class UDailyRoutine_SC_NOV_Novice28_1339_Start : UAIState_DailyRoutine_Human
{
    default Schedule(22, 30, UAIState_Pray(), n"FP_SC_MEDITATE_02");
}

UCLASS()
class UDailyRoutine_SC_NOV_Novice28_1339_Ritual : UAIState_DailyRoutine_Human
{
    default Schedule(8, 0, UAIState_Stay(), n"FP_SC_PROPHECY_43");
}

UCLASS()
class UDailyRoutine_SC_NOV_Novice28_1339_AfterRitual : UAIState_DailyRoutine_Human
{
    default Schedule(8, 0, UAIState_Stay(), n"FP_SC_PROPHECY_43");
}