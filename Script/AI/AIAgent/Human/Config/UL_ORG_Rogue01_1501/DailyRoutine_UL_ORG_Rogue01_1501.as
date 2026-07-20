UCLASS()
class UAIAgentConfig_Human_UL_ORG_Rogue01_1501: UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_UL_ORG_Rogue01_1501::StaticClass();

}

UCLASS()
class UDailyRoutine_UL_ORG_Rogue01_1501_Start : UAIState_DailyRoutine_Human
{
    default Schedule(0, 0, UAIState_Guard(), n"FP_UL_GUARD_01",100);
}


UCLASS()
class UDailyRoutine_UL_ORG_Rogue01_1501_Beaten : UAIState_DailyRoutine_Human
{
    default OverrideAllowBlockingPathWhileStationary = false;
    
    default Schedule(8, 0, UAIState_Guard(), n"FP_UL_GUARD_01",100);
    default Schedule(13, 0, UAIState_Sit(), n"IO_UL_CHAIR_BENCH_01",100);
    default Schedule(16, 0, UAIState_Guard(), n"FP_UL_GUARD_01",100);
    default Schedule(20, 0, UAIState_Sit(), n"IO_UL_CHAIR_BENCH_01",100);
    default Schedule(1, 0, UAIState_Sleep_Seated(), n"IO_UL_CHAIR_BENCH_01",100);

    default ScheduleIfRaining(9, 0, UAIState_RainShelterNoMouth(), n"FP_UL_RAINSHELTER_01",100);
}
