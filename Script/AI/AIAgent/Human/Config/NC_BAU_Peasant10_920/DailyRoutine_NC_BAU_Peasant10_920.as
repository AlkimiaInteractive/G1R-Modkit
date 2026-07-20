UCLASS()
class UAIAgentConfig_Human_NC_BAU_Peasant10_920 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_NC_BAU_Peasant10_920::StaticClass();

}



UCLASS()
class UDailyRoutine_NC_BAU_Peasant10_920_Start : UAIState_DailyRoutine_Human
{
    
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_NewCamp_Exterior_RiceFields_Huts_02);
    default KnownPlaces.Add(Location::Bed, n"IO_NC_BED_PEASANT920");
    default KnownPlaces.Add(Location::Home, n"IO_NC_BED_PEASANT920");

    default Schedule(7, 40, UAIState_PickRice(), n"FP_NC_PICKRICE_27");
    default Schedule(13, 0, UAIState_Eat(), n"FP_NC_PICKRICE_27");
    default Schedule(13, 30, UAIState_PickRice(), n"FP_NC_PICKRICE_27");
    default Schedule(20, 26, UAIState_Campfire(), n"FP_NC_CAMPFIRE_07");
    default Schedule(23, 2, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);

    default ScheduleIfRaining(7, 40, UAIState_RainShelter(), n"FP_NC_RAINSHELTER_13", 300);
    default ScheduleIfRaining(23, 2, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
}