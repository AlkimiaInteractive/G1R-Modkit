UCLASS()
class UAIAgentConfig_Orc_OW_OBL_OrcBlacksmith01_2063 : UAIAgentConfig_Orc
{
    default m_CharacterDefinition = UCharacterDefinition_Orc_OW_OBL_OrcBlacksmith01_2063::StaticClass();
}

class UDailyRoutine_OW_OBL_OrcBlacksmith01_2063_Start : UAIState_DailyRoutine_Creature
{
    default Schedule(7, 0, UAISTate_Orc_Smith(), n"IO_OTOWN_FORGE_01");
}
