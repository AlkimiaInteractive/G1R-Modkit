UCLASS()
class UAIAgentConfig_Orc_OW_OWR_OrcFighterM14_2055 : UAIAgentConfig_Orc
{
    default m_CharacterDefinition = UCharacterDefinition_Orc_OW_OWR_OrcFighterM14_2055::StaticClass();
}

class UDailyRoutine_OW_OWR_OrcFighterM14_2055_Start : UAIState_DailyRoutine_Creature
{
    default Schedule(7, 30, UAIState_StandAround(), n"FP_OT_ORC_STAND_43", 800);
    default Schedule(10, 30, UAIState_Orc_GuardPassage(), n"FP_OT_ORC_STAND_40", 800);
    default Schedule(13, 30, UAIState_Eat(), n"FP_OT_ORC_GROUND_01", 800);
    default Schedule(15, 30, UAIState_Drink(), n"FP_OT_ORC_GROUND_02", 800);
    default Schedule(17, 30, UAIState_Orc_SitOnGround(), n"FP_OT_ORC_GROUND_03", 800);
    default Schedule(20, 30, UAIState_StandAround(), n"FP_OT_ORC_STAND_43", 800);
    default Schedule(22, 00, UAIState_Orc_GuardPassage(), n"FP_OT_ORC_STAND_40", 800);
}