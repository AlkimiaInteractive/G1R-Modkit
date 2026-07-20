UCLASS()
class UAIAgentConfig_Human_SC_NOV_Novice11_1318 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_SC_NOV_Novice11_1318::StaticClass();

}

UCLASS()
class UDailyRoutine_SC_NOV_Novice11_1318_Ownership : UAIState_DailyRoutine_Human
{
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_SwampCamp_Village_Huts_35);
    default KnownPlaces.Add(Location::Bed, n"IO_SC_BED_NOVICE11");
    default KnownPlaces.Add(Location::Home, n"IO_SC_BED_NOVICE11");
}

UCLASS()
class UDailyRoutine_SC_NOV_Novice11_1318_Start : UDailyRoutine_SC_NOV_Novice11_1318_Ownership
{
    default Schedule(7, 25, UAIState_Eat(), n"IO_SC_BENCH_43");
    default Schedule(8, 0, UAIState_Smalltalk(), n"FP_SC_SMALLTALK_20");
    default Schedule(12, 56, UAIState_Eat(), n"IO_SC_BENCH_43");
    default Schedule(13, 56, UAIState_Smalltalk(), n"FP_SC_SMALLTALK_20");
    default Schedule(21, 30, UAIState_Eat(), n"IO_SC_BENCH_43");
    default Schedule(22, 30, UAIState_Smalltalk(), n"FP_SC_SMALLTALK_20");
    default Schedule(23, 0, UAIState_Sleep(), Location::Bed, WaypointRadius = 400);
}