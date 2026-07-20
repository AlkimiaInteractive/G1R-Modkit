
UCLASS()
class UAIAgentConfig_Human_UL_ORG_Aidan_859 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_UL_ORG_Aidan_859::StaticClass();
}


UCLASS()
class UDailyRoutine_UL_ORG_Aidan_859_Start : UAIState_DailyRoutine_Human
{
    default Schedule(7, 0, UAIState_CutWood_Trunk(), n"IO_CV_TRUNK_01");
    default Schedule(10, 0, UAIState_Stand(), n"FP_CV_AIDAN_STANDAROUND");
    default Schedule(12, 0, UAIState_Leatherworking(), n"IO_CV_TANNING_01");
    default Schedule(13, 10, UAIState_Cook(), n"IO_Aidan_Cauldron_01");
    default Schedule(14, 0, UAIState_Sit(), n"IO_CV_BENCH_AIDAN");
    default Schedule(16, 0, UAIState_PlayKnife(), n"IO_CV_BENCH_AIDAN");
    default Schedule(18, 0, UAIState_CutWood_Trunk(), n"IO_CV_TRUNK_01");
    default Schedule(19, 30, UAIState_Leatherworking(), n"IO_CV_TANNING_01");
    default Schedule(20, 40, UAIState_Cook(), n"IO_Aidan_Cauldron_01");
    default Schedule(22, 0, UAIState_Sit_PlayStone(), n"IO_CV_BENCH_AIDAN");
    default Schedule(23, 0, UAIState_Sleep(), n"IO_CV_BED_AIDAN");
}

