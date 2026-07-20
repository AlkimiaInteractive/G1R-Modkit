UCLASS()
class UAIAgentConfig_Orc_OW_OWR_OrcWarriorM10_2023 : UAIAgentConfig_Orc
{
    default m_CharacterDefinition = UCharacterDefinition_Orc_OW_OWR_OrcWarriorM10_2023::StaticClass();
}

class UDailyRoutine_OW_OWR_OrcWarriorM10_2023_Start : UAIState_DailyRoutine_Creature
{
    default Schedule(7, 0, UAIState_Orc_GuardPassage(), n"FP_OTOWN_GUARD_02");
}