UCLASS()
class UAIAgentConfig_Human_SC_TPL_Templar16_1420 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_SC_TPL_Templar16_1420::StaticClass();

}



UCLASS()
class UDailyRoutine_SC_TPL_Templar16_1420_Start : UAIState_DailyRoutine_Human
{
    default Schedule(7, 0, UAIState_Eat(), n"FP_SC_GUARD_35",1750.0f);
    default Schedule(7, 30, UAIState_Guard(), n"FP_SC_GUARD_38",1750.0f);
    default Schedule(22, 30, UAIState_Eat(), n"FP_SC_GUARD_35",1750.0f);
    default Schedule(23, 0, UAIState_Sleep(), n"FP_SC_GUARD_38",1750.0f);
}