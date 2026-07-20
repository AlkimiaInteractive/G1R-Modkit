UCLASS()
class UAIAgentConfig_Human_OG_TPL_Templar02_1444 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OG_TPL_Templar02_1444::StaticClass();

}



UCLASS()
class UDailyRoutine_OG_TPL_Templar02_1444_Start : UAIState_DailyRoutine_Human
{
    default Schedule(0, 0, UAIState_Guard(), n"FP_ST_TEMPLAR_GUARD_03");
}