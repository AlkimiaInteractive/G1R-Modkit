UCLASS()
class UAIAgentConfig_Human_ST_TPL_Templar13_1460 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_ST_TPL_Templar13_1460::StaticClass();

}

UCLASS()
class UDailyRoutine_ST_TPL_Templar13_1460_Start : UAIState_DailyRoutine_Human
{
    default Schedule(0, 0, UAIState_HostileGuard(), n"FP_ST_TEMPLAR03_GUARD_13");
}


UCLASS()
class UDailyRoutine_ST_TPL_Templar13_1460_Ot : UAIState_DailyRoutine_Human
{
    default Schedule(9, 0, UAIState_HostileGuard(), n"TPL_256");
    default Schedule(21, 0, UAIState_HostileGuard(), n"TPL_256");
}