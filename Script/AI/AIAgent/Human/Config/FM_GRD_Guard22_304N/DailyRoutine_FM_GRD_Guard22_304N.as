UCLASS()
class UAIAgentConfig_Human_FM_GRD_Guard22_304N : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_FM_GRD_Guard22_304N::StaticClass();

}



UCLASS()
class UDailyRoutine_FM_GRD_Guard22_304N_Start : UAIState_DailyRoutine_Human
{
    default Schedule(0, 0, UAIState_Sleep(), n"FP_OM_GUARD_38");
    default Schedule(7, 0, UAIState_Guard(), n"FP_OM_GUARD_38");
}
