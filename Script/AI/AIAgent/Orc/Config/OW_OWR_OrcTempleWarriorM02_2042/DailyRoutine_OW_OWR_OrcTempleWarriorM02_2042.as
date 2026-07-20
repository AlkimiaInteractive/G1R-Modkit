UCLASS()
class UAIAgentConfig_Orc_OW_OWR_OrcTempleWarriorM02_2042 : UAIAgentConfig_Orc
{
    default m_CharacterDefinition = UCharacterDefinition_Orc_OW_OWR_OrcTempleWarriorM02_2042::StaticClass();
}

class UDailyRoutine_OW_OWR_OrcTempleWarriorM02_2042_Start : UAIState_DailyRoutine_Creature
{
    default Schedule(7, 0, UAIState_Orc_GuardPassage(), n"FP_OTOWN_GUARD_28");
}