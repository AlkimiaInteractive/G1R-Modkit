UCLASS()
class UAIAgentConfig_Human_OC_GRD_Guard39_291N : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OC_GRD_Guard39_291N::StaticClass();
}

UCLASS()
class UDailyRoutine_OC_GRD_Guard39_291N_Start : UAIState_DailyRoutine_Human
{
    default Schedule(18, 0, UAIState_Push(), n"FP_OW_CONVOY_1",1000);
}