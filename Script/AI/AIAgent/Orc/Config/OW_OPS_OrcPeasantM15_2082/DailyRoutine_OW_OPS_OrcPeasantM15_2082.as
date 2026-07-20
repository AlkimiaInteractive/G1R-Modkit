UCLASS()
class UAIAgentConfig_Orc_OW_OPS_OrcPeasantM15_2082 : UAIAgentConfig_Orc
{
    default m_CharacterDefinition = UCharacterDefinition_Orc_OW_OPS_OrcPeasantM15_2082::StaticClass();
}

class UDailyRoutine_OW_OPS_OrcPeasantM15_2082_Start : UAIState_DailyRoutine_Creature
{
    default Schedule(9, 0, UAIState_Orc_SmashFood_Standing(), n"IO_OTOWN_SMASH_07");
    default Schedule(23, 50, UAIState_Sleep(), n"FP_OTOWN_SLEEP_15");
}