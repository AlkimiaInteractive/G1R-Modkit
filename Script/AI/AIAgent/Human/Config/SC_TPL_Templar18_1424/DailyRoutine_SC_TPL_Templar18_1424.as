UCLASS()
class UAIAgentConfig_Human_SC_TPL_Templar18_1424 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_SC_TPL_Templar18_1424::StaticClass();

}



UCLASS()
class UDailyRoutine_SC_TPL_Templar18_1424_Start : UAIState_DailyRoutine_Human
{
    default Schedule(0, 0, UAIState_Sleep(), n"FP_SC_GUARD_05",150.0f);
    default Schedule(5, 0, UAIState_Eat(), n"FP_SC_GUARD_05",150.0f);
    default Schedule(6, 30, UAIState_GuardAndSmallTalk(n"FP_SC_SMALLTALK_08"), n"FP_SC_GUARD_05",150.0f);
    default Schedule(20, 0, UAIState_Eat(), n"FP_SC_GUARD_05",150.0f);
    default Schedule(21, 0, UAIState_GuardAndSmallTalk(n"FP_SC_SMALLTALK_08"), n"FP_SC_GUARD_05",150.0f);
}