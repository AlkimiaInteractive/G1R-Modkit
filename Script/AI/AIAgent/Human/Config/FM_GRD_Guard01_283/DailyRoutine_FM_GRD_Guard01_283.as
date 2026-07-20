UCLASS()
class UAIAgentConfig_Human_FM_GRD_Guard01_283 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_FM_GRD_Guard01_283::StaticClass();

}



UCLASS()
class UDailyRoutine_FM_GRD_Guard01_283_Fmtaken : UAIState_DailyRoutine_Human
{
    default Schedule(20, 0, UAIState_Guard(), n"FP_FM_GUARD_12");
}

UCLASS()
class UDailyRoutine_FM_GRD_Guard01_283_Fmtaken2 : UAIState_DailyRoutine_Human
{
    default Schedule(20, 0, UAIState_Guard(), n"FP_FM_GUARD_12");
}
