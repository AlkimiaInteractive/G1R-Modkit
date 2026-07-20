UCLASS()
class UAIAgentConfig_Human_ST_TPL_Templar01_1447 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_ST_TPL_Templar01_1447::StaticClass();

}

UCLASS()
class UDailyRoutine_ST_TPL_Templar01_1447_Start : UAIState_DailyRoutine_Human
{
    default Schedule(0, 0, UAIState_HostileGuard(), n"TPL_408");
    default Schedule(21, 0, UAIState_HostileGuard(), n"TPL_408");
}


UCLASS()
class UDailyRoutine_ST_TPL_Templar01_1447_Ot : UAIState_DailyRoutine_Human
{
    default Schedule(0, 0, UAIState_HostileGuard(), n"TPL_139");
    default Schedule(21, 0, UAIState_HostileGuard(), n"TPL_139");
}