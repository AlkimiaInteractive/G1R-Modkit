UCLASS()
class UAIAgentConfig_Human_FM_SLD_Okyl_752 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_FM_SLD_Okyl_752::StaticClass();

}



UCLASS()
class UDailyRoutine_FM_SLD_Okyl_752_Start : UAIState_DailyRoutine_Human
{
    default Schedule(0, 0, UAIState_Sleep(), n"FP_FM_GUARD_17", 100);
    default Schedule(8, 0, UAIState_Eat(), n"FP_FM_GUARD_17", 100);
    default Schedule(8, 40, UAIState_Guard(), n"FP_FM_GUARD_46", 100);
    default Schedule(12, 30, UAIState_Smoke(), n"FP_FM_GUARD_46", 100);
    default Schedule(16, 30, UAIState_StandAround(), n"FP_FM_GUARD_46", 200);
    default Schedule(17, 40, UAIState_Guard(), n"FP_FM_GUARD_46", 100);
    default Schedule(22, 0, UAIState_Eat(), n"FP_FM_GUARD_17", 100);
    default Schedule(23, 30, UAIState_Smoke(), n"FP_FM_GUARD_46", 100);
}