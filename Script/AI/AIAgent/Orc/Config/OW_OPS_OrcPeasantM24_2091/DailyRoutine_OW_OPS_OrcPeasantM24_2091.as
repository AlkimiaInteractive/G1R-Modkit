UCLASS()
class UAIAgentConfig_Orc_OW_OPS_OrcPeasantM24_2091 : UAIAgentConfig_Orc
{
    default m_CharacterDefinition = UCharacterDefinition_Orc_OW_OPS_OrcPeasantM24_2091::StaticClass();
}

class UDailyRoutine_OW_OPS_OrcPeasantM24_2091_Start : UAIState_DailyRoutine_Creature
{
    default Schedule(8, 30, UAIState_Orc_SitOnGround(), n"FP_OTOWN_GROUND_04");
    default Schedule(13, 20, UAIState_Orc_Eat(), n"FP_OTOWN_STAND_24", 300);
    default Schedule(17, 10, UAIState_StandAround(), n"FP_OTOWN_STAND_24", 300);
    default Schedule(21, 30, UAIState_Dance(), n"FP_OTOWN_DANCE_07");
    default Schedule(0, 10, UAIState_Sleep(), n"FP_OTOWN_SLEEP_24");
}