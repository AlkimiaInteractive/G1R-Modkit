UCLASS()
class UAIAgentConfig_Human_FM_GRD_Guard26_308N : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_FM_GRD_Guard26_308N::StaticClass();

}



UCLASS()
class UDailyRoutine_FM_GRD_Guard26_308N_Start : UAIState_DailyRoutine_Human
{
    default Schedule(8, 0, UAIState_Smalltalk(), n"FP_OM_GUARD_45");
    default Schedule(14, 0, UAIState_Inspect(), n"FP_OM_GUARD_40");
}

