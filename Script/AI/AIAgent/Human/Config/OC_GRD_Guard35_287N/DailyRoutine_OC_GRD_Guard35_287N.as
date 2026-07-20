UCLASS()
class UAIAgentConfig_Human_OC_GRD_Guard35_287N : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OC_GRD_Guard35_287N::StaticClass();
}

UCLASS()
class UDailyRoutine_OC_GRD_Guard35_287N_Start : UAIState_DailyRoutine_Human
{
    default Schedule(18, 0, UAIState_Sit(), n"FP_OW_CONVOY_5",1000);
}

UCLASS()
class UDailyRoutine_OC_GRD_Guard35_287N_GetWood : UAIState_DailyRoutine_Human
{
    default Schedule(18, 0, UAIState_LookAround(), n"FP_OW_CONVOY_20",600);
}