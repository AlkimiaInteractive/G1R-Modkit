UCLASS()
class UAIAgentConfig_Orc_OW_OWR_OrcWarriorM19_2033 : UAIAgentConfig_Orc
{
    default m_CharacterDefinition = UCharacterDefinition_Orc_OW_OWR_OrcWarriorM19_2033::StaticClass();
}

class UDailyRoutine_OW_OWR_OrcWarriorM19_2033_AfterFight : UAIState_DailyRoutine_Creature
{
    default Schedule(7, 0, UAIState_Orc_GuardPassage(), n"FP_OTOWN_GUARD_12");
}

class UDailyRoutine_OW_OWR_OrcWarriorM19_2033_Start : UAIState_DailyRoutine_Creature
{
    default OwnedGameplayTags.AddTag(GameplayTag::AIState_DailyRoutine_WatchFight);

    default Schedule(7, 0, UAIState_Orc_Cheering(), n"FP_OTOWN_STAND_37");
}