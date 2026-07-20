UCLASS()
class UAIAgentConfig_Orc_OW_OWR_OrcWarriorM23_2038 : UAIAgentConfig_Orc
{
    default m_CharacterDefinition = UCharacterDefinition_Orc_OW_OWR_OrcWarriorM23_2038::StaticClass();
}

class UDailyRoutine_OW_OWR_OrcWarriorM23_2038_Start : UAIState_DailyRoutine_Orc
{
    default Schedule(7, 0, UAISTate_Guard_Patrolling_Route_OrcWarriorM23_2038(), n"PP_OrcEnclave_Platforms_1");
}

UCLASS()
class UAISTate_Guard_Patrolling_Route_OrcWarriorM23_2038 : UAIState_RandomInteractions_ChainedSpots_Human
{
    default ChanceToDoActionOnSpot = 1.f; // 1.f => try to perform an action on every spot on the way

    default SpotNames.Add(n"PP_OrcEnclave_Platforms_1");
    default SpotNames.Add(n"PP_OrcEnclave_Platforms_2");
    default SpotNames.Add(n"PP_OrcEnclave_Platforms_3");
    default SpotNames.Add(n"PP_OrcEnclave_Platforms_4");
    default SpotNames.Add(n"PP_OrcEnclave_Platforms_5");
    default SpotNames.Add(n"PP_OrcEnclave_Platforms_6");
    default SpotNames.Add(n"PP_OrcEnclave_Platforms_7");
    default SpotNames.Add(n"PP_OrcEnclave_Platforms_8");
    default SpotNames.Add(n"PP_OrcEnclave_Platforms_9");
    default SpotNames.Add(n"PP_OrcEnclave_Platforms_10");
    default SpotNames.Add(n"PP_OrcEnclave_Platforms_11");
    default SpotNames.Add(n"PP_OrcEnclave_Platforms_12");
    default SpotNames.Add(n"PP_OrcEnclave_Platforms_13");
    default SpotNames.Add(n"PP_OrcEnclave_Platforms_14");
    default SpotNames.Add(n"PP_OrcEnclave_Platforms_15");
    default SpotNames.Add(n"PP_OrcEnclave_Platforms_16");
    default SpotNames.Add(n"PP_OrcEnclave_Platforms_17");
    default SpotNames.Add(n"PP_OrcEnclave_Platforms_18");
    default SpotNames.Add(n"PP_OrcEnclave_Platforms_4");
    default SpotNames.Add(n"PP_OrcEnclave_Platforms_3");
    default SpotNames.Add(n"PP_OrcEnclave_Platforms_2");

    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_GuardPassage));
}