UCLASS()
class UAIAgentConfig_Human_NC_BAU_Peasant05_914 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_NC_BAU_Peasant05_914::StaticClass();

}



UCLASS()
class UDailyRoutine_NC_BAU_Peasant05_914_Start : UAIState_DailyRoutine_Human
{
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_NewCamp_Exterior_RiceFields_Huts_04);
    default KnownPlaces.Add(Location::Bed, n"IO_NC_BED_PEASANT914_CM");
    default KnownPlaces.Add(Location::Home, n"IO_NC_BED_PEASANT914_CM");

    default Schedule(6, 45, UAIState_Eat(), n"FP_NC_CAMPFIRE_05");
    default Schedule(7, 20, UAIState_PickRice(), n"FP_NC_PICKRICE_11");
    default Schedule(13, 3, UAIState_Eat(), n"FP_NC_PICKRICE_11");
    default Schedule(13, 32, UAIState_PickRice(), n"FP_NC_PICKRICE_11");
    default Schedule(20, 20, UAIState_SitAround(), n"IO_NC_CHAIR_BENCH_33");
    default Schedule(21, 0, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);

    default ScheduleIfRaining(6, 45, UAIState_RainShelter(), n"FP_NC_RAINSHELTER_05", 300);
    default ScheduleIfRaining(21, 0, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
}