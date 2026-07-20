UCLASS()
class UAIAgentConfig_Human_FM_GRD_Guard23_305N : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_FM_GRD_Guard23_305N::StaticClass();

}



UCLASS()
class UDailyRoutine_FM_GRD_Guard23_305N_Start : UAIState_DailyRoutine_Human
{
    default Schedule(20, 0, UAIState_SitAround(), n"IO_OM_CHAIR_01");
}
