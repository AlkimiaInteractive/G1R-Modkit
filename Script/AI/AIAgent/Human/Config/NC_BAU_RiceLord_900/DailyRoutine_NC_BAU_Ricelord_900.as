UCLASS()
class UAIAgentConfig_Human_NC_BAU_Ricelord_900 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_NC_BAU_RiceLord_900::StaticClass();

}



UCLASS()
class UDailyRoutine_NC_BAU_Ricelord_900_Start : UAIState_DailyRoutine_Human
{
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_NewCamp_Exterior_RiceFields_Huts_RiceLord_01);
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_NewCamp_Exterior_RiceFields_Huts_RiceLord_02);
    default KnownPlaces.Add(Location::Bed, n"IO_NC_BED_RICELORD900");
    default KnownPlaces.Add(Location::Home, n"IO_NC_BED_RICELORD900");

    default Schedule(0, 0, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
    default Schedule(7, 0, UAIState_Eat(), n"IO_NC_CHAIR_04");
    default Schedule(8, 0, UAIState_Guard(), n"FP_NC_GUARD_13",200);
    default Schedule(13, 0, UAIState_Eat(), n"IO_NC_CHAIR_BENCH_36",200);
    default Schedule(14, 0, UAIState_Guard(), n"FP_NC_GUARD_13",200);
    default Schedule(20, 0, UAIState_SitCampfire(), n"IO_NC_CHAIR_BENCH_28");
}