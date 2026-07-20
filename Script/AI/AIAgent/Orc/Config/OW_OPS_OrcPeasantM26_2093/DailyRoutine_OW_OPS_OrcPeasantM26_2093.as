UCLASS()
class UAIAgentConfig_Orc_OW_OPS_OrcPeasantM26_2093 : UAIAgentConfig_Orc
{
    default m_CharacterDefinition = UCharacterDefinition_Orc_OW_OPS_OrcPeasantM26_2093::StaticClass();
}

class UDailyRoutine_OW_OPS_OrcPeasantM26_2093_Start : UAIState_DailyRoutine_Creature
{
    default Schedule(9, 0, UAIState_Orc_SmashFood_Standing(), n"IO_OTOWN_SMASH_10");
    default Schedule(23, 0, UAIState_Sleep(), n"FP_OTOWN_SLEEP_26");
}