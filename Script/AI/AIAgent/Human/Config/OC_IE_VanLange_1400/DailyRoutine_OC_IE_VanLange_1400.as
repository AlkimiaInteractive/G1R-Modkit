UCLASS()
class UAIAgentConfig_Human_OC_IE_VanLange_1400 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OC_IE_VanLange_1400::StaticClass();
}

UCLASS()
class UDailyRoutine_OC_IE_VanLange_1400_Start : UAIState_DailyRoutine_Human
{
    default Schedule(13, 0, UAIState_LeanWall(),n"FP_INEXTREMO_LEANWALL_03");
    // default Schedule(20, 0, UAIState_Dance(),n"FP_INEXTREMO_DANCE_02");
    default Schedule(0, 0, UAIState_LeanWall(),n"FP_INEXTREMO_LEANWALL_03");
}