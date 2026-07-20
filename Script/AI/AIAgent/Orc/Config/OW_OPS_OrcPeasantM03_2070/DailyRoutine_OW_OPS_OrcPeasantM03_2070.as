UCLASS()
class UAIAgentConfig_Orc_OW_OPS_OrcPeasantM03_2070 : UAIAgentConfig_Orc
{
    default m_CharacterDefinition = UCharacterDefinition_Orc_OW_OPS_OrcPeasantM03_2070::StaticClass();
}

class UDailyRoutine_OW_OPS_OrcPeasantM03_2070_AfterFight : UAIState_DailyRoutine_Creature
{
    default Schedule(7, 30, UAIState_Smalltalk(), n"FP_OTOWN_SMALLTALK_03");
    default Schedule(13, 0, UAIState_Orc_Eat(), n"FP_OTOWN_STAND_03", 300);
    default Schedule(14, 0, UAIState_Orc_StandAroundWithEat(), n"FP_OTOWN_STAND_08", 300);
    default Schedule(20, 30, UAIState_Dance(), n"FP_OTOWN_DANCE_03");
    default Schedule(0, 30, UAIState_Sleep(), n"FP_OTOWN_SLEEP_03");
}

class UDailyRoutine_OW_OPS_OrcPeasantM03_2070_Start : UAIState_DailyRoutine_Creature
{
    default OwnedGameplayTags.AddTag(GameplayTag::AIState_DailyRoutine_WatchFight);

    default Schedule(7, 0, UAIState_Orc_Cheering(), n"FP_OTOWN_STAND_42");
}