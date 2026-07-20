UCLASS()
class UAIAgentConfig_Human_OC_VLK_Digger18_520 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OC_VLK_Digger18_520::StaticClass();

}



UCLASS()
class UDailyRoutine_OC_VLK_Digger18_520_Start : UAIState_DailyRoutine_Human_Digger
{
    default Schedule(7, 0, UAIState_WashSelf(), n"FP_OW_OC_WASHSELFRIVER_01");
    default Schedule(8, 0, UAIState_Eat_Seated(), n"IO_OC_OUTSIDE_CHAIR_02");
    default Schedule(9, 0, UAIState_SitAround(), n"IO_OC_OUTSIDE_CHAIR_02");
    default Schedule(13, 0, UAIState_Eat_Seated(), n"IO_OC_OUTSIDE_CHAIR_02");
    default Schedule(14, 0, UAIState_SitAround(), n"IO_OC_OUTSIDE_CHAIR_02");
    default Schedule(20, 0, UAIState_Eat_Seated(), n"IO_OC_OUTSIDE_CHAIR_02");
    default Schedule(21, 0, UAIState_SitAround(), n"IO_OC_OUTSIDE_CHAIR_02");
    default Schedule(22, 15, UAIState_Sleep(), n"Bed_Digger520", WaypointRadius = 500);
}

UCLASS()
class UDailyRoutine_OC_VLK_Digger18_520_InExtremoWait : UDailyRoutine_Digger
{
    default Schedule(7, 0, UAIState_WaitInextremo(), n"FP_OC_INEXTREMO_09", 200);

    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}

UCLASS()
class UDailyRoutine_OC_VLK_Digger18_520_InExtremoConcert : UDailyRoutine_Digger
{
    default Schedule(7, 0, UAIState_WatchInExtremo_Intense(), n"FP_OC_INEXTREMO_09", 200);
}