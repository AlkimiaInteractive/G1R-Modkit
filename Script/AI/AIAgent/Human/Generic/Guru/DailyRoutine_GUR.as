UCLASS()
class UDailyRoutine_ST_GUR_MadCorKalom_1212_Startt : UAIState_DailyRoutine_Human
{
    default Schedule(15, 0, UAIState_Stay(), n"TPL_408");
    default Schedule(22, 0, UAIState_Stay(), n"TPL_408");
}


UCLASS()
class UDailyRoutine_ST_GUR_MadCorKalom_1212_Ot : UAIState_DailyRoutine_Human
{
    default Schedule(15, 0, UAIState_InterceptMadCorKalom(), n"TPL_390");
    default Schedule(22, 0, UAIState_InterceptMadCorKalom(), n"TPL_390");
}