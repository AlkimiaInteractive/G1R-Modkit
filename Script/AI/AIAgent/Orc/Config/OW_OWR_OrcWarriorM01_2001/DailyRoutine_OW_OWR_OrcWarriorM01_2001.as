UCLASS()
class UAIAgentConfig_Orc_OW_OWR_OrcWarriorM01_2001 : UAIAgentConfig_Orc
{
    default m_CharacterDefinition = UCharacterDefinition_Orc_OW_OWR_OrcWarriorM01_2001::StaticClass();
}

class UDailyRoutine_OW_OWR_OrcWarriorM01_2001_Start : UAIState_DailyRoutine_Creature
{
    default Schedule(8, 0, UAIState_Orc_GuardPassage(), n"FP_OA_GUARD_01");
}