UCLASS()
class UAIAgentConfig_Human_FM_SLD_Mercenary08_760 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_FM_SLD_Mercenary08_760::StaticClass();

}



UCLASS()
class UDailyRoutine_FM_SLD_Mercenary08_760_Start : UAIState_DailyRoutine_Human
{
    default Schedule(0, 0, UAIState_Sleep(), n"FP_FM_GUARD_11");
    default Schedule(8, 0, UAIState_Eat(), n"FP_FM_GUARD_11");
    default Schedule(8, 30, UAIState_Guard(), n"FP_FM_GUARD_11");
    default Schedule(23, 30, UAIState_Eat(), n"FP_FM_GUARD_11");
}