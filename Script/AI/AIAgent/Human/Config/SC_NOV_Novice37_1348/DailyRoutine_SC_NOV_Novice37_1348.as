UCLASS()
class UAIAgentConfig_Human_SC_NOV_Novice37_1348 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_SC_NOV_Novice37_1348::StaticClass();

}



UCLASS()
class UDailyRoutine_SC_NOV_Novice37_1348_Start : UAIState_DailyRoutine_Human
{
    default Schedule(22, 30, UAIState_Smalltalk(), n"FP_SC_SMALLTALK_19");

    default ScheduleIfRaining(22, 30, UAIState_Smalltalk(), n"FP_SC_SMALLTALK_25");
}

UCLASS()
class UDailyRoutine_SC_NOV_Novice37_1348_Ritual : UAIState_DailyRoutine_Human
{
    default Schedule(8, 00, UAIState_StandAround(), n"FP_SC_PROPHECY_END_7");
    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}

UCLASS()
class UDailyRoutine_SC_NOV_Novice37_1348_AfterRitual : UAIState_DailyRoutine_Human
{
    default Schedule(8, 00, UAIState_Drained(), n"FP_SC_PROPHECY_END_7");
    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}