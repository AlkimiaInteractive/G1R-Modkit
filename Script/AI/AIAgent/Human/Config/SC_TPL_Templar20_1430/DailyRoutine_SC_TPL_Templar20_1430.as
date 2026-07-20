UCLASS()
class UAIAgentConfig_Human_SC_TPL_Templar20_1430 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_SC_TPL_Templar20_1430::StaticClass();

}



UCLASS()
class UDailyRoutine_SC_TPL_Templar20_1430_Start : UAIState_DailyRoutine_Human
{
    default Schedule(7, 0, UAIState_Eat(), n"FP_SC_GUARD_36");
    default Schedule(7, 30, UAIState_Guard(), n"FP_SC_GUARD_36");
    default Schedule(22, 30, UAIState_Eat(), n"FP_SC_GUARD_36");
    default Schedule(23, 0, UAIState_Sleep(), n"FP_SC_GUARD_36");
}