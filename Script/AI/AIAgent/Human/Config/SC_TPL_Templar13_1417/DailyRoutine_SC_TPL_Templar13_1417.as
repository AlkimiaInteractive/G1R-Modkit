UCLASS()
class UAIAgentConfig_Human_SC_TPL_Templar13_1417 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_SC_TPL_Templar13_1417::StaticClass();

}



UCLASS()
class UDailyRoutine_SC_TPL_Templar13_1417_Start : UAIState_DailyRoutine_Human
{
    default Schedule(7, 0, UAIState_Eat(), n"FP_SC_GUARD_15",1750.0f);
    default Schedule(7, 30, UAIState_Guard(), n"FP_SC_GUARD_16",1750.0f);
    default Schedule(22, 30, UAIState_Eat(), n"FP_SC_GUARD_15",1750.0f);
    default Schedule(23, 0, UAIState_Sleep(), n"FP_SC_GUARD_23",1750.0f);
}