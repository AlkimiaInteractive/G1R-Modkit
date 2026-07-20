UCLASS()
class UAIAgentConfig_Orc_OW_OSM_OrcShamanM03_2066 : UAIAgentConfig_Orc_Shaman
{
    default m_CharacterDefinition = UCharacterDefinition_Orc_OW_OSM_OrcShamanM03_2066::StaticClass();
}

class UDailyRoutine_OW_OSM_OrcShamanM03_2066_Start : UAIState_DailyRoutine_Creature
{
    default Schedule(7, 0, UAIState_Orc_Pray(), n"FP_OTOWN_PRAY_03");
}