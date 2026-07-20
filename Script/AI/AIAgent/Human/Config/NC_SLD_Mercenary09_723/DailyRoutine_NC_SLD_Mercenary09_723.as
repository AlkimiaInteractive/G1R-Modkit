UCLASS()
class UAIAgentConfig_Human_NC_SLD_Mercenary09_723 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_NC_SLD_Mercenary09_723::StaticClass();

}



UCLASS()
class UDailyRoutine_NC_SLD_Mercenary09_723_Start : UAIState_DailyRoutine_Human
{
    default Schedule(0, 0, UAIState_Sleep(), n"FP_NC_GUARD_25");
    default Schedule(8, 0, UAIState_Eat(), n"FP_NC_GUARD_25");
    default Schedule(8, 30, UAIState_Guard(), n"FP_NC_GUARD_25");
    default Schedule(23, 30, UAIState_Eat(), n"FP_NC_GUARD_25");
}