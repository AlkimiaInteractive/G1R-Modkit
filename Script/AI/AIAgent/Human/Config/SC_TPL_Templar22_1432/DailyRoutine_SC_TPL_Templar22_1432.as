UCLASS()
class UAIAgentConfig_Human_SC_TPL_Templar22_1432 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_SC_TPL_Templar22_1432::StaticClass();

}



UCLASS()
class UDailyRoutine_SC_TPL_Templar22_1432_Start : UAIState_DailyRoutine_Human
{
    default Schedule(7, 0, UAIState_Eat(), n"FP_SC_GUARD_25");
    default Schedule(7, 30, UAIState_Guard(), n"FP_SC_GUARD_25");
    default Schedule(22, 30, UAIState_Eat(), n"FP_SC_GUARD_25");
    default Schedule(23, 0, UAIState_Sleep(), n"FP_SC_GUARD_25");
}

UCLASS()
class UDailyRoutine_SC_TPL_Templar22_1432_AfterRitual : UAIState_DailyRoutine_Human
{
    default Schedule(8, 00, UAIState_CalmPeople(), n"FP_SC_GUARD_25");
    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}