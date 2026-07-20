UCLASS()
class UAIAgentConfig_Human_SC_NOV_Novice38_1349 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_SC_NOV_Novice38_1349::StaticClass();

}



UCLASS()
class UDailyRoutine_SC_NOV_Novice38_1349_Start : UAIState_DailyRoutine_Human
{
    default Schedule(22, 30, UAIState_Smalltalk(), n"FP_SC_SMALLTALK_03");

    default ScheduleIfRaining(22, 30, UAIState_Smalltalk(), n"FP_SC_SMALLTALK_11");
}

UCLASS()
class UDailyRoutine_SC_NOV_Novice38_1349_Ritual : UAIState_DailyRoutine_Human
{
    default Schedule(8, 00, UAIState_StandAround(), n"FP_SC_PROPHECY_6");
    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}

UCLASS()
class UDailyRoutine_SC_NOV_Novice38_1349_AfterRitual : UAIState_DailyRoutine_Human
{
    default Schedule(8, 00, UAIState_Shout(), n"FP_SC_PROPHECY_6");
    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}
