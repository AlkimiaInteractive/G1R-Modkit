UCLASS()
class UAIAgentConfig_Human_OC_GRD_Guard33_285N : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OC_GRD_Guard33_285N::StaticClass();
}

UCLASS()
class UDailyRoutine_OC_GRD_Guard33_285N_Start : UAIState_DailyRoutine_Human
{
    default Schedule(18, 0, UAIState_Guard(), n"FP_OW_CONVOY_4",1000);
}

UCLASS()
class UDailyRoutine_OC_GRD_Guard33_285N_GetWood : UAIState_DailyRoutine_Human
{
    default Schedule(18, 0, UAIState_LookAround(), n"FP_OW_CONVOY_20",600);
}