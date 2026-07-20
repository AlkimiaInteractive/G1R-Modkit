UCLASS()
class UAIAgentConfig_Human_OC_GRD_Guard34_286N : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OC_GRD_Guard34_286N::StaticClass();
}

UCLASS()
class UDailyRoutine_OC_GRD_Guard34_286N_Start : UAIState_DailyRoutine_Human
{
        default Schedule(18, 0, UAIState_Smoke(), n"FP_OW_CONVOY_7",1000);

}