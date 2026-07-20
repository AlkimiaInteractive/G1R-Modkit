UCLASS()
class UAIAgentConfig_Human_SC_NOV_Novice19_1326 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_SC_NOV_Novice19_1326::StaticClass();

}

UCLASS()
class UDailyRoutine_SC_NOV_Novice19_1326_Ownership : UAIState_DailyRoutine_Human
{
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_SwampCamp_Village_Huts_15);
    default KnownPlaces.Add(Location::Bed, n"IO_SC_BED_NOVICE19");
    default KnownPlaces.Add(Location::Home, n"IO_SC_BED_NOVICE19");
}

UCLASS()
class UDailyRoutine_SC_NOV_Novice19_1326_Start : UDailyRoutine_SC_NOV_Novice19_1326_Ownership
{
    default Schedule(7, 0, UAIState_Eat(), n"IO_SC_CHAIR_16", 300);
    default Schedule(7, 30, UAIState_Listen(), n"FP_SC_LISTEN_04", 200);
    default Schedule(12, 56, UAIState_Meditate(), n"FP_SC_LISTEN_04", 200);
    default Schedule(13, 56, UAIState_Listen(), n"FP_SC_LISTEN_04", 200);
    default Schedule(21, 30, UAIState_Meditate(), n"FP_SC_LISTEN_04", 200);
    default Schedule(22, 30, UAIState_Smoke_Ground(), n"IO_SC_WATERPIPE_05", 200);
    default Schedule(23, 5, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
}

UCLASS()
class UDailyRoutine_SC_NOV_Novice19_1326_AfterRitual : UDailyRoutine_SC_NOV_Novice19_1326_Ownership
{
    // default Schedule(8, 00, UAIState_Shout(), n"FP_SC_PROPHECY_END_2");
    // default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;

    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_SwampCamp_Village_Huts_15);
    default KnownPlaces.Add(Location::Bed, n"IO_SC_BED_NOVICE19");
    default KnownPlaces.Add(Location::Home, n"IO_SC_BED_NOVICE19");

    default Schedule(7, 0, UAIState_Eat(), n"IO_SC_CHAIR_16", 300);
    default Schedule(7, 30, UAIState_Listen(), n"FP_SC_LISTEN_04", 200);
    default Schedule(12, 56, UAIState_Meditate(), n"FP_SC_LISTEN_04", 200);
    default Schedule(13, 56, UAIState_Listen(), n"FP_SC_LISTEN_04", 200);
    default Schedule(21, 30, UAIState_Meditate(), n"FP_SC_LISTEN_04", 200);
    default Schedule(22, 30, UAIState_Smoke_Ground(), n"IO_SC_WATERPIPE_05", 200);
    default Schedule(23, 5, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
}