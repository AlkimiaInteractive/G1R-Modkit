UCLASS()
class UAIAgentConfig_Orc_OW_OWR_OrcWarriorM14_2028 : UAIAgentConfig_Orc
{
    default m_CharacterDefinition = UCharacterDefinition_Orc_OW_OWR_OrcWarriorM14_2028::StaticClass();
}

class UDailyRoutine_OW_OWR_OrcWarriorM14_2028_AfterFight : UAIState_DailyRoutine_Creature
{
    default Schedule(7, 0, UAISTate_Guard_Patrolling_Route_OrcWarriorM14_2028(), n"PP_OrcEnclave_Entrance_Area_1");
}

class UDailyRoutine_OW_OWR_OrcWarriorM14_2028_Fight : UAIState_DailyRoutine_Orc
{
    default OwnedGameplayTags.AddTag(GameplayTag::AIState_DailyRoutine_WatchFight);
    default Schedule(7, 0, UAIState_Orc_Cheering(), n"FP_OTOWN_STAND_41");
}

class UDailyRoutine_OW_OWR_OrcWarriorM14_2028_Start : UAIState_DailyRoutine_Orc
{
    default Schedule(7, 0, UAIState_Orc_GuardPassage(), n"FP_OTOWN_GUARD_30");
    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}


UCLASS()
class UAISTate_Guard_Patrolling_Route_OrcWarriorM14_2028 : UAIState_RandomInteractions_ChainedSpots_Human
{
    default ChanceToDoActionOnSpot = 1.f; // 1.f => try to perform an action on every spot on the way

    default SpotNames.Add(n"PP_OrcEnclave_Entrance_Area_1");
    default SpotNames.Add(n"PP_OrcEnclave_Entrance_Area_2");
    default SpotNames.Add(n"PP_OrcEnclave_Entrance_Area_3");
    default SpotNames.Add(n"PP_OrcEnclave_Entrance_Area_4");
    default SpotNames.Add(n"PP_OrcEnclave_Entrance_Area_5");
    default SpotNames.Add(n"PP_OrcEnclave_Entrance_Area_4");
    default SpotNames.Add(n"PP_OrcEnclave_Entrance_Area_3");
    default SpotNames.Add(n"PP_OrcEnclave_Entrance_Area_2");

    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_GuardPassage));
}