UCLASS()
class UAIAgentConfig_Human_ST_TPL_Templar03_1449 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_ST_TPL_Templar03_1449::StaticClass();

}

UCLASS()
class UDailyRoutine_ST_TPL_Templar03_1449_Start : UAIState_DailyRoutine_Human
{
   default Schedule(0, 0, UAIState_HostileGuard(), n"TPL_408");
    default Schedule(12, 0, UAIState_HostileGuard(), n"TPL_408");
}


UCLASS()
class UDailyRoutine_ST_TPL_Templar03_1449_Ot : UAIState_DailyRoutine_Human
{
    default Schedule(0, 0, UAIState_HostileGuard(), n"TPL_310");
    default Schedule(12, 0, UAIState_HostileGuard(), n"TPL_310");
}