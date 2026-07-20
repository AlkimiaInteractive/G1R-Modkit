UCLASS()
class UAIAgentConfig_Human_NC_BAU_Peasant09_919 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_NC_BAU_Peasant09_919::StaticClass();

}



UCLASS()
class UDailyRoutine_NC_BAU_Peasant09_919_Start : UAIState_DailyRoutine_Human
{
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_NewCamp_Exterior_RiceFields_Huts_01);
    default KnownPlaces.Add(Location::Bed, n"IO_NC_BED_PEASANT919");
    default KnownPlaces.Add(Location::Home, n"IO_NC_BED_PEASANT919");

    default Schedule(7, 40, UAIState_PickRice(), n"FP_NC_PICKRICE_37");
    default Schedule(13, 0, UAIState_Eat(), n"FP_NC_PICKRICE_37");
    default Schedule(13, 30, UAIState_PickRice(), n"FP_NC_PICKRICE_37");
    default Schedule(20, 26, UAIState_Drink(), n"IO_NC_CHAIR_BENCH_40");
    default Schedule(23, 2, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);

    default ScheduleIfRaining(7, 40, UAIState_RainShelter(), n"FP_NC_RAINSHELTER_12", 300);
    default ScheduleIfRaining(23, 2, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
}