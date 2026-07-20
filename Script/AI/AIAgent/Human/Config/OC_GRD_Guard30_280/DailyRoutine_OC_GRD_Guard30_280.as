UCLASS()
class UAIAgentConfig_Human_OC_GRD_Guard30_280 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OC_GRD_Guard30_280::StaticClass();

}

UCLASS()
class UDailyRoutine_OC_GRD_Guard30_280_Start : UAIState_DailyRoutine_Human
{
    default Schedule(0, 0, UAIState_StandAround(), n"FP_OC_STANDAROUND_70");
}
