UCLASS()
class UAIAgentConfig_Human_SC_NOV_Novice36_1347 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_SC_NOV_Novice36_1347::StaticClass();

}



UCLASS()
class UDailyRoutine_SC_NOV_Novice36_1347_Start : UAIState_DailyRoutine_Human
{
    default Schedule(22, 30, UAIState_Smalltalk(), n"FP_SC_SMALLTALK_02");

    default ScheduleIfRaining(22, 30, UAIState_Smalltalk(), n"FP_SC_SMALLTALK_07");
}

UCLASS()
class UDailyRoutine_SC_NOV_Novice36_1347_Ritual : UAIState_DailyRoutine_Human
{
    default Schedule(8, 00, UAIState_StandAround(), n"FP_SC_PROPHECY_5");
    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}
