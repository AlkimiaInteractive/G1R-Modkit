UCLASS()
class UAIAgentConfig_Orc_OW_OPS_OrcPeasantM19_2086 : UAIAgentConfig_Orc
{
    default m_CharacterDefinition = UCharacterDefinition_Orc_OW_OPS_OrcPeasantM19_2086::StaticClass();
}

class UDailyRoutine_OW_OPS_OrcPeasantM19_2086_AfterFight : UAIState_DailyRoutine_Creature
{
    default Schedule(8, 30, UAIState_Smalltalk(), n"FP_OTOWN_SMALLTALK_01");
    default Schedule(13, 45, UAIState_Orc_EatOnGround(), n"FP_OTOWN_CAMPFIRE_06", 300); 
    default Schedule(17, 20, UAIState_Orc_StandAround(), n"FP_OTOWN_STAND_09");
    default Schedule(19, 30, UAIState_Orc_EatOnGround(), n"FP_OTOWN_CAMPFIRE_06", 300); 
    default Schedule(21, 0, UAIState_Orc_PlayDrum(), n"IO_OTOWN_DRUMS_04", 300); 
    default Schedule(0, 30, UAIState_Orc_EatOnGround(), n"FP_OTOWN_CAMPFIRE_06", 300); 
}

class UDailyRoutine_OW_OPS_OrcPeasantM19_2086_Start : UAIState_DailyRoutine_Creature
{
    default OwnedGameplayTags.AddTag(GameplayTag::AIState_DailyRoutine_WatchFight);

    default Schedule(7, 0, UAIState_Orc_Cheering(), n"FP_OTOWN_STAND_07");
    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}
