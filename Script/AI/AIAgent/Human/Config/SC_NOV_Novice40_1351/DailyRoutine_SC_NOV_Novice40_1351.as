UCLASS()
class UAIAgentConfig_Human_SC_NOV_Novice40_1351 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_SC_NOV_Novice40_1351::StaticClass();

}

UCLASS()
class UDailyRoutine_SC_NOV_Novice40_1351_Ownership : UAIState_DailyRoutine_Human
{
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_SwampCamp_Village_Huts_29);
    default KnownPlaces.Add(Location::Bed, n"IO_SC_BED_NOVICE40");
    default KnownPlaces.Add(Location::Home, n"IO_SC_BED_NOVICE40");
}

UCLASS()
class UDailyRoutine_SC_NOV_Novice40_1351_Start : UDailyRoutine_SC_NOV_Novice40_1351_Ownership
{
    default Schedule(7, 0, UAIState_Eat(), n"IO_SC_BENCH_33");
    default Schedule(8, 30, UAIState_Smith_Fire(), n"IO_SC_FORGE_02");
    default Schedule(21, 0, UAIState_Eat(), n"IO_SC_BENCH_33");
    default Schedule(22, 0, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
}

UCLASS()
class UDailyRoutine_SC_NOV_Novice40_1351_HeroInsideForge : UDailyRoutine_SC_NOV_Novice40_1351_Ownership
{
    default Schedule(7, 0, UAIState_Eat(), n"IO_SC_BENCH_33");
    default Schedule(22, 0, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
}