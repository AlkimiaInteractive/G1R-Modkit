UCLASS()
class UAIAgentConfig_Orc_OW_OPS_OrcPeasantM23_2090 : UAIAgentConfig_Orc
{
    default m_CharacterDefinition = UCharacterDefinition_Orc_OW_OPS_OrcPeasantM23_2090::StaticClass();
}

class UDailyRoutine_OW_OPS_OrcPeasantM23_2090_Start : UAIState_DailyRoutine_Creature
{
    default Schedule(8, 0, UAIState_Orc_SitOnGround(), n"FP_OTOWN_GROUND_01");
    default Schedule(12, 50, UAIState_Orc_Eat(), n"FP_OTOWN_STAND_21", 300);
    default Schedule(16, 10, UAIState_StandAround(), n"FP_OTOWN_STAND_21", 300);
    default Schedule(0, 20, UAIState_Sleep(), n"FP_OTOWN_SLEEP_23");
}