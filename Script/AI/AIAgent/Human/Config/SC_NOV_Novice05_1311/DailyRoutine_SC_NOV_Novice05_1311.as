UCLASS()
class UAIAgentConfig_Human_SC_NOV_Novice05_1311 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_SC_NOV_Novice05_1311::StaticClass();

}

UCLASS()
class UDailyRoutine_SC_NOV_Novice05_1311_Ownership : UAIState_DailyRoutine_Human
{
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_SwampCamp_Village_Huts_36);
    default KnownPlaces.Add(Location::Bed, n"IO_SC_BED_NOVICE05_CM");
    default KnownPlaces.Add(Location::Home, n"IO_SC_BED_NOVICE05_CM");
}

UCLASS()
class UDailyRoutine_SC_NOV_Novice05_1311_Start : UDailyRoutine_SC_NOV_Novice05_1311_Ownership
{
    default Schedule(0, 0, UAIState_Sleep(), Location::Bed, WaypointRadius = 300);
    default Schedule(7, 25, UAIState_Eat(), n"IO_SC_BENCH_13");
    default Schedule(8, 0, UAIState_Smalltalk(), n"FP_SC_SMALLTALK_04");
    default Schedule(12, 56, UAIState_Eat(), n"IO_SC_BENCH_13");
    default Schedule(13, 56, UAIState_Smalltalk(), n"FP_SC_SMALLTALK_04");
    default Schedule(21, 30, UAIState_Eat(), n"IO_SC_BENCH_13");
    default Schedule(22, 30, UAIState_Smalltalk(), n"FP_SC_SMALLTALK_04");
}