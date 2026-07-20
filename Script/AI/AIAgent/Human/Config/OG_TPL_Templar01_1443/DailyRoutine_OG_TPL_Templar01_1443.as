UCLASS()
class UAIAgentConfig_Human_OG_TPL_Templar01_1443 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OG_TPL_Templar01_1443::StaticClass();

}



UCLASS()
class UDailyRoutine_OG_TPL_Templar01_1443_Start : UAIState_DailyRoutine_Human
{
    default Schedule(0, 0, UAIState_Guard(), n"FP_ST_TEMPLAR_GUARD_02");
}