UCLASS()
class UDailyRoutine_NOV_1316_Novize_Start : UAIState_DailyRoutine_Human
{
    default SmithSchedule(0, 24, n"PSI_SMITH_01");
}


UCLASS()
class UDailyRoutine_NOV_1316_Novize_Prepareritual : UAIState_DailyRoutine_Human
{

}


UCLASS()
class UDailyRoutine_NOV_1316_Novize_Omfull : UAIState_DailyRoutine_Human
{

}


UCLASS()
class UDailyRoutine_NOV_1316_Novize_Fmtaken : UAIState_DailyRoutine_Human
{

}


UCLASS()
class UDailyRoutine_NOV_1316_Novize_Orcassault : UAIState_DailyRoutine_Human
{

}

UCLASS()
class UDailyRoutine_NOV_1321_Novize_Start : UAIState_DailyRoutine_Human
{
    default Schedule(7, 30, UAIState_SitCampfire(), n"PSI_PATH_2_14_2");
    default Schedule(23, 0, UAIState_Sleep(), n"PSI_9_HUT_IN");
}

UCLASS()
class UDailyRoutine_NOV_1350_Novize_Start : UAIState_DailyRoutine_Human
{
    default Schedule(8, 0, UAIState_Guard(), n"PSI_22_HUT_EX_GUARD");
    default Schedule(20, 0, UAIState_Guard(), n"PSI_22_HUT_EX_GUARD");
}

UCLASS()
class UDailyRoutine_NOV_1354_Novize_Start : UAIState_DailyRoutine_Human
{
    default Schedule(2, 0, UAIState_Sleep(), n"PSI_19_HUT_IN");
    default Schedule(7, 35, UAIState_Smalltalk(), n"PSI_19_HUT_EX");
}

UCLASS()
class UDailyRoutine_NOV_1355_Novize_Start : UAIState_DailyRoutine_Human
{
    default Schedule(2, 5, UAIState_Sleep(), n"PSI_19_HUT_IN");
    default Schedule(7, 30, UAIState_Smalltalk(), n"PSI_TEACH_1");
}