UCLASS()
class UAIAgentConfig_Human_SC_NOV_Novice10_1317 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_SC_NOV_Novice10_1317::StaticClass();

}

UCLASS()
class UDailyRoutine_SC_NOV_Novice10_1317_Ownership : UAIState_DailyRoutine_Human
{
    default KnownPlaces.Add(Location::Bed, n"IO_SC_BED_NOVICE10");
    default KnownPlaces.Add(Location::Home, n"IO_SC_BED_NOVICE10");
}

UCLASS()
class UDailyRoutine_SC_NOV_Novice10_1317_Start : UDailyRoutine_SC_NOV_Novice10_1317_Ownership
{
    default Schedule(7, 25, UAIState_Eat(), n"FP_SC_SIT_GROUND_01");
    default Schedule(8, 0, UAIState_Smalltalk(), n"FP_SC_SMALLTALK_10");
    default Schedule(12, 56, UAIState_Eat(), n"FP_SC_SIT_GROUND_01");
    default Schedule(13, 56, UAIState_Smalltalk(), n"FP_SC_SMALLTALK_10");
    default Schedule(21, 30, UAIState_Eat(), n"FP_SC_SIT_GROUND_01");
    default Schedule(22, 30, UAIState_Smalltalk(), n"FP_SC_SMALLTALK_10");
    default Schedule(23, 0, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);

}

UCLASS()
class UDailyRoutine_SC_NOV_Novice10_1317_Ritual : UDailyRoutine_SC_NOV_Novice10_1317_Ownership
{
    default Schedule(8, 00, UAIState_StandAround(), n"FP_SC_PROPHECY_25");
    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}

UCLASS()
class UDailyRoutine_SC_NOV_Novice10_1317_AfterRitual : UDailyRoutine_SC_NOV_Novice10_1317_Ownership
{
    default Schedule(8, 00, UAIState_Drained(), n"FP_SC_PROPHECY_25");
    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}