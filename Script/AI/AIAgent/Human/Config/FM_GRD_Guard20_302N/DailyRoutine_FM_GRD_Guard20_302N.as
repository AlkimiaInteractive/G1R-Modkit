UCLASS()
class UAIAgentConfig_Human_FM_GRD_Guard20_302N : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_FM_GRD_Guard20_302N::StaticClass();

}



UCLASS()
class UDailyRoutine_FM_GRD_Guard20_302N_Start : UAIState_DailyRoutine_Human
{
    default Schedule(4, 0, UAIState_Sleep(), n"FP_OM_GUARD_36");
    default Schedule(8, 0, UAIState_Guard(), n"FP_OM_GUARD_36");
}
