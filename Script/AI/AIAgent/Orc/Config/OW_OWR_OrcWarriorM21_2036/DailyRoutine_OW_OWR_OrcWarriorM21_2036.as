UCLASS()
class UAIAgentConfig_Orc_OW_OWR_OrcWarriorM21_2036 : UAIAgentConfig_Orc
{
    default m_CharacterDefinition = UCharacterDefinition_Orc_OW_OWR_OrcWarriorM21_2036::StaticClass();
}

class UDailyRoutine_OW_OWR_OrcWarriorM21_2036_Start : UAIState_DailyRoutine_Creature
{
    default Schedule(7, 0, UAIState_Orc_GuardPassage(), n"FP_OTOWN_GUARD_15");
    default Schedule(22, 0, UAIState_Orc_GuardPassage(), n"FP_OTOWN_GUARD_23");
}