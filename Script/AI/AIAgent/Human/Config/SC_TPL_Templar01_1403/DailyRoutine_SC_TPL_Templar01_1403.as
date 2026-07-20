UCLASS()
class UAIAgentConfig_Human_SC_TPL_Templar01_1403 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_SC_TPL_Templar01_1403::StaticClass();

}



UCLASS()
class UDailyRoutine_SC_TPL_Templar01_1403_Start : UAIState_DailyRoutine_Human
{
    default Schedule(7, 0, UAIState_Eat(), n"IO_SC_BENCH_46", 500);
    default Schedule(7, 30, UAIState_Guard(), n"FP_SC_GUARD_27");
    default Schedule(22, 30, UAIState_Eat(), n"IO_SC_BENCH_46", 500);
    default Schedule(23, 0, UAIState_Sleep(), n"FP_SC_GUARD_27");
}

UCLASS()
class UDailyRoutine_SC_TPL_Templar01_1403_Prepareritual : UAIState_DailyRoutine_Human
{
    default Schedule(22, 0, UAIState_Guard(), n"FP_SC_GUARD_27");
}

UCLASS()
class UDailyRoutine_SC_TPL_Templar01_1403_Omfull : UAIState_DailyRoutine_Human
{
    default Schedule(22, 0, UAIState_Guard(), n"FP_SC_GUARD_27");
}

UCLASS()
class UDailyRoutine_SC_TPL_Templar01_1403_Fmtaken : UAIState_DailyRoutine_Human
{
    default Schedule(22, 0, UAIState_Guard(), n"FP_SC_GUARD_27");
}

UCLASS()
class UDailyRoutine_SC_TPL_Templar01_1403_Orcassault : UAIState_DailyRoutine_Human
{
    default Schedule(22, 0, UAIState_Guard(), n"FP_SC_GUARD_27");
}