UCLASS()
class UAIAgentConfig_Human_OC_IE_Lutter : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OC_IE_Lutter::StaticClass();
}

UCLASS()
class UDailyRoutine_OC_IE_Lutter_Start : UAIState_DailyRoutine_Human
{
    default Schedule(8, 0, UAIState_LeanWall(),n"FP_INEXTREMO_LEAN");
}