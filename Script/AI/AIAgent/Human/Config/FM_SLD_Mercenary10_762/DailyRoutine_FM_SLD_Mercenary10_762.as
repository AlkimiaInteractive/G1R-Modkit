UCLASS()
class UAIAgentConfig_Human_FM_SLD_Mercenary10_762 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_FM_SLD_Mercenary10_762::StaticClass();

}



UCLASS()
class UDailyRoutine_FM_SLD_Mercenary10_762_Start : UAIState_DailyRoutine_Human
{
    default Schedule(0, 0, UAIState_Sleep(), n"FP_FM_GUARD_13");
    default Schedule(8, 0, UAIState_Eat(), n"FP_FM_GUARD_13");
    default Schedule(8, 30, UAIState_Guard(), n"FP_FM_GUARD_13");
    default Schedule(23, 30, UAIState_Eat(), n"FP_FM_GUARD_13");

    default ScheduleIfRaining(0, 0, UAIState_Sleep(), n"FP_FM_GUARD_36");
    default ScheduleIfRaining(8, 0, UAIState_Eat(), n"FP_FM_GUARD_36");
    default ScheduleIfRaining(8, 30, UAIState_Guard(), n"FP_FM_GUARD_36");
    default ScheduleIfRaining(23, 30, UAIState_Eat(), n"FP_FM_GUARD_36");
}