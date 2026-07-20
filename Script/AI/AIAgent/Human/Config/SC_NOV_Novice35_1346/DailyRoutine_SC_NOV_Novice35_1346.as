UCLASS()
class UAIAgentConfig_Human_SC_NOV_Novice35_1346 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_SC_NOV_Novice35_1346::StaticClass();

}



UCLASS()
class UDailyRoutine_SC_NOV_Novice35_1346_Start : UAIState_DailyRoutine_Human
{
    default Schedule(22, 30, UAIState_Smalltalk(), n"FP_SC_SMALLTALK_18");

    default ScheduleIfRaining(22, 30, UAIState_Smalltalk(), n"FP_SC_SMALLTALK_24");
}

UCLASS()
class UDailyRoutine_SC_NOV_Novice35_1346_Ritual : UAIState_DailyRoutine_Human
{
    default Schedule(8, 00, UAIState_StandAround(), n"FP_SC_PROPHECY_10");
    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}

UCLASS()
class UDailyRoutine_SC_NOV_Novice35_1346_AfterRitual : UAIState_DailyRoutine_Human
{
    default Schedule(22, 30, UAIState_Smalltalk(), n"FP_SC_SMALLTALK_18");

    default ScheduleIfRaining(22, 30, UAIState_Smalltalk(), n"FP_SC_SMALLTALK_24");
    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}