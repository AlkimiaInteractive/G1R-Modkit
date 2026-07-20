UCLASS()
class UAIAgentConfig_Orc_OW_OPS_OrcPeasantM01_2068 : UAIAgentConfig_Orc
{
    default m_CharacterDefinition = UCharacterDefinition_Orc_OW_OPS_OrcPeasantM01_2068::StaticClass();
}

class UDailyRoutine_OW_OPS_OrcPeasantM01_2068_AfterFight : UAIState_DailyRoutine_Creature
{
    default Schedule(7, 0, UAIState_Orc_SitOnFloor(), n"FP_OTOWN_SIT_01");
    //default Schedule(14, 0, UAIState_Orc_Eat(), n"FP_OTOWN_STAND_01", 300);
    default Schedule(15, 0, UAIState_Orc_StandAround(), n"FP_OTOWN_STAND_06");
    default Schedule(17, 0, UAIState_Smalltalk(), n"FP_OTOWN_SMALLTALK_01");
    default Schedule(21, 0, UAIState_Dance(), n"FP_OTOWN_DANCE_01");
    default Schedule(0, 0, UAIState_Sleep(), n"FP_OTOWN_SLEEP_01");
}

class UDailyRoutine_OW_OPS_OrcPeasantM01_2068_Start : UAIState_DailyRoutine_Creature
{
    default OwnedGameplayTags.AddTag(GameplayTag::AIState_DailyRoutine_WatchFight);

    default Schedule(7, 0, UAIState_Orc_Cheering(), n"FP_OTOWN_STAND_34");
}

