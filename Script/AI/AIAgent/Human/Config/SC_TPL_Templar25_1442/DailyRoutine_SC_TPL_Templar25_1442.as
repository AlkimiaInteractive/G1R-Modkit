UCLASS()
class UAIAgentConfig_Human_SC_TPL_Templar25_1442 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_SC_TPL_Templar25_1442::StaticClass();

}



UCLASS()
class UDailyRoutine_SC_TPL_Templar25_1442_Start : UAIState_DailyRoutine_Human
{
    default Schedule(7, 0, UAIState_Eat(), n"FP_SC_GUARD_09");
    default Schedule(7, 30, UAIState_Guard(), n"FP_SC_GUARD_09");
    default Schedule(22, 30, UAIState_Eat(), n"FP_SC_GUARD_09");
    default Schedule(23, 0, UAIState_Sleep(), n"FP_SC_GUARD_09");
}