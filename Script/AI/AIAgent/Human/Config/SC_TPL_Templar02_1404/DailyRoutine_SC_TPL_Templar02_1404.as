UCLASS()
class UAIAgentConfig_Human_SC_TPL_Templar02_1404 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_SC_TPL_Templar02_1404::StaticClass();

}



UCLASS()
class UDailyRoutine_SC_TPL_Templar02_1404_Start : UAIState_DailyRoutine_Human
{
    default Schedule(7, 0, UAIState_Eat(), n"FP_SC_GUARD_28");
    default Schedule(7, 30, UAIState_Guard(), n"FP_SC_GUARD_28");
    default Schedule(22, 30, UAIState_Eat(), n"FP_SC_GUARD_28");
    default Schedule(23, 0, UAIState_Sleep(), n"FP_SC_GUARD_28");

    default ScheduleIfRaining(7, 0, UAIState_Eat(), n"FP_SC_GUARD_44");
    default ScheduleIfRaining(7, 30, UAIState_Guard(), n"FP_SC_GUARD_44");
    default ScheduleIfRaining(22, 30, UAIState_Eat(), n"FP_SC_GUARD_44");
    default ScheduleIfRaining(23, 0, UAIState_Sleep(), n"FP_SC_GUARD_44");
}