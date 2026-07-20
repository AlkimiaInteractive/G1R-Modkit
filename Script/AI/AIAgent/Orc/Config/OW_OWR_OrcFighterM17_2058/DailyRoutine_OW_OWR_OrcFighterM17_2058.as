UCLASS()
class UAIAgentConfig_Orc_OW_OWR_OrcFighterM17_2058 : UAIAgentConfig_Orc
{
    default m_CharacterDefinition = UCharacterDefinition_Orc_OW_OWR_OrcFighterM17_2058::StaticClass();
}

class UDailyRoutine_OW_OWR_OrcFighterM17_2058_Start : UAIState_DailyRoutine_Creature
{
    default Schedule(7, 20, UAIState_StandAround(), n"FP_OT_ORC_GROUND_05", 800);
    default Schedule(10, 20, UAIState_Orc_GuardPassage(), n"FP_OT_ORC_STAND_44", 800);
    default Schedule(13, 20, UAIState_Eat(), n"FP_OT_ORC_GROUND_05", 800);
    default Schedule(15, 20, UAIState_Drink(), n"FP_OT_ORC_GROUND_05", 800);
    default Schedule(17, 20, UAIState_Orc_SitOnGround(), n"FP_OT_ORC_STAND_56", 800);
    default Schedule(20, 20, UAIState_StandAround(), n"FP_OT_ORC_STAND_56", 800);
    default Schedule(22, 00, UAIState_Orc_GuardPassage(), n"FP_OT_ORC_STAND_44", 800);
}