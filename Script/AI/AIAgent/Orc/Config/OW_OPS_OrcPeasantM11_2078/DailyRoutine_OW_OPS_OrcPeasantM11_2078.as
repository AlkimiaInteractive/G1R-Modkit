UCLASS()
class UAIAgentConfig_Orc_OW_OPS_OrcPeasantM11_2078 : UAIAgentConfig_Orc
{
    default m_CharacterDefinition = UCharacterDefinition_Orc_OW_OPS_OrcPeasantM11_2078::StaticClass();
}

class UDailyRoutine_OW_OPS_OrcPeasantM11_2078_Start : UAIState_DailyRoutine_Creature
{
    default Schedule(8, 30, UAIState_Orc_LeatherWorking(), n"IO_OTOWN_TANNER_01");
    default Schedule(14, 0, UAIState_Orc_EatOnGround(), n"FP_OTOWN_GROUND_01", 300); 
    default Schedule(20, 20, UAIState_Orc_EatOnGround(), n"FP_OTOWN_GROUND_08", 300);
    default Schedule(23, 35, UAIState_Sleep(), n"FP_OTOWN_SLEEP_11");
}