UCLASS()
class UAIAgentConfig_Human_NC_SFB_Senyan_1000 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_NC_SFB_Senyan_1000::StaticClass();

}



UCLASS()
class UDailyRoutine_NC_SFB_Senyan_1000_Start : UAIState_DailyRoutine_Human
{
    default Schedule(23, 5, UAIState_SitAround(), n"IO_NC_CHAIR_15",150);
}