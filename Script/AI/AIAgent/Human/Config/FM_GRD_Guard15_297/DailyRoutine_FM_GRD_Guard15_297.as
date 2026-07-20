UCLASS()
class UAIAgentConfig_Human_FM_GRD_Guard15_297 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_FM_GRD_Guard15_297::StaticClass();

}



UCLASS()
class UDailyRoutine_FM_GRD_Guard15_297_Start : UAIState_DailyRoutine_Human
{
    default Schedule(20, 0, UAIState_Guard(), n"FP_FM_GUARD_32");
}
