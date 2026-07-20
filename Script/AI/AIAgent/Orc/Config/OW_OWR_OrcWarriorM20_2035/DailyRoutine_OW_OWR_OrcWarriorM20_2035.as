UCLASS()
class UAIAgentConfig_Orc_OW_OWR_OrcWarriorM20_2035 : UAIAgentConfig_Orc
{
    default m_CharacterDefinition = UCharacterDefinition_Orc_OW_OWR_OrcWarriorM20_2035::StaticClass();
}

class UDailyRoutine_OW_OWR_OrcWarriorM20_2035_Start : UAIState_DailyRoutine_Creature
{
    default Schedule(7, 0, UAIState_Orc_GuardPassage(), n"FP_OTOWN_GUARD_14");
    default Schedule(22, 0, UAIState_Orc_GuardPassage(), n"FP_OTOWN_GUARD_22");
}