UCLASS()
class UAIAgentConfig_Human_OC_IE_Specki_1401 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OC_IE_Specki_1401::StaticClass();
}

UCLASS()
class UDailyRoutine_OC_IE_Specki_1401_Start : UAIState_DailyRoutine_Human
{
    default Schedule(13, 0, UAIState_Sit(),n"FP_SPECKI_CELL");
    // default Schedule(20, 0, UAIState_Clap(),n"FP_INEXTREMO_CLAP");
    default Schedule(0, 0, UAIState_Sit(),n"FP_SPECKI_CELL");
}