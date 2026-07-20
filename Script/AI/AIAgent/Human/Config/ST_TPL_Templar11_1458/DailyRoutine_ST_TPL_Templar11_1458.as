UCLASS()
class UAIAgentConfig_Human_ST_TPL_Templar11_1458 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_ST_TPL_Templar11_1458::StaticClass();

}

UCLASS()
class UDailyRoutine_ST_TPL_Templar11_1458_Start : UAIState_DailyRoutine_Human
{
    default Schedule(0, 0, UAIState_Guard(), n"FP_ST_TEMPLAR03_GUARD_11");
}


UCLASS()
class UDailyRoutine_ST_TPL_Templar11_1458_Ot : UAIState_DailyRoutine_Human
{
    default Schedule(9, 0, UAIState_HostileGuard(), n"TPL_263");
    default Schedule(21, 0, UAIState_HostileGuard(), n"TPL_263");
}