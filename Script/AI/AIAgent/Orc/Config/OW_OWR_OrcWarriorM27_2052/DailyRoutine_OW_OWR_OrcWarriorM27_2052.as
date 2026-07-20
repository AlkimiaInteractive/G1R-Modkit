UCLASS()
class UAIAgentConfig_Orc_OW_OWR_OrcWarriorM27_2052 : UAIAgentConfig_Orc
{
    default m_CharacterDefinition = UCharacterDefinition_Orc_OW_OWR_OrcWarriorM27_2052::StaticClass();
}

class UDailyRoutine_OW_OWR_OrcWarriorM27_2052_Start : UAIState_DailyRoutine_Creature
{
    default Schedule(7, 0, UAISTate_Guard_Watch_Patrolling_Route_OrcWarriorM27(), n"BreadcrumbActor_OrcTerritory_Patrol_Tower02_1");
}