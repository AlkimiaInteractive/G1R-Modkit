UCLASS()
class UAIAgentConfig_Human_SC_NOV_Novice22_1329 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_SC_NOV_Novice22_1329::StaticClass();

}

UCLASS()
class UDailyRoutine_SC_NOV_Novice22_1329_Ownership : UAIState_DailyRoutine_Human
{
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_SwampCamp_Village_Huts_19);
    default KnownPlaces.Add(Location::Bed, n"IO_SC_BED_NOVICE22_CM");
    default KnownPlaces.Add(Location::Home, n"IO_SC_BED_NOVICE22_CM");
}

UCLASS()
class UDailyRoutine_SC_NOV_Novice22_1329_Start : UDailyRoutine_SC_NOV_Novice22_1329_Ownership
{
    default Schedule(0, 0, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
    default Schedule(6, 30, UAIState_Eat(), n"IO_SC_BENCH_39");
    default Schedule(7, 0, UAIState_PickRice(), n"FP_SC_PICKRICE_02");
    default Schedule(12, 56, UAIState_Rest(), n"FP_SC_PICKRICE_03");
    default Schedule(13, 56, UAIState_PickRice(), n"FP_SC_PICKRICE_02");
    default Schedule(21, 30, UAIState_Cook(), n"IO_SC_CAMPFIRE_PAN_06");
}