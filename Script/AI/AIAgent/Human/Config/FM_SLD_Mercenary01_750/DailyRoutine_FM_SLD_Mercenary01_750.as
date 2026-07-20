UCLASS()
class UAIAgentConfig_Human_FM_SLD_Mercenary01_750 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_FM_SLD_Mercenary01_750::StaticClass();

}



UCLASS()
class UDailyRoutine_FM_SLD_Mercenary01_750_Start : UAIState_DailyRoutine_Human
{
    default Schedule(0, 0, UAIState_Sleep(), n"FP_FM_GUARD_05",3000);
    default Schedule(8, 0, UAIState_Eat(), n"FP_FM_GUARD_05",3000);
    default Schedule(8, 30, UAIState_GuardPatrol(), n"FP_FM_GUARD_05",3000);
    default Schedule(23, 30, UAIState_Eat(), n"FP_FM_GUARD_05",3000);

    default ScheduleIfRaining(0, 0, UAIState_Sleep(), n"FP_FM_GUARD_37",3000);
    default ScheduleIfRaining(8, 0, UAIState_Eat(), n"FP_FM_GUARD_37",3000);
    default ScheduleIfRaining(8, 30, UAIState_GuardPatrol(), n"FP_FM_GUARD_37",3000);
    default ScheduleIfRaining(23, 30, UAIState_Eat(), n"FP_FM_GUARD_37",3000);
}