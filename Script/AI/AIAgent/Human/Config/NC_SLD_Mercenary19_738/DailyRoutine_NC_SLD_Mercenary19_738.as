UCLASS()
class UAIAgentConfig_Human_NC_SLD_Mercenary19_738 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_NC_SLD_Mercenary19_738::StaticClass();

}



UCLASS()
class UDailyRoutine_NC_SLD_Mercenary19_738_Start : UAIState_DailyRoutine_Human
{
    // default Schedule(0, 0, UAIState_Sleep(), n"FP_NC_GUARD_15");
    // default Schedule(8, 0, UAIState_Eat(), n"FP_NC_GUARD_15");
    // default Schedule(8, 30, UAIState_Guard(), n"FP_NC_GUARD_15");
    // default Schedule(23, 30, UAIState_Eat(), n"FP_NC_GUARD_15");

    // default ScheduleIfRaining(8, 30, UAIState_Guard(), n"FP_NC_GUARD_01");
    // default ScheduleIfRaining(23, 30, UAIState_Eat(), n"FP_NC_GUARD_01");

    default Schedule(0, 0, UAIState_EnsureGateIsOpened(n"Interactive_Winch769879"), n"Interactive_Winch769879");
}