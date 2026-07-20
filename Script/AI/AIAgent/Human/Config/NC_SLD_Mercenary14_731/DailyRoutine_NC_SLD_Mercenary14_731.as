UCLASS()
class UAIAgentConfig_Human_NC_SLD_Mercenary14_731 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_NC_SLD_Mercenary14_731::StaticClass();

}



UCLASS()
class UDailyRoutine_NC_SLD_Mercenary14_731_Start : UAIState_DailyRoutine_Human
{
    default Schedule(0, 0, UAIState_Sleep(), n"FP_NC_GUARD_28",100);
    default Schedule(8, 0, UAIState_Eat(), n"FP_NC_GUARD_28",100);
    default Schedule(8, 30, UAIState_Guard(), n"FP_NC_GUARD_28",100);
    default Schedule(23, 30, UAIState_Eat(), n"FP_NC_GUARD_28",100);
}