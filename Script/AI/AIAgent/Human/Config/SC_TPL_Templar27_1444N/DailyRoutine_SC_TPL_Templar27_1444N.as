UCLASS()
class UAIAgentConfig_Human_SC_TPL_Templar27_1444N : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_SC_TPL_Templar27_1444N::StaticClass();

}

UCLASS()
class UDailyRoutine_SC_TPL_Templar27_1444N_Start : UAIState_DailyRoutine_Human
{
    default Schedule(0, 0, UAIState_Guard(), n"FP_OG_GUARD_7");
}