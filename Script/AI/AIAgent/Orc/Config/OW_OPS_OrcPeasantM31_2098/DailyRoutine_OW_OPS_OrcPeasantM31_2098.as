UCLASS()
class UAIAgentConfig_Orc_OW_OPS_OrcPeasantM31_2098 : UAIAgentConfig_Orc
{
    default m_CharacterDefinition = UCharacterDefinition_Orc_OW_OPS_OrcPeasantM31_2098::StaticClass();
}

class UDailyRoutine_OW_OPS_OrcPeasantM31_2098_Start : UAIState_DailyRoutine_Creature
{
    default Schedule(9, 30, UAIState_Smalltalk(), n"FP_OTOWN_SMALLTALK_08"); 
    default Schedule(15, 0, UAIState_Orc_SmashFood_Standing(), n"IO_OTOWN_SMASH_14");
    default Schedule(21, 10, UAIState_Orc_Dance(), n"FP_OTOWN_DANCE_12");
    default Schedule(22, 45, UAIState_Orc_SmashFood_Standing(), n"IO_OTOWN_SMASH_14");
    default Schedule(0, 30, UAIState_Sleep(), n"FP_OTOWN_SLEEP_17");
}