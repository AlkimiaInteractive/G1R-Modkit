UCLASS()
class UAIAgentConfig_Human_OC_GRD_Guard32_284N : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OC_GRD_Guard32_284N::StaticClass();
}

UCLASS()
class UDailyRoutine_OC_GRD_Guard32_284N_Start : UAIState_DailyRoutine_Human
{
        default Schedule(18, 0, UAIState_Guard(), n"FP_OW_CONVOY_2",1000);
}

UCLASS()
class UDailyRoutine_OC_GRD_Guard32_284N_GetWood : UAIState_DailyRoutine_Human
{
        default Schedule(18, 0, UAIState_LookAround(), n"FP_OW_CONVOY_20",600);
}