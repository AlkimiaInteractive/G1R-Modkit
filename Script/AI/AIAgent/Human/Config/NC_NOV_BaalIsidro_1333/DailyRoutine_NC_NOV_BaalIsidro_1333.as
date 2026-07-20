UCLASS()
class UAIAgentConfig_Human_NC_NOV_BaalIsidro_1333: UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_NC_NOV_BaalIsidro_1333::StaticClass();

}



UCLASS()
class UDailyRoutine_NC_NOV_BaalIsidro_1333_Start : UAIState_DailyRoutine_Human
{
    default Schedule(7, 0, UAIState_StandAround(), n"FP_NC_STANDAROUND_29",200);
}

UCLASS()
class UDailyRoutine_NC_NOV_BaalIsidro_1333_DeliverWeed : UAIState_DailyRoutine_Human
{
    default Schedule(7, 0, UAIState_SitAround(), n"IO_NC_CHAIR_11",300);
}

