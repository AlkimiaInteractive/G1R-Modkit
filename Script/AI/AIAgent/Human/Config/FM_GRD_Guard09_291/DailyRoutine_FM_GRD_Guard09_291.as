UCLASS()
class UAIAgentConfig_Human_FM_GRD_Guard09_291 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_FM_GRD_Guard09_291::StaticClass();

}



UCLASS()
class UDailyRoutine_FM_GRD_Guard09_291_Start : UAIState_DailyRoutine_Human
{
    default Schedule(20, 0, UAIState_Guard(), n"FP_FM_GUARD_26");
}
