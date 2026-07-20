UCLASS()
class UAIAgentConfig_Orc_OW_OPS_OrcPeasantM12_2079 : UAIAgentConfig_Orc
{
    default m_CharacterDefinition = UCharacterDefinition_Orc_OW_OPS_OrcPeasantM12_2079::StaticClass();
}

class UDailyRoutine_OW_OPS_OrcPeasantM12_2079_Start : UAIState_DailyRoutine_Creature
{
    default Schedule(9, 05, UAIState_Orc_SmashFood(), n"IO_OTOWN_SMASH_04");
    default Schedule(23, 15, UAIState_Sleep(), n"FP_OTOWN_SLEEP_12");
}