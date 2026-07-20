UCLASS()
class UAIAgentConfig_Orc_OW_OPS_OrcPeasantM13_2080 : UAIAgentConfig_Orc
{
    default m_CharacterDefinition = UCharacterDefinition_Orc_OW_OPS_OrcPeasantM13_2080::StaticClass();
}

class UDailyRoutine_OW_OPS_OrcPeasantM13_2080_Start : UAIState_DailyRoutine_Creature
{
    default Schedule(9, 25, UAIState_Orc_SmashFood(), n"IO_OTOWN_SMASH_05");
    default Schedule(23, 30, UAIState_Sleep(), n"FP_OTOWN_SLEEP_13");
}