
UCLASS()
class UAIAgentConfig_Human_UL_NON_Gilbert_1500 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_UL_NON_Gilbert_1500::StaticClass();
}


UCLASS()
class UDailyRoutine_UL_NON_Gilbert_1500_Start : UAIState_DailyRoutine_Human
{
    default Schedule(5, 0, UAIState_SitAround(), n"FP_OT_GILBERT_01");
    default Schedule(12, 0, UAIState_Cook(), n"IO_Gilbert_Cauldron_01");
    default Schedule(14, 0, UAIState_SitAround(), n"FP_OT_GILBERT_02");
    default Schedule(18, 0, UAIState_Cook(), n"IO_Gilbert_Cauldron_01");
    default Schedule(22, 0, UAIState_SitAround(), n"FP_OT_GILBERT_02");
}

