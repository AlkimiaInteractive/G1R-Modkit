UCLASS()
class UAIAgentConfig_Human_ST_TPL_GorBoba_1455 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_ST_TPL_GorBoba_1455::StaticClass();

}

UCLASS()
class UDailyRoutine_ST_TPL_GorBoba_1455_Start : UAIState_DailyRoutine_Human
{
    default Schedule(0, 0, UAIState_Guard(), n"FP_ST_TEMPLAR_GUARD_01");
}


UCLASS()
class UDailyRoutine_ST_TPL_GorBoba_1455_Ot : UAIState_DailyRoutine_Human
{
    default Schedule(9, 0, UAIState_AlignGuard(), n"TPL_110");
    default Schedule(21, 0, UAIState_AlignGuard(), n"TPL_110");
}