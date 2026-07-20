UCLASS()
class UAIAgentConfig_Orc_OW_OWR_OrcWarriorM09_2022 : UAIAgentConfig_Orc
{
    default m_CharacterDefinition = UCharacterDefinition_Orc_OW_OWR_OrcWarriorM09_2022::StaticClass();
}

class UDailyRoutine_OW_OWR_OrcWarriorM09_2022_Start : UAIState_DailyRoutine_Creature
{
    default Schedule(7, 0, UAIState_Orc_GuardPassage(), n"FP_OTOWN_GUARD_01");
}