UCLASS()
class UAIAgentConfig_Human_FM_SLD_Mercenary11_763 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_FM_SLD_Mercenary11_763::StaticClass();

}



UCLASS()
class UDailyRoutine_FM_SLD_Mercenary11_763_Start : UAIState_DailyRoutine_Human
{
    default Schedule(0, 0, UAIState_Sleep(), n"FP_FM_GUARD_14",2000);
    default Schedule(8, 0, UAIState_Eat(), n"IO_FM_CHAIR_BENCH_03");
    default Schedule(8, 30, UAIState_GuardPatrol(), n"FP_FM_GUARD_14",2000);
    default Schedule(23, 30, UAIState_Eat(), n"IO_FM_CHAIR_BENCH_03");

    default ScheduleIfRaining(0, 0, UAIState_Sleep(), n"FP_FM_GUARD_42",200);
    default ScheduleIfRaining(0, 0, UAIState_GuardPatrol(), n"FP_FM_GUARD_42",200);
}