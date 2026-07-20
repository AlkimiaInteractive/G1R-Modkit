UCLASS()
class UAIAgentConfig_Human_OM_VLK_Digger39_1054N : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OM_VLK_Digger39_1054N::StaticClass();

}



UCLASS()
class UDailyRoutine_OM_VLK_Digger39_1054N_Start : UAIState_DailyRoutine_Human
{
    default Schedule(6, 0, UAIState_Rest(), n"FP_OM_REST_03");

    default ScheduleIfRaining(6, 0, UAIState_SitAround(), n"IO_OM_CHAIR_03");
}

UCLASS()
class UDailyRoutine_OM_VLK_Digger39_1054N_Collapsed : UAIState_DailyRoutine_Human
{
    default Schedule(6, 0, UAIState_SitAround(), n"IO_OM_CHAIR_BENCH_03");

    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}