UCLASS()
class UAIAgentConfig_Human_OC_GRD_Guard37_289N : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OC_GRD_Guard37_289N::StaticClass();
}

UCLASS()
class UDailyRoutine_OC_GRD_Guard37_289N_Start : UAIState_DailyRoutine_Human
{
    default Schedule(18, 0, UAIState_Smalltalk(), n"FP_OW_CONVOY_8",1000);
}