UCLASS()
class UAIAgentConfig_Human_FM_SFB_Scraper04_1033 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_FM_SFB_Scraper04_1033::StaticClass();

}



UCLASS()
class UDailyRoutine_FM_SFB_Scraper04_1033_Start : UAIState_DailyRoutine_Human
{
    default Schedule(0, 0, UAIState_PickOre(), n"IO_FM_PICKORE_01");
    default Schedule(11, 0, UAIState_Rest(), n"FP_FM_REST_09",100);
    default Schedule(12, 0, UAIState_PickOre(), n"IO_FM_PICKORE_01");
    default Schedule(23, 0, UAIState_Eat(), n"FP_FM_REST_09",100);

    default ScheduleIfRaining(0, 0, UAIState_PickOre(), n"IO_FM_PICKORE_01");
    default ScheduleIfRaining(11, 0, UAIState_RainShelter(), n"FP_FM_RAINSHELTER_05",100);
    default ScheduleIfRaining(12, 0, UAIState_PickOre(), n"IO_FM_PICKORE_01");
    default ScheduleIfRaining(23, 0, UAIState_Eat(), n"FP_FM_RAINSHELTER_05",100);
}