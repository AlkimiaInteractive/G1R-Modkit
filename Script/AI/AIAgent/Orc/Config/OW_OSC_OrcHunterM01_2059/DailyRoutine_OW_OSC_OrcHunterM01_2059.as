UCLASS()
class UAIAgentConfig_Orc_OW_OSC_OrcHunterM01_2059 : UAIAgentConfig_Orc
{
    default m_CharacterDefinition = UCharacterDefinition_Orc_OW_OSC_OrcHunterM01_2059::StaticClass();
}

class UDailyRoutine_OW_OSC_OrcHunterM01_2059_Start : UAIState_DailyRoutine_Creature
{
    default Schedule(8, 0, UAIState_Orc_StandAround(), n"FP_OTOWN_STAND_51");
}
