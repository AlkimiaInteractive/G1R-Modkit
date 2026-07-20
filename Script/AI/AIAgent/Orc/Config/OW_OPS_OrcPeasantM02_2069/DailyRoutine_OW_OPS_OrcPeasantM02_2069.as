UCLASS()
class UAIAgentConfig_Orc_OW_OPS_OrcPeasantM02_2069 : UAIAgentConfig_Orc
{
    default m_CharacterDefinition = UCharacterDefinition_Orc_OW_OPS_OrcPeasantM02_2069::StaticClass();
}

class UDailyRoutine_OW_OPS_OrcPeasantM02_2069_AfterFight : UAIState_DailyRoutine_Creature
{
    default Schedule(8, 0, UAIState_Orc_Feeding(), n"FP_OTOWN_FEED_01");
    //default Schedule(13, 30, UAIState_Orc_Eat(), n"FP_OTOWN_STAND_02", 300);
    default Schedule(15, 0, UAIState_Orc_StandAround(), n"FP_OTOWN_STAND_05");
    default Schedule(17, 0, UAIState_Smalltalk(), n"FP_OTOWN_SMALLTALK_02");
    default Schedule(21, 0, UAIState_Orc_Dance(), n"FP_OTOWN_DANCE_02");
    default Schedule(0, 15, UAIState_Sleep(), n"FP_OTOWN_SLEEP_02");
}

class UDailyRoutine_OW_OPS_OrcPeasantM02_2069_Start : UAIState_DailyRoutine_Creature
{
    default OwnedGameplayTags.AddTag(GameplayTag::AIState_DailyRoutine_WatchFight);

    default Schedule(7, 0, UAIState_Orc_Cheering(), n"FP_OTOWN_STAND_35");
}