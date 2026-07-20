UCLASS()
class UAIAgentConfig_Orc_OW_OWR_OrcFighterM15_2056 : UAIAgentConfig_Orc
{
    default m_CharacterDefinition = UCharacterDefinition_Orc_OW_OWR_OrcFighterM15_2056::StaticClass();
}

class UDailyRoutine_OW_OWR_OrcFighterM15_2056_Start : UAIState_DailyRoutine_Creature
{
    default Schedule(7, 0, UAIState_StandAround(), n"FP_OT_ORC_GROUND_2", 800);
    default Schedule(10, 0, UAIState_Orc_GuardPassage(), n"FP_OT_ORC_GROUND_2", 800);
    default Schedule(13, 0, UAIState_Eat(), n"FP_OT_ORC_STAND_42", 800);
    default Schedule(15, 0, UAIState_Drink(), n"FP_OT_ORC_GROUND_03", 800);
    default Schedule(17, 0, UAIState_Orc_SitOnGround(), n"FP_OT_ORC_GROUND_02", 800);
    default Schedule(20, 0, UAIState_StandAround(), n"FP_OT_ORC_STAND_42", 800);
    default Schedule(20, 0, UAIState_Orc_GuardPassage(), n"FP_OT_ORC_GROUND_2", 800);
}