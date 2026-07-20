UCLASS()
class UAIAgentConfig_Orc_OW_OWR_OrcWarriorM15_2029 : UAIAgentConfig_Orc
{
    default m_CharacterDefinition = UCharacterDefinition_Orc_OW_OWR_OrcWarriorM15_2029::StaticClass();
}

class UDailyRoutine_OW_OWR_OrcWarriorM15_2029_AfterFight : UAIState_DailyRoutine_Creature
{
    default Schedule(7, 0, UAIState_Orc_GuardPassage(), n"FP_OTOWN_GUARD_17");
    default Schedule(17, 0, UAIState_Orc_GuardPassage(), n"FP_OTOWN_GUARD_29");
}

class UDailyRoutine_OW_OWR_OrcWarriorM15_2029_Fight : UAIState_DailyRoutine_Orc
{
    default OwnedGameplayTags.AddTag(GameplayTag::AIState_DailyRoutine_WatchFight);

    default Schedule(7, 0, UAIState_Orc_Cheering(), n"FP_OTOWN_STAND_36");
}


class UDailyRoutine_OW_OWR_OrcWarriorM15_2029_Start : UAIState_DailyRoutine_Orc
{
    default Schedule(7, 0, UAIState_Orc_GuardPassage(), n"FP_OTOWN_GUARD_29");
    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}