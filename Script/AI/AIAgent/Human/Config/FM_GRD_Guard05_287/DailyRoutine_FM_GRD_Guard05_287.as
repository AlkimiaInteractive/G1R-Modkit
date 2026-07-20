UCLASS()
class UAIAgentConfig_Human_FM_GRD_Guard05_287 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_FM_GRD_Guard05_287::StaticClass();

}



UCLASS()
class UDailyRoutine_FM_GRD_Guard05_287_Start : UAIState_DailyRoutine_Human
{
    default Schedule(20, 0, UAIState_Guard(), n"FP_FM_GUARD_22");
}
