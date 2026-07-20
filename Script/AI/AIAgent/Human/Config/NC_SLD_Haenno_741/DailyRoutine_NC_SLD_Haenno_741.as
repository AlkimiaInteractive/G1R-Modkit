
UCLASS()
class UAIAgentConfig_Human_NC_SLD_Haenno_741 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_NC_SLD_Haenno_741::StaticClass();
}

UCLASS()
class UDailyRoutine_NC_SLD_Haenno_741_Start : UAIState_DailyRoutine_Human
{
    default Schedule(0, 30, UAIState_Sleep_Seated(), n"IO_NC_CHAIR_18", 500);
    default Schedule(7, 0, UAIState_Eat_Seated(), n"IO_NC_CHAIR_18", 500);
    default Schedule(9, 0, UAIState_WashSelf(), n"FP_NC_WASHSELF_11", 500);
    default Schedule(10, 30, UAIState_PracticeBow(), n"FP_NC_PRACTICEBOW_HAENNO", 500);
    default Schedule(14, 56, UAIState_Eat_Seated(), n"IO_NC_STOOL_HAENNO", 500);
    default Schedule(16, 40, UAIState_PracticeBow(), n"FP_NC_PRACTICEBOW_HAENNO", 500);
    default Schedule(20, 30, UAIState_Eat_Seated(), n"IO_NC_STOOL_HAENNO", 500);
	default Schedule(22, 30, UAIState_Drink(), n"IO_NC_CHAIR_18", 500);

    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}

UCLASS()
class UDailyRoutine_NC_SLD_Haenno_741_Preparebow : UAIState_DailyRoutine_Human
{
    default Schedule(0, 30, UAIState_CarveWood(), n"IO_NC_STOOL_HAENNO", 500);
}

UCLASS()
class UDailyRoutine_NC_SLD_Haenno_741_InExtremoWait : UDailyRoutine_Digger
{
    default Schedule(7, 0, UAIState_WaitInextremo(), n"FP_OC_INEXTREMO_22", 200);

    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}

UCLASS()
class UDailyRoutine_NC_SLD_Haenno_741_InExtremoConcert : UDailyRoutine_Digger
{
    default Schedule(7, 0, UAIState_WatchInExtremo_Chill(), n"FP_OC_INEXTREMO_22", 200);
}