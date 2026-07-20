UCLASS()
class UAIAgentConfig_Human_OM_VLK_Digger23_579 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OM_VLK_Digger23_579::StaticClass();

}



UCLASS()
class UDailyRoutine_OM_VLK_Digger23_579_Start : UAIState_DailyRoutine_Human
{
    default Schedule(4, 0, UAIState_Eat(), n"FP_OM_REST_05");
    default Schedule(5, 0, UAIState_PickOre(), n"IO_OM_PICKORE_02");
    default Schedule(15, 0, UAIState_Rest(), n"FP_OM_REST_05");
    default Schedule(16, 0, UAIState_PickOre(), n"IO_OM_PICKORE_02");
}

UCLASS()
class UDailyRoutine_OM_VLK_Digger23_579_Collapsed : UAIState_DailyRoutine_Human
{
    default Schedule(10, 40, UAIState_Wounded(), n"FP_OM_FL_WOUNDED_05");
    default Schedule(13, 40, UAIState_SitAround(), n"FP_OM_FL_WOUNDED_05");
    default Schedule(20, 40, UAIState_Wounded(), n"FP_OM_FL_WOUNDED_05");
    default Schedule(1, 40, UAIState_SitAround(), n"FP_OM_FL_WOUNDED_05");
    default Schedule(8, 40, UAIState_Wounded(), n"FP_OM_FL_WOUNDED_05");

    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}