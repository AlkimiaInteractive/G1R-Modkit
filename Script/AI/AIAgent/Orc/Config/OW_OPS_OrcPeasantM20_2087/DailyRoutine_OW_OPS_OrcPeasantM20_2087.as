UCLASS()
class UAIAgentConfig_Orc_OW_OPS_OrcPeasantM20_2087 : UAIAgentConfig_Orc
{
    default m_CharacterDefinition = UCharacterDefinition_Orc_OW_OPS_OrcPeasantM20_2087::StaticClass();
}

class UDailyRoutine_OW_OPS_OrcPeasantM20_2087_AfterFight : UAIState_DailyRoutine_Creature
{
    default Schedule(8, 30, UAIState_Smalltalk(), n"FP_OTOWN_SMALLTALK_02");
    default Schedule(14, 10, UAIState_Orc_EatOnGround(), n"FP_OTOWN_CAMPFIRE_03", 300); 
    default Schedule(17, 40, UAIState_Orc_StandAround(), n"FP_OTOWN_STAND_15");
    default Schedule(20, 10, UAIState_Orc_EatOnGround(), n"FP_OTOWN_CAMPFIRE_04", 300); 
    default Schedule(21, 30, UAIState_Dance(), n"FP_OTOWN_DANCE_04");
    default Schedule(0, 40, UAIState_Orc_EatOnGround(), n"FP_OTOWN_CAMPFIRE_04", 300); 
}

class UDailyRoutine_OW_OPS_OrcPeasantM20_2087_Start : UAIState_DailyRoutine_Creature
{
    default OwnedGameplayTags.AddTag(GameplayTag::AIState_DailyRoutine_WatchFight);

    default Schedule(7, 0, UAIState_Orc_Cheering(), n"FP_OTOWN_STAND_40");
    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}
