UCLASS()
class UAIAgentConfig_Human_OC_IE_Flex : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OC_IE_Flex::StaticClass();
}

UCLASS()
class UDailyRoutine_OC_IE_Flex_Start : UAIState_DailyRoutine_Human
{
    default Schedule(13, 0, UAIState_Sit(),n"FP_FLEX_CELL");
    // default Schedule(20, 0, UAIState_Clap_Seated(),n"IO_CHAIR_BENCH_INEXTREMO_02");
    default Schedule(0, 0, UAIState_Sleep_Seated(),n"IO_CHAIR_BENCH_INEXTREMO_02");
}