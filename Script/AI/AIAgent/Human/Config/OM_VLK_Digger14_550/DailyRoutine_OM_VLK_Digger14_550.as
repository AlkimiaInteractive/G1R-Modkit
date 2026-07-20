UCLASS()
class UAIAgentConfig_Human_OM_VLK_Digger14_550 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OM_VLK_Digger14_550::StaticClass();

}



UCLASS()
class UDailyRoutine_OM_VLK_Digger14_550_Start : UAIState_DailyRoutine_Human
{
    default Schedule(8, 40, UAIState_PickOre(), n"IO_OM_PICKORE_08");
}

UCLASS()
class UDailyRoutine_OM_VLK_Digger14_550_Collapsed : UAIState_DailyRoutine_Human
{
    default Schedule(8, 40, UAIState_SitAround(), n"FP_OM_FL_WOUNDED_03");
    default Schedule(12, 20, UAIState_Wounded(), n"FP_OM_FL_WOUNDED_03");
    default Schedule(18, 40, UAIState_SitAround(), n"FP_OM_FL_WOUNDED_03");
    default Schedule(2, 20, UAIState_Wounded(), n"FP_OM_FL_WOUNDED_03");

    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}