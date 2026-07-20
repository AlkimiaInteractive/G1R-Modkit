UCLASS()
class UAIAgentConfig_Human_FM_GRD_Guard01_246 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_FM_GRD_Guard01_246::StaticClass();

}



UCLASS()
class UDailyRoutine_FM_GRD_Guard01_246_Start : UAIState_DailyRoutine_Human
{
    default Schedule(0, 0, UAIState_Guard(), n"FP_FM_GUARD_19");
}

