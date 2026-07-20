UCLASS()
class UAIAgentConfig_Orc_OW_OPS_OrcPeasantM08_2075 : UAIAgentConfig_Orc
{
    default m_CharacterDefinition = UCharacterDefinition_Orc_OW_OPS_OrcPeasantM08_2075::StaticClass();
}

class UDailyRoutine_OW_OPS_OrcPeasantM08_2075_Start : UAIState_DailyRoutine_Creature
{
    default Schedule(8, 30, UAIState_SitAround(), n"FP_OTOWN_GROUND_03");
    default Schedule(10, 0, UAIState_Smalltalk(), n"FP_OTOWN_SMALLTALK_05");
    default Schedule(13, 35, UAIState_Orc_EatOnGround(), n"FP_OTOWN_GROUND_05", 300);
    default Schedule(17, 0, UAIState_Orc_LeatherWorking(), n"IO_OTOWN_TANNER_01");
    default Schedule(23, 15, UAIState_Sleep(), n"FP_OTOWN_SLEEP_08");
}