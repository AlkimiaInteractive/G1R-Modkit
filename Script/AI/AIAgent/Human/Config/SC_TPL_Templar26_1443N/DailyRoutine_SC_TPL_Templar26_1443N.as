UCLASS()
class UAIAgentConfig_Human_SC_TPL_Templar26_1443N : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_SC_TPL_Templar26_1443N::StaticClass();

}

UCLASS()
class UDailyRoutine_SC_TPL_Templar26_1443N_Start : UAIState_DailyRoutine_Human
{
    default Schedule(0, 0, UAIState_Guard(), n"FP_OG_GUARD_6");
}