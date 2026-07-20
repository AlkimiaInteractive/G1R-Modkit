UCLASS()
class UAIAgentConfig_Human_OM_VLK_Digger16_558 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OM_VLK_Digger16_558::StaticClass();

}



UCLASS()
class UDailyRoutine_OM_VLK_Digger16_558_Start : UAIState_DailyRoutine_Human
{
    default Schedule(5, 0, UAIState_Eat(), n"FP_OM_REST_06",1000);
    default Schedule(6, 0, UAIState_PickOre(), n"IO_OM_PICKORE_10");
    default Schedule(16, 0, UAIState_Rest(), n"FP_OM_REST_06",1000);
    default Schedule(17, 0, UAIState_PickOre(), n"IO_OM_PICKORE_10");
}

UCLASS()
class UDailyRoutine_OM_VLK_Digger16_558_Collapsed : UAIState_DailyRoutine_Human
{
    default Schedule(10, 30, UAIState_Wounded(), n"FP_OM_FL_WOUNDED_04");
    default Schedule(13, 30, UAIState_SitAround(), n"FP_OM_FL_WOUNDED_04");
    default Schedule(20, 30, UAIState_Wounded(), n"FP_OM_FL_WOUNDED_04");
    default Schedule(1, 30, UAIState_SitAround(), n"FP_OM_FL_WOUNDED_04");

    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}