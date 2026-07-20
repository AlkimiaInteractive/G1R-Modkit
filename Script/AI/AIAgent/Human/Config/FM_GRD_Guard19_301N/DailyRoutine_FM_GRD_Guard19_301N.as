UCLASS()
class UAIAgentConfig_Human_FM_GRD_Guard19_301N : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_FM_GRD_Guard19_301N::StaticClass();

}



UCLASS()
class UDailyRoutine_FM_GRD_Guard19_301N_Start : UAIState_DailyRoutine_Human
{
    default Schedule(20, 0, UAIState_Guard(), n"FP_OM_GUARD_35");
}
