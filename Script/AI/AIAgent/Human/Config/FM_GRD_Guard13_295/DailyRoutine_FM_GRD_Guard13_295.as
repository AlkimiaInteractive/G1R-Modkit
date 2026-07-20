UCLASS()
class UAIAgentConfig_Human_FM_GRD_Guard13_295 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_FM_GRD_Guard13_295::StaticClass();

}



UCLASS()
class UDailyRoutine_FM_GRD_Guard13_295_Start : UAIState_DailyRoutine_Human
{
    default Schedule(20, 0, UAIState_Guard(), n"FP_FM_GUARD_30");
}
