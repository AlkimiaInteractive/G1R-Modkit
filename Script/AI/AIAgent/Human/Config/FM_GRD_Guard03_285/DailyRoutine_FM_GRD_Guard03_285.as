UCLASS()
class UAIAgentConfig_Human_FM_GRD_Guard03_285 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_FM_GRD_Guard03_285::StaticClass();

}



UCLASS()
class UDailyRoutine_FM_GRD_Guard03_285_Fmtaken : UAIState_DailyRoutine_Human
{
    default Schedule(20, 0, UAIState_Guard(), n"FP_FM_GUARD_13");
}

UCLASS()
class UDailyRoutine_FM_GRD_Guard03_285_Fmtaken2 : UAIState_DailyRoutine_Human
{
    default Schedule(20, 0, UAIState_Guard(), n"FP_FM_GUARD_13");
}
