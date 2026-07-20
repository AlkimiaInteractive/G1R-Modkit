UCLASS()
class UAIAgentConfig_Human_FM_GRD_Guard21_303N : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_FM_GRD_Guard21_303N::StaticClass();

}



UCLASS()
class UDailyRoutine_FM_GRD_Guard21_303N_Start : UAIState_DailyRoutine_Human
{
    default Schedule(0, 0, UAIState_Sleep(), n"FP_OM_GUARD_37");
    default Schedule(4, 0, UAIState_Guard(), n"FP_OM_GUARD_37");
}
