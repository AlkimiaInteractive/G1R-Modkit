UCLASS()
class UAIAgentConfig_Human_UL_ORG_Rogue03_1503: UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_UL_ORG_Rogue03_1503::StaticClass();

}

UCLASS()
class UDailyRoutine_UL_ORG_Rogue03_1503_Start : UAIState_DailyRoutine_Human
{
    default Schedule(0, 0, UAIState_Guard(), n"FP_UL_GUARD_03", 200);
}


UCLASS()
class UDailyRoutine_UL_ORG_Rogue03_1503_Beaten : UAIState_DailyRoutine_Human
{
    default OverrideAllowBlockingPathWhileStationary = false;

    default Schedule(9, 0, UAIState_SitAround(), n"IO_UL_CHAIR_03",100);
    default Schedule(11, 0, UAIState_Sleep(), n"Bed_Rogue03_1503",100);
    default Schedule(16, 0, UAIState_Cook(), n"Bed_Rogue03_1503",100);
    default Schedule(18, 0, UAIState_Eat_Seated(), n"IO_UL_CHAIR_03",100);
    default Schedule(20, 0, UAIState_SitCampfire(), n"IO_UL_CHAIR_03",100);
    default Schedule(23, 0, UAIState_Guard(), n"FP_UL_GUARD_03",100);

    default ScheduleIfRaining(9, 0, UAIState_SitAround(), n"IO_UL_CHAIR_02",100);
}
