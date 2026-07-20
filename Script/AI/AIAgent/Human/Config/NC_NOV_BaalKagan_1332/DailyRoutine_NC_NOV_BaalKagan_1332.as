UCLASS()
class UAIAgentConfig_Human_NC_NOV_BaalKagan_1332: UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_NC_NOV_BaalKagan_1332::StaticClass();

}



UCLASS()
class UDailyRoutine_NC_NOV_BaalKagan_1332_Start : UAIState_DailyRoutine_Human
{
    default Schedule(0, 0, UAIState_StandAround(), n"FP_NC_CAMPFIRE_01",150);
    default Schedule(7, 0, UAIState_Eat(), n"IO_NC_CHAIR_BENCH_46");
    default Schedule(8, 30, UAIState_Smoke_Seated(), n"IO_NC_CHAIR_BENCH_46");
    default Schedule(12, 56, UAIState_Eat(), n"IO_NC_CHAIR_BENCH_46");
    default Schedule(13, 56, UAIState_Smoke_Seated(), n"IO_NC_CHAIR_BENCH_46");
    default Schedule(21, 30, UAIState_Eat(), n"IO_NC_CHAIR_BENCH_46");
    default Schedule(22, 30, UAIState_Smoke_Seated(), n"IO_NC_CHAIR_BENCH_46");
}

