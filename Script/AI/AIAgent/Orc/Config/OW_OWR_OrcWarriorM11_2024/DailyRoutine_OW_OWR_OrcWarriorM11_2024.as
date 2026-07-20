UCLASS()
class UAIAgentConfig_Orc_OW_OWR_OrcWarriorM11_2024 : UAIAgentConfig_Orc
{
    default m_CharacterDefinition = UCharacterDefinition_Orc_OW_OWR_OrcWarriorM11_2024::StaticClass();
}

class UDailyRoutine_OW_OWR_OrcWarriorM11_2024_Start : UAIState_DailyRoutine_Orc
{
    default Schedule(7, 0, UAISTate_Guard_Patrolling_Route_OrcWarriorM11_2024(), n"PP_OrcEnclave_EntranceTowerLeft_1");
}

UCLASS()
class UAISTate_Guard_Patrolling_Route_OrcWarriorM11_2024 : UAIState_RandomInteractions_ChainedSpots_Human
{
    default ChanceToDoActionOnSpot = 1.f; // 1.f => try to perform an action on every spot on the way

    default SpotNames.Add(n"PP_OrcEnclave_EntranceTowerLeft_1");
    default SpotNames.Add(n"PP_OrcEnclave_EntranceTowerLeft_2");
    default SpotNames.Add(n"PP_OrcEnclave_EntranceTowerLeft_3");
    default SpotNames.Add(n"PP_OrcEnclave_EntranceTowerLeft_4");

    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_GuardPassage));
}