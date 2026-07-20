UCLASS()
class UAIAgentConfig_Human_ST_TPL_Templar02_1448 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_ST_TPL_Templar02_1448::StaticClass();

}

UCLASS()
class UDailyRoutine_ST_TPL_Templar02_1448_Start : UAIState_DailyRoutine_Human
{
    default Schedule(0, 0, UAIState_HostileGuard(), n"TPL_408");
    default Schedule(8, 0, UAIState_HostileGuard(), n"TPL_408");
}


UCLASS()
class UDailyRoutine_ST_TPL_Templar02_1448_Ot : UAIState_DailyRoutine_Human
{
    default Schedule(0, 0, UAIState_HostileGuard(), n"TPL_152");
    default Schedule(8, 0, UAIState_HostileGuard(), n"TPL_152");
}