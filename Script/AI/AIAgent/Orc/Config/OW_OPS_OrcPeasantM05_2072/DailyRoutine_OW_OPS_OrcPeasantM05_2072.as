UCLASS()
class UAIAgentConfig_Orc_OW_OPS_OrcPeasantM05_2072 : UAIAgentConfig_Orc
{
    default m_CharacterDefinition = UCharacterDefinition_Orc_OW_OPS_OrcPeasantM05_2072::StaticClass();
}

class UDailyRoutine_OW_OPS_OrcPeasantM05_2072_AfterFight : UAIState_DailyRoutine_Creature
{
    default Schedule(8, 30, UAIState_StandAround(), n"FP_OTOWN_STAND_29");
    default Schedule(13, 0, UAIState_Orc_EatOnGround(), n"FP_OTOWN_CAMPFIRE_02", 300);
    default Schedule(14, 0, UAIState_Orc_Campfire(), n"FP_OTOWN_CAMPFIRE_02", 300);
    default Schedule(15, 0, UAIState_Smalltalk(), n"FP_OTOWN_SMALLTALK_03");
    default Schedule(20, 0, UAIState_Orc_PlayDrum(), n"IO_OTOWN_DRUMS_02", 300);
    default Schedule(1, 0, UAIState_Sleep(), n"FP_OTOWN_SLEEP_05");
}

class UDailyRoutine_OW_OPS_OrcPeasantM05_2072_Start : UAIState_DailyRoutine_Creature
{
    default OwnedGameplayTags.AddTag(GameplayTag::AIState_DailyRoutine_WatchFight);

    default Schedule(7, 0, UAIState_Orc_Cheering(), n"FP_OTOWN_STAND_38");
}