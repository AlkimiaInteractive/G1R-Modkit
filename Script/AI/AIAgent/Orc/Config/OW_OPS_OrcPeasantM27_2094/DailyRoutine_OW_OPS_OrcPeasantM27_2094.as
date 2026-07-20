UCLASS()
class UAIAgentConfig_Orc_OW_OPS_OrcPeasantM27_2094 : UAIAgentConfig_Orc
{
    default m_CharacterDefinition = UCharacterDefinition_Orc_OW_OPS_OrcPeasantM27_2094::StaticClass();
}

class UDailyRoutine_OW_OPS_OrcPeasantM27_2094_Start : UAIState_DailyRoutine_Creature
{
    default Schedule(8, 0, UAIState_Orc_StandAround(), n"FP_OTOWN_STAND_43");
    //default Schedule(13, 0, UAIState_Orc_Eat(), n"FP_OTOWN_STAND_23", 300);
    default Schedule(17, 0, UAIState_Orc_StandAround(), n"FP_OTOWN_STAND_43", 300);
    default Schedule(20, 20, UAIState_Orc_Dance(), n"FP_OTOWN_DANCE_08");
    default Schedule(1, 0, UAIState_Sleep(), n"FP_OTOWN_SLEEP_27");
}