UCLASS()
class UAIAgentConfig_Human_ST_TPL_Templar05_1451 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_ST_TPL_Templar05_1451::StaticClass();

}

UCLASS()
class UDailyRoutine_ST_TPL_Templar05_1451_Start : UAIState_DailyRoutine_Human
{
    default Schedule(0, 0, UAIState_Guard(), n"FP_ST_TEMPLAR_GUARD_06");
}


UCLASS()
class UDailyRoutine_ST_TPL_Templar05_1451_Ot : UAIState_DailyRoutine_Human
{
    default Schedule(0, 0, UAIState_HostileGuard(), n"TPL_382");
    default Schedule(21, 0, UAIState_HostileGuard(), n"TPL_382");
}