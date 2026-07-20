UCLASS()
class UDailyRoutine_TPL_1432_Templer_Start : UAIState_DailyRoutine_Human
{
    default Schedule(8, 0, UAIState_Guard(), n"PSI_TEMPLE_GUARD_04");
    default Schedule(21, 0, UAIState_Guard(), n"PSI_TEMPLE_GUARD_04");
}


UCLASS()
class UDailyRoutine_TPL_1432_Templer_Prepareritual : UAIState_DailyRoutine_Human
{
    default Schedule(8, 0, UAIState_Guard(), n"PSI_TEMPLE_GUARD_04");
    default Schedule(21, 0, UAIState_Guard(), n"PSI_TEMPLE_GUARD_04");
}


UCLASS()
class UDailyRoutine_TPL_1432_Templer_Omfull : UAIState_DailyRoutine_Human
{
    default Schedule(8, 0, UAIState_Guard(), n"PSI_TEMPLE_GUARD_04");
    default Schedule(21, 0, UAIState_Guard(), n"PSI_TEMPLE_GUARD_04");
}


UCLASS()
class UDailyRoutine_TPL_1432_Templer_Fmtaken : UAIState_DailyRoutine_Human
{
    default Schedule(8, 0, UAIState_Guard(), n"PSI_TEMPLE_GUARD_04");
    default Schedule(21, 0, UAIState_Guard(), n"PSI_TEMPLE_GUARD_04");
}


UCLASS()
class UDailyRoutine_TPL_1432_Templer_Orcassault : UAIState_DailyRoutine_Human
{
    default Schedule(8, 0, UAIState_Guard(), n"PSI_TEMPLE_GUARD_04");
    default Schedule(21, 0, UAIState_Guard(), n"PSI_TEMPLE_GUARD_04");
}


UCLASS()
class UDailyRoutine_TPL_1434_Templer_Start : UAIState_DailyRoutine_Human
{
    default Schedule(0, 0, UAIState_StandAround(), n"OM_CAVE1_85");
    default Schedule(12, 0, UAIState_StandAround(), n"OM_CAVE1_85");
}

UCLASS()
class UDailyRoutine_TPL_1434_Templer_Prepareritual : UAIState_DailyRoutine_Human
{
    default Schedule(0, 0, UAIState_StandAround(), n"OM_CAVE1_85");
    default Schedule(12, 0, UAIState_StandAround(), n"OM_CAVE1_85");
}

UCLASS()
class UDailyRoutine_TPL_1435_Templer_Start : UAIState_DailyRoutine_Human
{
    default Schedule(0, 0, UAIState_MCHunting(), n"OM_031");
    default Schedule(12, 0, UAIState_MCHunting(), n"OM_031");
}

UCLASS()
class UDailyRoutine_TPL_1435_Templer_Prepareritual : UAIState_DailyRoutine_Human
{
    default Schedule(0, 0, UAIState_MCHunting(), n"OM_031");
    default Schedule(12, 0, UAIState_MCHunting(), n"OM_031");
}

UCLASS()
class UDailyRoutine_TPL_1461_Templer_Start : UAIState_DailyRoutine_Human
{
    default Schedule(9, 0, UAIState_HostileGuard(), n"TPL_408");
    default Schedule(21, 0, UAIState_HostileGuard(), n"TPL_408");
}


UCLASS()
class UDailyRoutine_TPL_1461_Templer_Ot : UAIState_DailyRoutine_Human
{
    default Schedule(9, 0, UAIState_HostileGuard(), n"TPL_149");
    default Schedule(21, 0, UAIState_HostileGuard(), n"TPL_149");
}


UCLASS()
class UDailyRoutine_TPL_1462_Templer_Start : UAIState_DailyRoutine_Human
{
    default Schedule(9, 0, UAIState_HostileGuard(), n"TPL_408");
    default Schedule(21, 0, UAIState_HostileGuard(), n"TPL_408");
}


UCLASS()
class UDailyRoutine_TPL_1462_Templer_Ot : UAIState_DailyRoutine_Human
{
    default Schedule(9, 0, UAIState_HostileGuard(), n"TPL_278");
    default Schedule(21, 0, UAIState_HostileGuard(), n"TPL_278");
}