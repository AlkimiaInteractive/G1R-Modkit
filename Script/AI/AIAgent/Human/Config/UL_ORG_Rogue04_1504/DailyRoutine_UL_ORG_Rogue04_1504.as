UCLASS()
class UAIAgentConfig_Human_UL_ORG_Rogue04_1504: UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_UL_ORG_Rogue04_1504::StaticClass();

}

UCLASS()
class UDailyRoutine_UL_ORG_Rogue04_1504_Start : UAIState_DailyRoutine_Human
{
    default Schedule(0, 0, UAIState_Guard(), n"FP_UL_GUARD_04", 200);
}


UCLASS()
class UDailyRoutine_UL_ORG_Rogue04_1504_Beaten : UAIState_DailyRoutine_Human
{
    default OverrideAllowBlockingPathWhileStationary = false;
    
    default Schedule(8, 0, UAIState_Guard(), n"FP_UL_GUARD_04",100);
    default Schedule(12, 0, UAIState_SitAround(), n"IO_UL_CHAIR_04",100);
    default Schedule(14, 0, UAIState_Eat_Seated(), n"IO_UL_CHAIR_04",100);
    default Schedule(16, 0, UAIState_Smoke_Seated(), n"IO_UL_CHAIR_04",100);
    default Schedule(18, 0, UAIState_Guard(), n"FP_UL_GUARD_04",100);
    default Schedule(23, 0, UAIState_SitCampfire(), n"IO_UL_CHAIR_04",100);
    default Schedule(1, 0, UAIState_Sleep(), n"Bed_Rogue04_1504",100);

    default ScheduleIfRaining(9, 0, UAIState_SitAround(), n"IO_UL_CHAIR_03",100);
}
