
UCLASS()
class UAIAgentConfig_Human_UL_ORG_Blackmailer_888 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_UL_ORG_Blackmailer_888::StaticClass();
}


UCLASS()
class UDailyRoutine_UL_ORG_Blackmailer_888_Start : UAIState_DailyRoutine_Human
{
    default Schedule(7, 0, UAIState_Guard(), n"FP_CV_GUARD_01", 100);
}

UCLASS()
class UDailyRoutine_UL_ORG_Blackmailer_888_Payed : UAIState_DailyRoutine_Human
{
    default Schedule(7, 0, UAIState_Guard(), n"FP_CV_GUARD_01", 100);
    default Schedule(10, 0, UAIState_Eat_Seated(), n"IO_CV_BENCH_01", 100);
    default Schedule(13, 0, UAIState_Eat(), n"FP_CV_GUARD_01", 100);
    default Schedule(15, 0, UAIState_Sleep_Seated(), n"IO_CV_BENCH_01", 100);
    default Schedule(18, 0, UAIState_Guard(), n"FP_CV_GUARD_01", 100);
    default Schedule(21, 0, UAIState_Eat(), n"FP_CV_GUARD_01", 100);
    default Schedule(23, 0, UAIState_Guard(), n"FP_CV_GUARD_01", 100);
    default Schedule(4, 0, UAIState_SleepStanding(), n"FP_CV_GUARD_01", 100);
}

