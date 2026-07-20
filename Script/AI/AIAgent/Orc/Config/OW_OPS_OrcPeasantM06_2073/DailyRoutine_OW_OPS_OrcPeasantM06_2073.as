UCLASS()
class UAIAgentConfig_Orc_OW_OPS_OrcPeasantM06_2073 : UAIAgentConfig_Orc
{
    default m_CharacterDefinition = UCharacterDefinition_Orc_OW_OPS_OrcPeasantM06_2073::StaticClass();
}

class UDailyRoutine_OW_OPS_OrcPeasantM06_2073_AfterFight : UAIState_DailyRoutine_Orc
{
    default Schedule(8, 30, UAIState_StandAround(), n"FP_OTOWN_STAND_04");
    default Schedule(13, 0, UAIState_Orc_EatOnGround(), n"FP_OTOWN_CAMPFIRE_05", 300);
    default Schedule(16, 0, UAIState_StandAround(), n"FP_OTOWN_STAND_04");
    default Schedule(20, 20, UAIState_Dance(), n"FP_OTOWN_DANCE_06");
    default Schedule(2, 0, UAIState_Sleep(), n"FP_OTOWN_SLEEP_06");
}

class UDailyRoutine_OW_OPS_OrcPeasantM06_2073_Start : UAIState_DailyRoutine_Creature
{
    default OwnedGameplayTags.AddTag(GameplayTag::AIState_DailyRoutine_WatchFight);

    default Schedule(7, 0, UAIState_Orc_Cheering(), n"FP_OTOWN_STAND_33");
}