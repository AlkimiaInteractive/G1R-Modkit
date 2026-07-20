UCLASS()
class UAIAgentConfig_Human_SC_NOV_Novice33_1344 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_SC_NOV_Novice33_1344::StaticClass();

}



UCLASS()
class UDailyRoutine_SC_NOV_Novice33_1344_Start : UAIState_DailyRoutine_Human
{
    default Schedule(22, 30, UAIState_Pray(), n"FP_SC_MEDITATE_03");
}

UCLASS()
class UDailyRoutine_SC_NOV_Novice33_1344_Ritual : UAIState_DailyRoutine_Human
{
    default Schedule(8, 00, UAIState_StandAround(), n"FP_SC_PROPHECY_4");
    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}

UCLASS()
class UDailyRoutine_SC_NOV_Novice33_1344_AfterRitual : UAIState_DailyRoutine_Human
{
    default Schedule(8, 00, UAIState_Shout(), n"FP_SC_PROPHECY_END_17");
    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}