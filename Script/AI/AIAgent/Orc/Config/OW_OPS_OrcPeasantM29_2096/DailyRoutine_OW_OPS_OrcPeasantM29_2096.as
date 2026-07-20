UCLASS()
class UAIAgentConfig_Orc_OW_OPS_OrcPeasantM29_2096 : UAIAgentConfig_Orc
{
    default m_CharacterDefinition = UCharacterDefinition_Orc_OW_OPS_OrcPeasantM29_2096::StaticClass();
}

class UDailyRoutine_OW_OPS_OrcPeasantM29_2096_Start : UAIState_DailyRoutine_Creature
{
    default Schedule(7, 0, UAIState_Orc_SmashFood(), n"IO_OTOWN_SMASH_12");
    default Schedule(13, 35, UAIState_Orc_EatOnGround(), n"FP_OTOWN_GROUND_06", 300);
    default Schedule(20, 10, UAIState_Orc_Dance(), n"FP_OTOWN_DANCE_10");
    default Schedule(0, 40, UAIState_Sleep(), n"FP_OTOWN_SLEEP_16");

}

