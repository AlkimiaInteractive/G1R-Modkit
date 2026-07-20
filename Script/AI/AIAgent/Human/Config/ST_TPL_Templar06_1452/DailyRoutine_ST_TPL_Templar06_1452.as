UCLASS()
class UAIAgentConfig_Human_ST_TPL_Templar06_1452 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_ST_TPL_Templar06_1452::StaticClass();

}

UCLASS()
class UDailyRoutine_ST_TPL_Templar06_1452_Start : UAIState_DailyRoutine_Human
{
    default Schedule(0, 0, UAIState_Guard(), n"FP_ST_TEMPLAR_GUARD_07");
}


UCLASS()
class UDailyRoutine_ST_TPL_Templar06_1452_Ot : UAIState_DailyRoutine_Human
{
    default Schedule(8, 0, UAIState_HostileGuard(), n"TPL_379");
    default Schedule(22, 0, UAIState_HostileGuard(), n"TPL_379");
}