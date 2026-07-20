UCLASS()
class UAIAgentConfig_Human_SC_NOV_Novice43_1355 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_SC_NOV_Novice43_1355::StaticClass();

}



UCLASS()
class UDailyRoutine_SC_NOV_Novice43_1355_Start : UAIState_DailyRoutine_Human
{
    default Schedule(10, 30, UAIState_Smalltalk(), n"FP_SC_SMALLTALK_14");
    default Schedule(12, 30, UAIState_Smoke_Ground(), n"IO_SC_WATERPIPE_03");
    default Schedule(15, 30, UAIState_Smalltalk(), n"FP_SC_SMALLTALK_14");
    default Schedule(19, 30, UAIState_SitAround(), n"IO_SC_CHAIR_28", 300);
    default Schedule(0, 30, UAIState_Smalltalk(), n"FP_SC_SMALLTALK_14");
    default Schedule(5, 30, UAIState_Smoke_Ground(), n"IO_SC_WATERPIPE_03");
}

UCLASS()
class UDailyRoutine_SC_NOV_Novice43_1355_Ritual : UAIState_DailyRoutine_Human
{
    default Schedule(8, 00, UAIState_StandAround(), n"FP_SC_PROPHECY_31");
    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}

UCLASS()
class UDailyRoutine_SC_NOV_Novice43_1355_AfterRitual : UAIState_DailyRoutine_Human
{
    default Schedule(8, 00, UAIState_StandAround(), n"FP_SC_PROPHECY_31");
    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}

UCLASS()
class UDailyRoutine_SC_NOV_Novice43_1355_AfterTalkingToAngar : UAIState_DailyRoutine_Human
{
    default Schedule(8, 00, UAIState_Listen(), n"FP_SC_PROPHECY_45");
    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}