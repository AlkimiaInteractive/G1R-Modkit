UCLASS()
class UAIAgentConfig_Human_OM_VLK_Digger38_1053N : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OM_VLK_Digger38_1053N::StaticClass();

}



UCLASS()
class UDailyRoutine_OM_VLK_Digger38_1053N_Start : UAIState_DailyRoutine_Human
{
    default Schedule(6, 0, UAIState_Rest(), n"FP_OM_REST_01");

    default ScheduleIfRaining(6, 0, UAIState_SitAround(), n"IO_OM_CHAIR_BENCH_04");
}

UCLASS()
class UDailyRoutine_OM_VLK_Digger38_1053N_Collapsed : UAIState_DailyRoutine_Human
{
    default Schedule(6, 0, UAIState_SitAround(), n"IO_OM_CHAIR_BENCH_04");

    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}