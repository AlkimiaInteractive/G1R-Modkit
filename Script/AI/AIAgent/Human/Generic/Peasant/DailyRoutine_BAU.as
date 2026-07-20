
UCLASS()
class UDailyRoutine_BAU_917_Bauer_Start : UAIState_DailyRoutine_Human
{
    default Schedule(7, 35, UAIState_PickRice(), n"NC_PATH80");
    default Schedule(20, 35, UAIState_Sleep(), n"NC_PATH_PEASANT_SLEEP");
}


UCLASS()
class UDailyRoutine_BAU_921_Bauer_Start : UAIState_DailyRoutine_Human
{
    default Schedule(7, 50, UAIState_PickRice(), n"NC_PATH82");
    default Schedule(20, 50, UAIState_Sleep(), n"NC_PATH_PEASANT");
}

UCLASS()
class UDailyRoutine_BAU_923_Bauer_Start : UAIState_DailyRoutine_Human
{
    default Schedule(7, 5, UAIState_WashSelf(), n"NC_PATH_PEASANT_OUTSIDE8_WASH");
    default Schedule(7, 23, UAIState_PickRice(), n"NC_PATH83_MOVEMENT");
    default Schedule(20, 5, UAIState_SitCampfire(), n"NC_PATH_PEASANT_OUTSIDE20");
}


UCLASS()
class UDailyRoutine_BAU_924_Bauer_Start : UAIState_DailyRoutine_Human
{
    default Schedule(8, 20, UAIState_PickRice(), n"NC_PATH83");
    default Schedule(20, 20, UAIState_SitCampfire(), n"NC_PATH_PEASANT_OUTSIDE20");
}


UCLASS()
class UDailyRoutine_BAU_925_Bauer_Start : UAIState_DailyRoutine_Human
{
    default Schedule(8, 0, UAIState_Smalltalk(), n"OW_PATH_069");
    default Schedule(20, 0, UAIState_Smalltalk(), n"OW_PATH_069");
}

UCLASS()
class UDailyRoutine_BAU_927_Bauer_Start : UAIState_DailyRoutine_Human
{
    default Schedule(7, 25, UAIState_PickRice(), n"NC_PATH81");
    default Schedule(20, 25, UAIState_SitCampfire(), n"NC_PATH_PEASANT_OUTSIDE4");
}


UCLASS()
class UDailyRoutine_BAU_928_Bauer_Start : UAIState_DailyRoutine_Human
{
    default Schedule(8, 25, UAIState_PickRice(), n"NC_PATH81");
    default Schedule(20, 25, UAIState_SitCampfire(), n"NC_PATH_PEASANT_OUTSIDE6");
}


UCLASS()
class UDailyRoutine_BAU_929_Bauer_Start : UAIState_DailyRoutine_Human
{
    default Schedule(8, 30, UAIState_PickRice(), n"NC_PATH80");
    default Schedule(20, 30, UAIState_SitCampfire(), n"NC_PATH_PEASANT_OUTSIDE9");
}


UCLASS()
class UDailyRoutine_BAU_930_Bauer_Start : UAIState_DailyRoutine_Human
{
    default Schedule(8, 35, UAIState_PickRice(), n"NC_PATH79");
    default Schedule(20, 35, UAIState_SitCampfire(), n"NC_PATH_PEASANT_OUTSIDE11");
}

UCLASS()
class UDailyRoutine_Bau_940_Riddler_Start : UAIState_DailyRoutine_Human
{
    default Schedule(8, 0, UAIState_Stand(), n"OW_FOGDUNGEON_36_MOVEMENT");
    default Schedule(20, 0, UAIState_Stand(), n"OW_FOGDUNGEON_36_MOVEMENT");
}