UCLASS()
class UAIAgentConfig_Human_SC_NOV_Darrion_1312 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_SC_NOV_Darrion_1312::StaticClass();

}



UCLASS()
class UDailyRoutine_SC_NOV_Darrion_1312_Start : UAIState_DailyRoutine_Human
{
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_SwampCamp_Village_Huts_Darrion);
    default KnownPlaces.Add(Location::Bed, n"IO_SC_BED_DARRION");
    default KnownPlaces.Add(Location::Home, n"IO_SC_BED_DARRION");

    default Schedule(7, 1, UAIState_Eat(), n"FP_SC_EAT_05");
    default Schedule(8, 31, UAISTate_Darrion_Smith(), n"IO_SC_FORGE_01");
    default Schedule(20, 31, UAIState_Eat(), n"IO_SC_BENCH_11");
    default Schedule(22, 1, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
}

UCLASS()
class UDailyRoutine_SC_NOV_Darrion_1312_HeroInsideForge : UAIState_DailyRoutine_Human
{
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_SwampCamp_Village_Huts_Darrion);
    default KnownPlaces.Add(Location::Bed, n"IO_SC_BED_DARRION");
    default KnownPlaces.Add(Location::Home, n"IO_SC_BED_DARRION");

    default Schedule(7, 1, UAIState_Eat(), n"FP_SC_EAT_05");
    default Schedule(8, 31, UAIState_Smith_Fire(), n"IO_SC_FORGE_01");
    default Schedule(20, 31, UAIState_Eat(), n"IO_SC_BENCH_11");
    default Schedule(22, 1, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);

    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}