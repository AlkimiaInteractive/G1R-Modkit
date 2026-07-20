UCLASS()
class UAIAgentConfig_Human_FM_SFB_Scraper03_1032 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_FM_SFB_Scraper03_1032::StaticClass();

}



UCLASS()
class UDailyRoutine_FM_SFB_Scraper03_1032_Start : UAIState_DailyRoutine_Human
{
    default Schedule(0, 0, UAIState_PickOre(), n"IO_FM_PICKORE_9");
    default Schedule(11, 0, UAIState_Rest(), n"FP_FM_REST_01");
    default Schedule(12, 0, UAIState_PickOre(), n"IO_FM_PICKORE_9");
    default Schedule(23, 0, UAIState_Eat(), n"FP_FM_REST_01");
}