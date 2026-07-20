UCLASS()
class UAIAgentConfig_Orc_OW_OPS_OrcPeasantM10_2077 : UAIAgentConfig_Orc
{
    default m_CharacterDefinition = UCharacterDefinition_Orc_OW_OPS_OrcPeasantM10_2077::StaticClass();
}

class UDailyRoutine_OW_OPS_OrcPeasantM10_2077_Start : UAIState_DailyRoutine_Creature
{
    default Schedule(9, 30, UAIState_Orc_SmashFood(), n"IO_OTOWN_SMASH_03"); 
    default Schedule(21, 10, UAIState_Orc_LeatherWorking(), n"IO_OTOWN_TANNER_01", 300);
    default Schedule(0, 35, UAIState_Sleep(), n"FP_OTOWN_SLEEP_10");
}