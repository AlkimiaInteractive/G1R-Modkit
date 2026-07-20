UCLASS()
class UAIAgentConfig_Orc_OW_OSC_OrcScoutM22_2205 : UAIAgentConfig_Orc
{
    default m_CharacterDefinition = UCharacterDefinition_Orc_OW_OSC_OrcScoutM22_2205::StaticClass();
}

UCLASS()
class UDailyRoutine_OW_OSC_OrcScoutM22_2205_Start : UAIState_DailyRoutine_Orc
{
	default Schedule(12, 0, UAIState_Orc_StandAround(), n"FP_GUARD_ORC_201");
    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}