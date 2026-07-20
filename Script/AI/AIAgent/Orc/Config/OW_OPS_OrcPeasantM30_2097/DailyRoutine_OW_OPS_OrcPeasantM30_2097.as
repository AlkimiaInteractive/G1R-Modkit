UCLASS()
class UAIAgentConfig_Orc_OW_OPS_OrcPeasantM30_2097 : UAIAgentConfig_Orc
{
    default m_CharacterDefinition = UCharacterDefinition_Orc_OW_OPS_OrcPeasantM30_2097::StaticClass();
}

class UDailyRoutine_OW_OPS_OrcPeasantM30_2097_Start : UAIState_DailyRoutine_Creature
{
    default Schedule(9, 30, UAIState_Smalltalk(), n"FP_OTOWN_SMALLTALK_07", 300);
    default Schedule(13, 0, UAIState_Orc_SmashFood_Standing(), n"IO_OTOWN_SMASH_01");
    default Schedule(21, 10, UAIState_Orc_Dance(), n"FP_OTOWN_DANCE_11");
    default Schedule(22, 30, UAIState_Orc_SmashFood_Standing(), n"IO_OTOWN_SMASH_01");
    default Schedule(0, 30, UAIState_Sleep(), n"FP_OTOWN_SLEEP_20");
}