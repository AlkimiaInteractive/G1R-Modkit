UCLASS()
class UAIAgentConfig_Human_SC_NOV_Novice30_1341 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_SC_NOV_Novice30_1341::StaticClass();

}



UCLASS()
class UDailyRoutine_SC_NOV_Novice30_1341_Start : UAIState_DailyRoutine_Human
{
    default Schedule(22, 30, UAIState_Pray(), n"FP_SC_MEDITATE_07");
}

UCLASS()
class UDailyRoutine_SC_NOV_Novice30_1341_Ritual : UAIState_DailyRoutine_Human
{
    default Schedule(8, 00, UAIState_StandAround(), n"FP_SC_PROPHECY_36");
    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}

UCLASS()
class UDailyRoutine_SC_NOV_Novice30_1341_AfterRitual : UAIState_DailyRoutine_Human
{
    default Schedule(8, 00, UAIState_Shout(), n"FP_SC_PROPHECY_END_16");
    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}