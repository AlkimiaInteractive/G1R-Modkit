
UCLASS()
class UAIAgentConfig_Human_UL_ORG_CoBlackmailer_889 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_UL_ORG_CoBlackmailer_889::StaticClass();
}


UCLASS()
class UDailyRoutine_UL_ORG_CoBlackmailer_889_Start : UAIState_DailyRoutine_Human
{
    default Schedule(7, 0, UAIState_Guard(), n"FP_CV_GUARD_02", 100);
}

UCLASS()
class UDailyRoutine_UL_ORG_CoBlackmailer_889_Payed : UAIState_DailyRoutine_Human
{
    default OverrideAllowBlockingPathWhileStationary = false;
    
    default Schedule(7, 0, UAIState_SleepStanding(), n"FP_CV_GUARD_02", 100);
    default Schedule(10, 0, UAIState_Guard(), n"FP_CV_GUARD_02", 100);
    default Schedule(13, 0, UAIState_Eat(), n"FP_CV_GROUND_01", 100);
    default Schedule(15, 0, UAIState_Guard(), n"FP_CV_GUARD_02", 100);
    default Schedule(18, 0, UAIState_Campfire(), n"FP_CV_GROUND_01", 100);
    default Schedule(21, 0, UAIState_Eat(), n"FP_CV_GUARD_02", 100);
    default Schedule(23, 0, UAIState_Sleep_Seated(), n"IO_CV_BENCH_01", 100);
    default Schedule(3, 0, UAIState_Guard(), n"FP_CV_GUARD_02", 100);
}

