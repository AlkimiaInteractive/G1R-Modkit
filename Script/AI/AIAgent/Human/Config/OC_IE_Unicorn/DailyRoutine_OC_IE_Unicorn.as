UCLASS()
class UAIAgentConfig_Human_OC_IE_Unicorn : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OC_IE_Unicorn::StaticClass();
}

UCLASS()
class UDailyRoutine_OC_IE_Unicorn_Start : UAIState_DailyRoutine_Human
{
    default Schedule(13, 0, UAIState_TuneInstrument(),n"FP_UNICORN_CELL");
    // default Schedule(20, 0, UAIState_PlayTune(),n"IO_CHAIR_BENCH_INEXTREMO");
    default Schedule(0, 0, UAIState_Sleep_Seated(),n"IO_CHAIR_BENCH_INEXTREMO");
}