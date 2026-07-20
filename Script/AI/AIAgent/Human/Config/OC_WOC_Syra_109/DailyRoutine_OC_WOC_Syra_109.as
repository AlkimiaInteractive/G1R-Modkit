UCLASS()
class UAIAgentConfig_Human_OC_WOC_Syra_109 : UAIAgentConfig_Human_Woman
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OC_WOC_Syra_109::StaticClass();
}



UCLASS()
class UDailyRoutine_OC_WOC_Syra_109_Start : UAIState_DailyRoutine_Human
{
    default Schedule(7, 0, UAIState_Eat(), n"IO_OC_CHAIR_BENCH_22_SYRA",200);
    default Schedule(8, 30, UAIState_Cook(), n"IO_OC_CAMPFIRE_PAN_06",200);
    default Schedule(12, 0, UAIState_SitAround_Woman(), n"IO_OC_CHAIR_BENCH_22_SYRA",200);
    default Schedule(13, 0, UAIState_Cook(), n"IO_OC_CAMPFIRE_PAN_06",200);
    default Schedule(19, 0, UAIState_Eat(), n"IO_OC_CHAIR_BENCH_22_SYRA",200);
    default Schedule(19, 30, UAIState_SitAround_Woman(), n"IO_OC_CHAIR_BENCH_22_SYRA",200);
    default Schedule(22, 30, UAIState_Sleep(), n"IO_OC_BED_SYRA", 100);
}

UCLASS()
class UDailyRoutine_OC_WOC_Syra_109_Saved : UAIState_DailyRoutine_Human
{
    default Schedule(7, 0, UAIState_Eat(), n"IO_OC_CHAIR_BENCH_22_SYRA",200);
    default Schedule(8, 30, UAIState_Cook(), n"IO_OC_CAMPFIRE_PAN_06",200);
    default Schedule(12, 0, UAIState_SitAround_Woman(), n"IO_OC_CHAIR_BENCH_22_SYRA",200);
    default Schedule(13, 0, UAIState_Cook(), n"IO_OC_CAMPFIRE_PAN_06",200);
    default Schedule(19, 0, UAIState_Eat(), n"IO_OC_CHAIR_BENCH_22_SYRA",200);
    default Schedule(19, 30, UAIState_SitAround_Woman(), n"IO_OC_CHAIR_BENCH_22_SYRA",200);
    default Schedule(22, 30, UAIState_Sleep(), n"IO_OC_BED_SYRA", 100);
}