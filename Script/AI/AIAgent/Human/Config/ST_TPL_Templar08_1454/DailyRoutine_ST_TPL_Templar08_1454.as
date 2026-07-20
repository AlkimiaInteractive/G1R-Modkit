UCLASS()
class UAIAgentConfig_Human_ST_TPL_Templar08_1454 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_ST_TPL_Templar08_1454::StaticClass();

}

UCLASS()
class UDailyRoutine_ST_TPL_Templar08_1454_Start : UAIState_DailyRoutine_Human
{
    default Schedule(0, 0, UAIState_Guard(), n"FP_ST_TEMPLAR_GUARD_08");
}


UCLASS()
class UDailyRoutine_ST_TPL_Templar08_1454_Ot : UAIState_DailyRoutine_Human
{
    default Schedule(9, 0, UAIState_HostileGuard(), n"TPL_327");
    default Schedule(21, 0, UAIState_HostileGuard(), n"TPL_327");
}