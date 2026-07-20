UCLASS()
class UAIAgentConfig_Orc_OW_OPS_OrcPeasantM17_2084 : UAIAgentConfig_Orc
{
    default m_CharacterDefinition = UCharacterDefinition_Orc_OW_OPS_OrcPeasantM17_2084::StaticClass();
}

class UDailyRoutine_OW_OPS_OrcPeasantM17_2084_Start : UAIState_DailyRoutine_Creature
{
    default OwnedGameplayTags.AddTag(GameplayTag::AIState_DailyRoutine_WatchFight);

    default Schedule(7, 40, UAIState_StandAround(), n"FP_OTOWN_STAND_12");
    default Schedule(13, 45, UAIState_Orc_Eat(), n"FP_OTOWN_STAND_12", 300); 
    default Schedule(17, 0, UAIState_Orc_Campfire(), n"FP_OTOWN_CAMPFIRE_01");
    default Schedule(20, 35, UAIState_Orc_EatOnGround(), n"FP_OTOWN_CAMPFIRE_01", 300); 
    default Schedule(22, 10, UAIState_Orc_SitOnFloor(), n"FP_OTOWN_SIT_01"); 
}