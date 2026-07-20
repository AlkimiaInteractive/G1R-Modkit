UCLASS()
class UAIAgentConfig_Human_SC_NOV_Novice39_1350 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_SC_NOV_Novice39_1350::StaticClass();

}

UCLASS()
class UDailyRoutine_SC_NOV_Novice39_1350_Ownership : UAIState_DailyRoutine_Human
{
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_SwampCamp_Village_Huts_15);
    default KnownPlaces.Add(Location::Bed, n"IO_SC_BED_NOVICE39");
    default KnownPlaces.Add(Location::Home, n"IO_SC_BED_NOVICE39");
}


UCLASS()
class UDailyRoutine_SC_NOV_Novice39_1350_Start : UDailyRoutine_SC_NOV_Novice39_1350_Ownership
{
    default Schedule(0, 0, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
    default Schedule(7, 0, UAIState_Eat(), n"IO_SC_BENCH_25", 200);
    default Schedule(8, 30, UAIState_Guard(), n"FP_SC_GUARD_14");
    default Schedule(22, 30, UAIState_Eat(), n"IO_SC_BENCH_25", 200);
}

UCLASS()
class UDailyRoutine_SC_NOV_Novice39_1350_Ritual : UDailyRoutine_SC_NOV_Novice39_1350_Ownership
{
    default Schedule(8, 00, UAIState_StandAround(), n"FP_SC_PROPHECY_15");
    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}
