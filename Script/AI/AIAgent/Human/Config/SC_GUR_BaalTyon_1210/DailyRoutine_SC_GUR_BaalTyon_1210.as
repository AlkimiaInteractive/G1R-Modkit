UCLASS()
class UAIAgentConfig_Human_SC_GUR_BaalTyon_1210: UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_SC_GUR_BaalTyon_1210::StaticClass();

}



UCLASS()
class UDailyRoutine_SC_GUR_BaalTyon_1210_Start : UAIState_DailyRoutine_Human
{
    default Schedule(23, 0, UAIState_Preach(), n"FP_SC_PREACHING_01");
}

UCLASS()
class UDailyRoutine_SC_GUR_BaalTyon_1210_Ritual : UAIState_DailyRoutine_Human
{
    default Schedule(8, 00, UAIState_StandAround(), n"FP_SC_PREACHING_01");
    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}

UCLASS()
class UDailyRoutine_SC_GUR_BaalTyon_1210_AfterRitual : UAIState_DailyRoutine_Human
{
    default Schedule(8, 00, UAIState_Drained(), n"FP_SC_PREACHING_01");
    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}

UCLASS()
class UDailyRoutine_SC_GUR_BaalTyon_1210_AfterTalkingToAngar : UAIState_DailyRoutine_Human
{
    default Schedule(8, 00, UAIState_Preach(), n"FP_SC_PREACHING_01");
    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}

UCLASS()
class UDailyRoutine_SC_GUR_BaalTyon_1210_Omfull : UAIState_DailyRoutine_Human
{
    default Schedule(23, 0, UAIState_SitAround(), n"PSI_TEMPLE_IN_05");
}


UCLASS()
class UDailyRoutine_SC_GUR_BaalTyon_1210_Fmtaken : UAIState_DailyRoutine_Human
{
    default Schedule(23, 0, UAIState_SitAround(), n"PSI_TEMPLE_IN_05");
}


UCLASS()
class UDailyRoutine_SC_GUR_BaalTyon_1210_Orcassault : UAIState_DailyRoutine_Human
{
    default Schedule(23, 0, UAIState_SitAround(), n"PSI_TEMPLE_IN_05");
}

UCLASS()
class UDailyRoutine_SC_GUR_BaalTyon_1210_CampDivided : UAIState_DailyRoutine_Human
{
    default Schedule(7, 30, UAIState_Smoke_Ground(), n"IO_OG_WATERPIPE_02",500);
    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}

