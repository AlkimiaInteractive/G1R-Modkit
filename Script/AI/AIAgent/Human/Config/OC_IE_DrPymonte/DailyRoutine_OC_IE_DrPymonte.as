UCLASS()
class UAIAgentConfig_Human_OC_IE_DrPymonte : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OC_IE_DrPymonte::StaticClass();
}

UCLASS()
class UDailyRoutine_OC_IE_DrPymonte_Start : UAIState_DailyRoutine_Human
{
    default Schedule(13, 0, UAIState_LeanWall(),n"FP_INEXTREMO_LEAN_02");
    // default Schedule(20, 0, UAIState_Clap_Seated(),n"IO_CHAIR_INEXTREMO");
    default Schedule(0, 0, UAIState_Sleep_Seated(),n"IO_CHAIR_INEXTREMO");
}