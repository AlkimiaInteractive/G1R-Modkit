UCLASS()
class UAIAgentConfig_Orc_OW_OSM_OrcShamanM02_2065 : UAIAgentConfig_Orc_Shaman
{
    default m_CharacterDefinition = UCharacterDefinition_Orc_OW_OSM_OrcShamanM02_2065::StaticClass();
}

class UDailyRoutine_OW_OSM_OrcShamanM02_2065_Start : UAIState_DailyRoutine_Creature
{
    default Schedule(7, 0, UAIState_Orc_Pray(), n"FP_OTOWN_PRAY_02");
}