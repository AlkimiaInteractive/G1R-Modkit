UCLASS()
class UAIAgentConfig_Human_SC_NOV_Novice14_1321 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_SC_NOV_Novice14_1321::StaticClass();

}

UCLASS()
class UDailyRoutine_SC_NOV_Novice14_1321_Ownership : UAIState_DailyRoutine_Human
{
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_SwampCamp_Village_Huts_16);
    default KnownPlaces.Add(Location::Bed, n"IO_SC_BED_NOVICE14");
    default KnownPlaces.Add(Location::Home, n"IO_SC_BED_NOVICE14");
}

UCLASS()
class UDailyRoutine_SC_NOV_Novice14_1321_Start : UDailyRoutine_SC_NOV_Novice14_1321_Ownership
{
    default Schedule(7, 30, UAIState_Eat(), n"IO_SC_CHAIR_13");
    default Schedule(8, 0, UAIState_SitAround(), n"IO_SC_BENCH_34");
    default Schedule(12, 56, UAIState_Eat(), n"IO_SC_BENCH_34");
    default Schedule(13, 56, UAIState_SitAround(), n"IO_SC_BENCH_34");
    default Schedule(21, 30, UAIState_Eat(), n"IO_SC_BENCH_34");
    default Schedule(22, 30, UAIState_SitAround(), n"IO_SC_BENCH_34");
    default Schedule(23, 0, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);

}