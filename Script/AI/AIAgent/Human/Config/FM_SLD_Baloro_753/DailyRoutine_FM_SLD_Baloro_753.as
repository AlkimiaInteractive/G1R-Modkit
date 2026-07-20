UCLASS()
class UAIAgentConfig_Human_FM_SLD_Baloro_753 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_FM_SLD_Baloro_753::StaticClass();

}



UCLASS()
class UDailyRoutine_FM_SLD_Baloro_753_Start : UAIState_DailyRoutine_Human
{
    default Schedule(0, 0, UAIState_Sleep(), n"FP_FM_GUARD_18");
    default Schedule(8, 0, UAIState_Eat(), n"FP_FM_GUARD_18");
    default Schedule(8, 30, UAIState_Guard(), n"FP_FM_GUARD_18");
    default Schedule(23, 30, UAIState_Eat(), n"FP_FM_GUARD_18");

    default ScheduleIfRaining(0, 0, UAIState_Sleep(), n"FP_FM_GUARD_06");
    default ScheduleIfRaining(8, 0, UAIState_Eat(), n"FP_FM_GUARD_06");
    default ScheduleIfRaining(8, 30, UAIState_Guard(), n"FP_FM_GUARD_06");
    default ScheduleIfRaining(23, 30, UAIState_Eat(), n"FP_FM_GUARD_06");
}