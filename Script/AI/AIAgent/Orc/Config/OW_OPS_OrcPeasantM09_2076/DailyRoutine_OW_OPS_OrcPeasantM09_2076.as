UCLASS()
class UAIAgentConfig_Orc_OW_OPS_OrcPeasantM09_2076 : UAIAgentConfig_Orc
{
    default m_CharacterDefinition = UCharacterDefinition_Orc_OW_OPS_OrcPeasantM09_2076::StaticClass();
}

class UDailyRoutine_OW_OPS_OrcPeasantM09_2076_Start : UAIState_DailyRoutine_Creature
{
    default Schedule(6, 30, UAIState_Orc_Butcher(), n"IO_OTOWN_BUTCHER_01");
    default Schedule(15, 0, UAIState_StandAround(), n"FP_OTOWN_STAND_14", 300);
    default Schedule(17, 30, UAIState_Orc_Butcher(), n"IO_OTOWN_BUTCHER_01");
    default Schedule(0, 30, UAIState_Sleep(), n"FP_OTOWN_SLEEP_09");
}