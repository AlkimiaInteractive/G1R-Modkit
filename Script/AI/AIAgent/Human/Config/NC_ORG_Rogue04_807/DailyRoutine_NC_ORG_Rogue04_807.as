UCLASS()
class UAIAgentConfig_Human_NC_ORG_Rogue04_807 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_NC_ORG_Rogue04_807::StaticClass();

}



UCLASS()
class UDailyRoutine_NC_ORG_Rogue04_807_Start : UAIState_DailyRoutine_Human
{
    default Schedule(0, 0, UAIState_Sleep_Seated(), n"IO_NC_CHAIR_BENCH_11", 500);
    default Schedule(8, 0, UAIState_Sit(), n"IO_NC_CHAIR_BENCH_11", 500);
    default Schedule(12, 56, UAIState_Sit(), n"IO_NC_CHAIR_BENCH_11", 500);
    default Schedule(21, 30, UAIState_Sit(), n"IO_NC_CHAIR_BENCH_11", 500);
}

UCLASS()
class UDailyRoutine_NC_ORG_Rogue04_807_WaitFM : UAIState_DailyRoutine_Human
{
    default Schedule(0, 0, UAIState_StandAround(), n"FP_FM_STAND_ROGUE04", 500);
    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}
