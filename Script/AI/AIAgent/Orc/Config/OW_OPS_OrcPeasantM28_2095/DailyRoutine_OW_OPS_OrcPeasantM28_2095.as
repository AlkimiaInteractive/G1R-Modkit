UCLASS()
class UAIAgentConfig_Orc_OW_OPS_OrcPeasantM28_2095 : UAIAgentConfig_Orc
{
    default m_CharacterDefinition = UCharacterDefinition_Orc_OW_OPS_OrcPeasantM28_2095::StaticClass();
}

class UDailyRoutine_OW_OPS_OrcPeasantM28_2095_Start : UAIState_DailyRoutine_Creature
{
    default Schedule(8, 0, UAIState_Orc_SmashFood_Standing(), n"IO_OTOWN_SMASH_11");
    default Schedule(21, 20, UAIState_Orc_Dance(), n"FP_OTOWN_DANCE_09");
    default Schedule(0, 0, UAIState_Sleep(), n"FP_OTOWN_SLEEP_19");
}