UCLASS()
class UAIAgentConfig_Orc_OW_OWR_OrcWarriorM28_2054 : UAIAgentConfig_Orc
{
    default m_CharacterDefinition = UCharacterDefinition_Orc_OW_OWR_OrcWarriorM28_2054::StaticClass();
}

class UDailyRoutine_OW_OWR_OrcWarriorM28_2054_Start : UAIState_DailyRoutine_Creature
{
    default Schedule(7, 0, UAISTate_Guard_Watch_Patrolling_Route_OrcWarriorM28(), n"BreadcrumbActor_OrcTerritory_Patrol_Tower03_1");
}