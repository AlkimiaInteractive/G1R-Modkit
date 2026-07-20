UCLASS()
class UAIAgentConfig_Human_SC_TPL_GorNaRan_1405: UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_SC_TPL_GorNaRan_1405::StaticClass();

}



UCLASS()
class UDailyRoutine_SC_TPL_GorNaRan_1405_Start : UAIState_DailyRoutine_Human
{
    default Schedule(0, 0, UAIState_Sleep(), n"FP_SC_GUARD_02");
    default Schedule(6, 0, UAIState_Eat(), n"FP_SC_GUARD_02");
    default Schedule(6, 30, UAIState_Guard(), n"FP_SC_GUARD_02");
    default Schedule(23, 30, UAIState_Eat(), n"FP_SC_GUARD_02");
}


UCLASS()
class UDailyRoutine_SC_TPL_GorNaRan_1405_Prepareritual : UAIState_DailyRoutine_Human
{
     default Schedule(0, 0, UAIState_Sleep(), n"FP_SC_GUARD_02");
    default Schedule(6, 0, UAIState_Eat(), n"FP_SC_GUARD_02");
    default Schedule(6, 30, UAIState_Guard(), n"FP_SC_GUARD_02");
    default Schedule(23, 30, UAIState_Eat(), n"FP_SC_GUARD_02");
}


UCLASS()
class UDailyRoutine_SC_TPL_GorNaRan_1405_Omfull : UAIState_DailyRoutine_Human
{
     default Schedule(0, 0, UAIState_Sleep(), n"FP_SC_GUARD_02");
    default Schedule(6, 0, UAIState_Eat(), n"FP_SC_GUARD_02");
    default Schedule(6, 30, UAIState_Guard(), n"FP_SC_GUARD_02");
    default Schedule(23, 30, UAIState_Eat(), n"FP_SC_GUARD_02");
}


UCLASS()
class UDailyRoutine_SC_TPL_GorNaRan_1405_Fmtaken : UAIState_DailyRoutine_Human
{
     default Schedule(0, 0, UAIState_Sleep(), n"FP_SC_GUARD_02");
    default Schedule(6, 0, UAIState_Eat(), n"FP_SC_GUARD_02");
    default Schedule(6, 30, UAIState_Guard(), n"FP_SC_GUARD_02");
    default Schedule(23, 30, UAIState_Eat(), n"FP_SC_GUARD_02");
}


UCLASS()
class UDailyRoutine_SC_TPL_GorNaRan_1405_Orcassault : UAIState_DailyRoutine_Human
{
     default Schedule(0, 0, UAIState_Sleep(), n"FP_SC_GUARD_02");
    default Schedule(6, 0, UAIState_Eat(), n"FP_SC_GUARD_02");
    default Schedule(6, 30, UAIState_Guard(), n"FP_SC_GUARD_02");
    default Schedule(23, 30, UAIState_Eat(), n"FP_SC_GUARD_02");
}

UCLASS()
class UDailyRoutine_SC_TPL_GorNaRan_1405_CampDivided : UAIState_DailyRoutine_Human
{
    default Schedule(10, 0, UAIState_Smalltalk(), n"FP_OG_SMALLTALK_02");
    default Schedule(13, 0, UAIState_SitAround(), n"IO_OG_CHAIR_BENCH_03");
    default Schedule(16, 0, UAIState_Smoke_Seated(), n"IO_OG_CHAIR_BENCH_04");
    default Schedule(18, 0, UAIState_RoastScavenger(), n"IO_OG_ROSTISSERIE_01");
    default Schedule(20, 0, UAIState_Eat_Seated(), n"IO_OG_CHAIR_BENCH_04");

    default ScheduleIfRaining(12, 0, UAIState_Smoke(), n"FP_OG_RAINSHELTER_02",500);
    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}

UCLASS()
class UDailyRoutine_SC_TPL_GorNaRan_1405_Confrontation : UAIState_DailyRoutine_Human
{
    default Schedule(6, 0, UAIState_StandAround(), n"FP_ST_GORNARAN_CONFRONTATION");
    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}

