UCLASS()
class UAIAgentConfig_Orc_OW_OWR_OrcFighterM16_2057 : UAIAgentConfig_Orc
{
    default m_CharacterDefinition = UCharacterDefinition_Orc_OW_OWR_OrcFighterM16_2057::StaticClass();
}

class UDailyRoutine_OW_OWR_OrcFighterM16_2057_Start : UAIState_DailyRoutine_Creature
{
    default Schedule(7, 0, UAIState_StandAround(), n"FP_OT_ORC_GROUND_04", 800);
    default Schedule(10, 0, UAIState_Orc_GuardPassage(), n"FP_OT_ORC_STAND_54", 800);
    default Schedule(13, 0, UAIState_Eat(), n"FP_OT_ORC_STAND_55", 800);
    default Schedule(15, 0, UAIState_Drink(), n"FP_OT_ORC_STAND_55", 800);
    default Schedule(17, 0, UAIState_Orc_SitOnGround(), n"FP_OT_ORC_STAND_45", 800);
    default Schedule(20, 0, UAIState_StandAround(), n"FP_OT_ORC_GROUND_04", 800);
    default Schedule(22, 0, UAIState_Orc_GuardPassage(), n"FP_OT_ORC_STAND_54", 800);
}