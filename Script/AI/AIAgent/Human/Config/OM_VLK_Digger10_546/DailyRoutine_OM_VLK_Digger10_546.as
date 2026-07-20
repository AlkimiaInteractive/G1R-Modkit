UCLASS()
class UAIAgentConfig_Human_OM_VLK_Digger10_546 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OM_VLK_Digger10_546::StaticClass();

}



UCLASS()
class UDailyRoutine_OM_VLK_Digger10_546_Start : UAIState_DailyRoutine_Human
{
    default Schedule(23, 0, UAIState_PickOre(), n"IO_OM_PICKORE_03");
}

UCLASS()
class UDailyRoutine_OM_VLK_Digger10_546_Collapsed : UAIState_DailyRoutine_Human
{
    default Schedule(23, 0, UAIState_SitAround(), n"IO_OM_CHAIR_BENCH_01");
    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}