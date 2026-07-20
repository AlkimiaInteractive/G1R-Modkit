UCLASS()
class UAIAgentConfig_Human_ST_TPL_Templar04_1450 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_ST_TPL_Templar04_1450::StaticClass();

}

UCLASS()
class UDailyRoutine_ST_TPL_Templar04_1450_Start : UAIState_DailyRoutine_Human
{
    default Schedule(0, 0, UAIState_Guard(), n"FP_ST_TEMPLAR_GUARD_05");
}


UCLASS()
class UDailyRoutine_ST_TPL_Templar04_1450_Ot : UAIState_DailyRoutine_Human
{
    default Schedule(0, 0, UAIState_HostileGuard(), n"TPL_348");
    default Schedule(8, 0, UAIState_HostileGuard(), n"TPL_348");
}