UCLASS()
class UAIAgentConfig_Human_NC_BAU_Peasant08_917 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_NC_BAU_Peasant08_917::StaticClass();

}



UCLASS()
class UDailyRoutine_NC_BAU_Peasant08_917_Start : UAIState_DailyRoutine_Human
{
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_NewCamp_Exterior_RiceFields_Huts_04);
    default KnownPlaces.Add(Location::Bed, n"IO_NC_BED_PEASANT917");
    default KnownPlaces.Add(Location::Home, n"IO_NC_BED_PEASANT917");

    default Schedule(7, 35, UAIState_PickRice(), n"FP_NC_PICKRICE_34");
    default Schedule(13, 3, UAIState_Eat(), n"FP_NC_PICKRICE_34");
    default Schedule(13, 34, UAIState_PickRice(), n"FP_NC_PICKRICE_34");
    default Schedule(20, 25, UAIState_Campfire(), n"FP_NC_CAMPFIRE_07");
    default Schedule(22, 8, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);

    default ScheduleIfRaining(7, 35, UAIState_RainShelter(), n"FP_NC_RAINSHELTER_11", 300);
    default ScheduleIfRaining(22, 8, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
}