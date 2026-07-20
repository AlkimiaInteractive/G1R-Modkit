UCLASS()
class UAIAgentConfig_Human_ST_TPL_Templar10_1457 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_ST_TPL_Templar10_1457::StaticClass();

}

UCLASS()
class UDailyRoutine_ST_TPL_Templar10_1457_Start : UAIState_DailyRoutine_Human
{
    default Schedule(0, 0, UAIState_Guard(), n"FP_ST_TEMPLAR_GUARD_10");
}


UCLASS()
class UDailyRoutine_ST_TPL_Templar10_1457_Ot : UAIState_DailyRoutine_Human
{
    default Schedule(9, 0, UAIState_HostileGuard(), n"TPL_266");
    default Schedule(21, 0, UAIState_HostileGuard(), n"TPL_266");
}