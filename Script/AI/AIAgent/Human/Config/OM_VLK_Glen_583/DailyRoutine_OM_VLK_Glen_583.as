UCLASS()
class UAIAgentConfig_Human_OM_VLK_Glen_583 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OM_VLK_Glen_583::StaticClass();

}



UCLASS()
class UDailyRoutine_OM_VLK_Glen_583_Start : UAIState_DailyRoutine_Human
{
    default Schedule(0, 0, UAIState_PickOre(), n"IO_OM_PICKORE_01");
    default Schedule(11, 0, UAIState_Rest(), n"IO_OM_CHAIR_BOX_02");
    default Schedule(12, 0, UAIState_PickOre(), n"IO_OM_PICKORE_01");
    default Schedule(23, 0, UAIState_Eat(), n"IO_OM_CHAIR_BOX_02");
}

UCLASS()
class UDailyRoutine_OM_VLK_Glen_583_Collapsed : UAIState_DailyRoutine_Human
{
    default Schedule(8, 0, UAIState_SitAround(), n"FP_OM_FL_WOUNDED_07");
    default Schedule(10, 0, UAIState_CheckBody(), n"FP_OM_FL_CHECKBODY_03");
    default Schedule(15, 0, UAIState_Wounded(), n"FP_OM_FL_WOUNDED_07");
    default Schedule(18, 0, UAIState_CheckBody(), n"FP_OM_FL_CHECKBODY_03");
    default Schedule(22, 0, UAIState_SitAround(), n"FP_OM_FL_WOUNDED_07");

    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}