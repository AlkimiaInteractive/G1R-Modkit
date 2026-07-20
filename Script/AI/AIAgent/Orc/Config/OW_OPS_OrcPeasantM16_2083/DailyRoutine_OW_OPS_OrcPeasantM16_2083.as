UCLASS()
class UAIAgentConfig_Orc_OW_OPS_OrcPeasantM16_2083 : UAIAgentConfig_Orc
{
    default m_CharacterDefinition = UCharacterDefinition_Orc_OW_OPS_OrcPeasantM16_2083::StaticClass();
}

class UDailyRoutine_OW_OPS_OrcPeasantM16_2083_Start : UAIState_DailyRoutine_Creature
{
    default Schedule(22, 15, UAIState_Orc_Feeding(), n"FP_OTOWN_FEED_01");
}