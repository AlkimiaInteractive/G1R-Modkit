UCLASS()
class UAIAgentConfig_Orc_OW_OPS_OrcPeasantM07_2074 : UAIAgentConfig_Orc
{
    default m_CharacterDefinition = UCharacterDefinition_Orc_OW_OPS_OrcPeasantM07_2074::StaticClass();
}

class UDailyRoutine_OW_OPS_OrcPeasantM07_2074_Start : UAIState_DailyRoutine_Creature
{
    default Schedule(8, 0, UAIState_SitAround(), n"FP_OTOWN_GROUND_02");
    default Schedule(10, 0, UAIState_Smalltalk(), n"FP_OTOWN_SMALLTALK_06");
    default Schedule(13, 45, UAIState_Orc_EatOnGround(), n"FP_OTOWN_GROUND_04", 300);
    default Schedule(20, 10, UAIState_Dance(), n"FP_OTOWN_DANCE_05");
    default Schedule(23, 10, UAIState_Sleep(), n"FP_OTOWN_SLEEP_07");
}