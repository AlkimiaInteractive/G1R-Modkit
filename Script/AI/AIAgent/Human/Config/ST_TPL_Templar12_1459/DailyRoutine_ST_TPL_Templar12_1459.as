UCLASS()
class UAIAgentConfig_Human_ST_TPL_Templar12_1459 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_ST_TPL_Templar12_1459::StaticClass();

}

UCLASS()
class UDailyRoutine_ST_TPL_Templar12_1459_Start : UAIState_DailyRoutine_Human
{
    default Schedule(0, 0, UAIState_Guard(), n"FP_ST_TEMPLAR03_GUARD_12");
}


UCLASS()
class UDailyRoutine_ST_TPL_Templar12_1459_Ot : UAIState_DailyRoutine_Human
{
    default Schedule(9, 0, UAIState_HostileGuard(), n"TPL_259");
    default Schedule(21, 0, UAIState_HostileGuard(), n"TPL_259");
}