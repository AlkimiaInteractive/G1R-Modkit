UCLASS()
class UAIAgentConfig_Orc_OW_OPS_OrcPeasantM04_2071 : UAIAgentConfig_Orc
{
    default m_CharacterDefinition = UCharacterDefinition_Orc_OW_OPS_OrcPeasantM04_2071::StaticClass();
}

class UDailyRoutine_OW_OPS_OrcPeasantM04_2071_AfterFight : UAIState_DailyRoutine_Creature
{
    default Schedule(7, 30, UAIState_Smalltalk(), n"FP_OTOWN_SMALLTALK_04");
    default Schedule(13, 0, UAIState_Orc_EatOnGround(), n"FP_OTOWN_CAMPFIRE_01", 300);
    default Schedule(14, 15, UAIState_Orc_Campfire(), n"FP_OTOWN_CAMPFIRE_01", 300);
    default Schedule(15, 0, UAIState_Smalltalk(), n"FP_OTOWN_SMALLTALK_04");
    default Schedule(20, 00, UAIState_Orc_PlayDrum(), n"IO_OTOWN_DRUMS_01", 300);
    default Schedule(1, 0, UAIState_Sleep(), n"FP_OTOWN_SLEEP_04");
}

class UDailyRoutine_OW_OPS_OrcPeasantM04_2071_Start : UAIState_DailyRoutine_Creature
{
    default OwnedGameplayTags.AddTag(GameplayTag::AIState_DailyRoutine_WatchFight);

    default Schedule(7, 0, UAIState_Orc_Cheering(), n"FP_OTOWN_STAND_32");
}