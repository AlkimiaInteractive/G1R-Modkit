UCLASS()
class UAIAgentConfig_Human_SC_NOV_Novice25_1336 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_SC_NOV_Novice25_1336::StaticClass();

}

UCLASS()
class UDailyRoutine_SC_NOV_Novice25_1336_Ownership : UAIState_DailyRoutine_Human
{
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_SwampCamp_Village_Huts_Nyras);
    default KnownPlaces.Add(Location::Bed, n"IO_SC_BED_NOVICE25");
    default KnownPlaces.Add(Location::Home, n"IO_SC_BED_NOVICE25");
}

UCLASS()
class UDailyRoutine_SC_NOV_Novice25_1336_Start : UDailyRoutine_SC_NOV_Novice25_1336_Ownership
{
    default Schedule(2, 0, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
    default Schedule(7, 30, UAIState_Eat(), n"IO_SC_CHAIR_18");
    default Schedule(8, 0, UAIState_Listen(), n"FP_SC_LISTEN_02");
    default Schedule(12, 56, UAIState_Meditate(), n"FP_SC_LISTEN_02");
    default Schedule(13, 56, UAIState_Smoke_Ground(), n"IO_SC_WATERPIPE_05");
    default Schedule(21, 30, UAIState_Meditate(), n"FP_SC_LISTEN_02");
    default Schedule(22, 30, UAIState_Listen(), n"FP_SC_LISTEN_02");
}

UCLASS()
class UDailyRoutine_SC_NOV_Novice25_1336_Ritual : UDailyRoutine_SC_NOV_Novice25_1336_Ownership
{
    default Schedule(8, 00, UAIState_StandAround(), n"FP_SC_PROPHECY_30");
    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}

UCLASS()
class UDailyRoutine_SC_NOV_Novice25_1336_AfterRitual : UDailyRoutine_SC_NOV_Novice25_1336_Ownership
{
    default Schedule(8, 00, UAIState_Drained(), n"FP_SC_PROPHECY_49");
    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}