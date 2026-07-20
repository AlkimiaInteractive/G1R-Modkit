UCLASS()
class UAIAgentConfig_Orc_OW_OWR_OrcWarriorM18_2032 : UAIAgentConfig_Orc
{
    default m_CharacterDefinition = UCharacterDefinition_Orc_OW_OWR_OrcWarriorM18_2032::StaticClass();
}

class UDailyRoutine_OW_OWR_OrcWarriorM18_2032_AfterFight : UAIState_DailyRoutine_Creature
{
    default Schedule(7, 0, UAIState_Orc_GuardPassage(), n"FP_OTOWN_GUARD_11");
}

class UDailyRoutine_OW_OWR_OrcWarriorM18_2032_Start : UAIState_DailyRoutine_Creature
{
    default OwnedGameplayTags.AddTag(GameplayTag::AIState_DailyRoutine_WatchFight);
    default Schedule(7, 0, UAIState_Orc_Cheering(), n"FP_OTOWN_STAND_39");
}