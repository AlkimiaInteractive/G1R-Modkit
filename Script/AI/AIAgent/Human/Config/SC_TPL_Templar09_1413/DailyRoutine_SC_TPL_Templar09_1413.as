UCLASS()
class UAIAgentConfig_Human_SC_TPL_Templar09_1413 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_SC_TPL_Templar09_1413::StaticClass();

}



UCLASS()
class UDailyRoutine_SC_TPL_Templar09_1413_Start : UAIState_DailyRoutine_Human
{
    default Schedule(7, 0, UAIState_Eat(), n"FP_SC_GUARD_04");
    default Schedule(7, 30, UAIState_Guard(), n"FP_SC_GUARD_04");
    default Schedule(22, 30, UAIState_Eat(), n"FP_SC_GUARD_04");
    default Schedule(23, 0, UAIState_Sleep(), n"FP_SC_GUARD_04");
}

UCLASS()
class UDailyRoutine_SC_TPL_Templar09_1413_AfterRitual : UAIState_DailyRoutine_Human
{
    default Schedule(8, 00, UAIState_CalmPeople(), n"FP_SC_GUARD_04");
    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}