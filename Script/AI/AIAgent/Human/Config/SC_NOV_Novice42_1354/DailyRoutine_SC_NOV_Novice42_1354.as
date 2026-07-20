UCLASS()
class UAIAgentConfig_Human_SC_NOV_Novice42_1354 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_SC_NOV_Novice42_1354::StaticClass();

}



UCLASS()
class UDailyRoutine_SC_NOV_Novice42_1354_Start : UAIState_DailyRoutine_Human
{
    default Schedule(10, 30, UAIState_Smalltalk(), n"FP_SC_SMALLTALK_27");
    default Schedule(12, 30, UAIState_SitAround(), n"IO_SC_CHAIR_28", 300);
    default Schedule(15, 30, UAIState_Smalltalk(), n"FP_SC_SMALLTALK_27");
    default Schedule(19, 30, UAIState_Smoke_Ground(), n"IO_SC_WATERPIPE_03");
    default Schedule(0, 30, UAIState_Smalltalk(), n"FP_SC_SMALLTALK_27");
    default Schedule(5, 30, UAIState_Sleep_Seated(), n"IO_SC_CHAIR_28", 300);
}

UCLASS()
class UDailyRoutine_SC_NOV_Novice42_1354_Ritual : UAIState_DailyRoutine_Human
{
    default Schedule(8, 00, UAIState_StandAround(), n"FP_SC_PROPHECY_26");
    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}