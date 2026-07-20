UCLASS()
class UAIAgentConfig_Human_OC_GRD_Guard31_283N : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OC_GRD_Guard31_283N::StaticClass();
}

UCLASS()
class UDailyRoutine_OC_GRD_Guard31_283N_Start : UAIState_DailyRoutine_Human
{
    default Schedule(18, 0, UAIState_Guard(), n"FP_OW_CONVOY_3",1000);
}

