UCLASS()
class UAIAgentConfig_Human_SC_TPL_Templar17_1423 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_SC_TPL_Templar17_1423::StaticClass();

}



UCLASS()
class UDailyRoutine_SC_TPL_Templar17_1423_Start : UAIState_DailyRoutine_Human
{
    default Schedule(0, 0, UAIState_Sleep(), n"FP_SC_GUARD_19");
    default Schedule(5, 0, UAIState_Eat(), n"FP_SC_GUARD_19");
    default Schedule(6, 30, UAIState_GuardAndSmallTalk(n"FP_SC_SMALLTALK_28"), n"FP_SC_GUARD_19");
    default Schedule(20, 0, UAIState_Eat(), n"FP_SC_GUARD_19");
    default Schedule(21, 0, UAIState_GuardAndSmallTalk(n"FP_SC_SMALLTALK_28"), n"FP_SC_GUARD_19");
}