UCLASS()
class UAIAgentConfig_Human_SC_TPL_Templar03_1407 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_SC_TPL_Templar03_1407::StaticClass();

}



UCLASS()
class UDailyRoutine_SC_TPL_Templar03_1407_Start : UAIState_DailyRoutine_Human
{
    default Schedule(0, 0, UAIState_Sleep(), n"FP_SC_GUARD_29");
    default Schedule(5, 0, UAIState_Eat(), n"FP_SC_GUARD_29", 500);
    default Schedule(6, 30, UAIState_GuardAndSmallTalk(n"FP_SC_SMALLTALK_06"), n"FP_SC_GUARD_29");
    default Schedule(20, 0, UAIState_Eat(), n"FP_SC_GUARD_29", 500);
    default Schedule(21, 0, UAIState_GuardAndSmallTalk(n"FP_SC_SMALLTALK_06"), n"FP_SC_GUARD_29");
}

