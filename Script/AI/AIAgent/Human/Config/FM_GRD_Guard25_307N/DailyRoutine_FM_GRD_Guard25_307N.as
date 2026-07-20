UCLASS()
class UAIAgentConfig_Human_FM_GRD_Guard25_307N : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_FM_GRD_Guard25_307N::StaticClass();

}



UCLASS()
class UDailyRoutine_FM_GRD_Guard25_307N_Start : UAIState_DailyRoutine_Human
{
    default Schedule(6, 0, UAIState_SitAround(), n"IO_OM_CHAIR_BENCH_03");
    default Schedule(18, 0, UAIState_TakeNotes(), n"FP_OM_FL_ANOTATEGOODS_3");
}
