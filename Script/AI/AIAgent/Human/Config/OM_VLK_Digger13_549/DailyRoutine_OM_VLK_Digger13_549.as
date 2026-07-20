UCLASS()
class UAIAgentConfig_Human_OM_VLK_Digger13_549 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OM_VLK_Digger13_549::StaticClass();

}



UCLASS()
class UDailyRoutine_OM_VLK_Digger13_549_Start : UAIState_DailyRoutine_Human
{
    default Schedule(23, 0, UAIState_PickOre(), n"IO_OM_PICKORE_07");
}

UCLASS()
class UDailyRoutine_OM_VLK_Digger13_549_Collapsed : UAIState_DailyRoutine_Human
{
    default Schedule(11, 0, UAIState_Wounded(), n"FP_OM_FL_WOUNDED_02");
    default Schedule(14, 0, UAIState_SitAround(), n"FP_OM_FL_WOUNDED_02");
    default Schedule(21, 0, UAIState_Wounded(), n"FP_OM_FL_WOUNDED_02");
    default Schedule(2, 0, UAIState_SitAround(), n"FP_OM_FL_WOUNDED_02");
    default Schedule(7, 0, UAIState_Wounded(), n"FP_OM_FL_WOUNDED_02");

    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}