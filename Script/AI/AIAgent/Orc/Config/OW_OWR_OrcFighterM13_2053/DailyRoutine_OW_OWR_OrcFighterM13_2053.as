UCLASS()
class UAIAgentConfig_Orc_OW_OWR_OrcFighterM13_2053 : UAIAgentConfig_Orc
{
    default m_CharacterDefinition = UCharacterDefinition_Orc_OW_OWR_OrcFighterM13_2053::StaticClass();
}

class UDailyRoutine_OW_OWR_OrcFighterM13_2053_Start : UAIState_DailyRoutine_Creature
{
    default Schedule(7, 0, UAIState_Orc_GuardPassage(), n"FP_OT_ORC_GUARD_01");
    default Schedule(13, 0, UAIState_Orc_GuardPassage(), n"FP_OT_ORC_GUARD_02");
    default Schedule(20, 0, UAIState_Orc_GuardPassage(), n"FP_OT_ORC_GUARD_03");
}