
UCLASS()
class UAIAgentConfig_Human_UL_STT_Cohsel_337 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_UL_STT_Cohsel_337::StaticClass();
}

UCLASS()
class UDailyRoutine_UL_STT_Cohsel_337_Start : UAIState_DailyRoutine_Human
{
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_CavalornValley_Cohsel_Hut);
    
    default Schedule(0, 30, UAIState_Sleep(), n"IO_UL_BED_COHSEL", 500);
    default Schedule(9, 0, UAIState_Drink(), n"IO_COHSEL_STOOL", 500);
    default Schedule(10, 0, UAIState_CutWood_Tree(), n"FP_CUTWOOD_COHSEL", 500);
    default Schedule(13, 30, UAIState_Cook(), n"IO_UL_PAN_COHSEL", 500);
    default Schedule(15, 0, UAIState_Eat_Seated(), n"IO_COHSEL_STOOL", 500);
    default Schedule(16, 40, UAIState_CutWood_Trunk(), n"IO_CUTLOG_COHSEL", 500);
    default Schedule(19, 30, UAIState_CutWood_Tree(), n"FP_CUTWOOD_COHSEL", 500);
    default Schedule(21, 30, UAIState_Cook(), n"IO_Cohsel_Cauldron_01", 500);
	default Schedule(22, 30, UAIState_SitAround(), n"IO_COHSEL_STOOL", 500);

    default ScheduleIfRaining(9, 30, UAIState_Drink(), n"IO_COHSEL_STOOL_02", 500);
    default ScheduleIfRaining(14, 30, UAIState_Eat_Seated(), n"IO_COHSEL_STOOL_02", 500);
    default ScheduleIfRaining(18, 30, UAIState_SitAround(), n"IO_COHSEL_STOOL_02", 500);
    default ScheduleIfRaining(22, 30, UAIState_Sleep(), n"IO_UL_BED_COHSEL", 500);
}