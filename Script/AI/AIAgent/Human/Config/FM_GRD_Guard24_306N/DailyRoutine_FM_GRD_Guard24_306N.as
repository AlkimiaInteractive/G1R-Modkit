UCLASS()
class UAIAgentConfig_Human_FM_GRD_Guard24_306N : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_FM_GRD_Guard24_306N::StaticClass();

}



UCLASS()
class UDailyRoutine_FM_GRD_Guard24_306N_Start : UAIState_DailyRoutine_Human
{
    default Schedule(20, 0, UAIState_CutWood_Trunk(), n"IO_OM_CUTWOOD");
}
