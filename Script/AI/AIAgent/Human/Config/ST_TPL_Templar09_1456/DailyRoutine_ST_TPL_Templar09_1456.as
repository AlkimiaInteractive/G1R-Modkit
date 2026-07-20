UCLASS()
class UAIAgentConfig_Human_ST_TPL_Templar09_1456 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_ST_TPL_Templar09_1456::StaticClass();

}

UCLASS()
class UDailyRoutine_ST_TPL_Templar09_1456_Start : UAIState_DailyRoutine_Human
{
    default Schedule(0, 0, UAIState_Guard(), n"FP_ST_TEMPLAR_GUARD_09");
}


UCLASS()
class UDailyRoutine_ST_TPL_Templar09_1456_Ot : UAIState_DailyRoutine_Human
{
    default Schedule(9, 0, UAIState_HostileGuard(), n"TPL_292");
    default Schedule(21, 0, UAIState_HostileGuard(), n"TPL_292");
}