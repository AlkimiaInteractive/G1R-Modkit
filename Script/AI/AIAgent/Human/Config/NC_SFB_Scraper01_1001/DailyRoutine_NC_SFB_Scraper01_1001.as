UCLASS()
class UAIAgentConfig_Human_NC_SFB_Scraper01_1001 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_NC_SFB_Scraper01_1001::StaticClass();

}



UCLASS()
class UDailyRoutine_NC_SFB_Scraper01_1001_Start : UAIState_DailyRoutine_Human
{
    default Schedule(2, 0, UAIState_Sleep_Table(), n"IO_NC_CHAIR_10");
    default Schedule(7, 30, UAIState_Eat(), n"IO_NC_CHAIR_10",);
    default Schedule(8, 30, UAIState_StandAround(), n"FP_NC_STANDAROUND_03",);
    default Schedule(20, 0, UAIState_Eat(), n"IO_NC_CHAIR_10");
    default Schedule(21, 20, UAIState_StandAround(), n"FP_NC_STANDAROUND_05");
}