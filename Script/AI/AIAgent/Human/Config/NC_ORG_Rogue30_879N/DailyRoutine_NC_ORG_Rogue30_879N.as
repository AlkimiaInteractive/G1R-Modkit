UCLASS()
class UAIAgentConfig_Human_NC_ORG_Rogue30_879N : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_NC_ORG_Rogue30_879N::StaticClass();

}



UCLASS()
class UDailyRoutine_NC_ORG_Rogue30_879N_Start : UAIState_DailyRoutine_Human
{
    default Schedule(23, 0, UAIState_Drink(), n"IO_NC_CHAIR_30",200);

    default ScheduleDuringEvent(UAIWorldEvent_Explicit_Rogue31PlayLute::StaticClass(), 0, 0, UAIState_WE_LuteEvent(), n"FP_NC_PLAYLUTE");

}