UCLASS()
class UAIAgentConfig_Orc_OW_OPS_OrcPeasantM25_2092 : UAIAgentConfig_Orc
{
    default m_CharacterDefinition = UCharacterDefinition_Orc_OW_OPS_OrcPeasantM25_2092::StaticClass();
}

class UDailyRoutine_OW_OPS_OrcPeasantM25_2092_Start : UAIState_DailyRoutine_Creature
{
    default Schedule(8, 0, UAIState_Orc_SitOnGround(), n"FP_OTOWN_GROUND_05");
    default Schedule(13, 00, UAIState_Orc_Eat(), n"FP_OTOWN_STAND_20", 300);
    default Schedule(17, 0, UAIState_StandAround(), n"FP_OTOWN_STAND_20", 300);
    default Schedule(21, 00, UAIState_Orc_PlayDrum(), n"IO_OTOWN_DRUMS_03");
    default Schedule(1, 0, UAIState_Sleep(), n"FP_OTOWN_SLEEP_25");
}