UCLASS()
class UAIAgentConfig_Human_SC_NOV_Novice09_1316 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_SC_NOV_Novice09_1316::StaticClass();

}

UCLASS()
class UDailyRoutine_SC_NOV_Novice09_1316_Start : UAIState_DailyRoutine_Human
{
    default Schedule(7, 25, UAIState_Eat(), n"IO_SC_CHAIR_8");
    default Schedule(8, 10, UAIState_Smith_Anvil_Spawn(), n"IO_SC_ANVIL_2",100);
    default Schedule(12, 56, UAIState_Eat(), n"IO_SC_CHAIR_8");
    default Schedule(13, 56, UAIState_Smith_Anvil_Spawn(), n"IO_SC_ANVIL_2",100);
    default Schedule(21, 30, UAIState_Eat(), n"IO_SC_CHAIR_8");
    default Schedule(22, 30, UAIState_Smith_Anvil_Spawn(), n"IO_SC_ANVIL_2");
    default Schedule(23, 50, UAIState_Sleep_Seated(), n"IO_SC_CHAIR_8");
}

UCLASS()
class UDailyRoutine_SC_NOV_Novice09_1316_ScNew : UAIState_DailyRoutine_Human
{
    default Schedule(8, 31, UAIState_StandAround(), n"FP_SC_LEAN_STORY_NOVICE10");
    default Schedule(12, 10, UAIState_Smoke(), n"FP_SC_SMOKE_STORY_NOVICE09",100);
    default Schedule(15, 30, UAIState_Eat(), n"IO_SC_CHAIR_8");
    default Schedule(17, 31, UAIState_StandAround(), n"FP_SC_LEAN_STORY_NOVICE10");
    default Schedule(20, 10, UAIState_Smoke(), n"FP_SC_SMOKE_STORY_NOVICE09",100);
    default Schedule(23, 50, UAIState_Sleep_Seated(), n"IO_SC_CHAIR_8");
}

UCLASS()
class UDailyRoutine_SC_NOV_Novice09_1316_Ritual : UAIState_DailyRoutine_Human
{
    default Schedule(8, 00, UAIState_StandAround(), n"FP_SC_PROPHECY_35");
    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}