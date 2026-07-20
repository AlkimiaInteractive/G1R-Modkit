UCLASS()
class UAIAgentConfig_Human_OC_GRD_Guard36_288N : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OC_GRD_Guard36_288N::StaticClass();
}

UCLASS()
class UDailyRoutine_OC_GRD_Guard36_288N_Start : UAIState_DailyRoutine_Human
{
    default Schedule(18, 0, UAIState_Sit(), n"FP_OW_CONVOY_6",1000);
}

UCLASS()
class UDailyRoutine_OC_GRD_Guard36_288N_GetWood : UAIState_DailyRoutine_Human
{
    default Schedule(18, 0, UAIState_LookAround(), n"FP_OW_CONVOY_20",600);
}