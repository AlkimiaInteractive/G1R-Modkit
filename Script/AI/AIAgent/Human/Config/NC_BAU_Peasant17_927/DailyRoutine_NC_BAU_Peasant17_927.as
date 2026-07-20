UCLASS()
class UAIAgentConfig_Human_NC_BAU_Peasant17_927 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_NC_BAU_Peasant17_927::StaticClass();

}



UCLASS()
class UDailyRoutine_NC_BAU_Peasant17_927_Start : UAIState_DailyRoutine_Human
{
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_NewCamp_Exterior_RiceFields_Huts_03);
    default KnownPlaces.Add(Location::Bed, n"IO_NC_BED_PEASANT927");
    default KnownPlaces.Add(Location::Home, n"IO_NC_BED_PEASANT927");

    default Schedule(7, 25, UAIState_PickRice(), n"FP_NC_PICKRICE_09");
    default Schedule(13, 14, UAIState_Eat(), n"FP_NC_PICKRICE_09");
    default Schedule(14, 0, UAIState_PickRice(), n"FP_NC_PICKRICE_09");
    default Schedule(20, 25, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);

    default ScheduleIfRaining(7, 25, UAIState_RainShelter(), Location::Home);
    default ScheduleIfRaining(20, 25, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
}