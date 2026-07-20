UCLASS()
class UAIAgentConfig_Human_UL_ORG_Rogue02_1502: UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_UL_ORG_Rogue02_1502::StaticClass();

}

UCLASS()
class UDailyRoutine_UL_ORG_Rogue02_1502_Start : UAIState_DailyRoutine_Human
{
    default Schedule(0, 0, UAIState_SitAround(), n"IO_UL_CHAIR_BENCH_01", 200);
}


UCLASS()
class UDailyRoutine_UL_ORG_Rogue02_1502_Beaten : UAIState_DailyRoutine_Human
{
    default OverrideAllowBlockingPathWhileStationary = false;

    default Schedule(8, 0, UAIState_Guard(), n"FP_UL_GUARD_02",100);
    default Schedule(13, 0, UAIState_Eat_Seated(), n"IO_UL_CHAIR_02",100);
    default Schedule(16, 0, UAIState_Guard(), n"FP_UL_GUARD_02",100);
    default Schedule(20, 0, UAIState_SitAround(), n"IO_UL_CHAIR_02",100);
    default Schedule(1, 0, UAIState_Sleep_Seated(), n"IO_UL_CHAIR_02",100);

    default ScheduleIfRaining(9, 0, UAIState_SitAround(), n"IO_UL_CHAIR_02",100);
}
