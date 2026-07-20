UCLASS()
class UAIAgentConfig_Human_SC_TPL_Templar24_1441 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_SC_TPL_Templar24_1441::StaticClass();

}



UCLASS()
class UDailyRoutine_SC_TPL_Templar24_1441_Start : UAIState_DailyRoutine_Human
{
    default Schedule(7, 0, UAIState_Eat(), n"FP_SC_GUARD_08");
    default Schedule(7, 30, UAIState_Guard(), n"FP_SC_GUARD_08");
    default Schedule(22, 30, UAIState_Eat(), n"FP_SC_GUARD_08");
    default Schedule(23, 0, UAIState_Sleep(), n"FP_SC_GUARD_08");
}