UCLASS()
class UAIAgentConfig_Human_NC_BAU_Peasant13_923 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_NC_BAU_Peasant13_923::StaticClass();

}



UCLASS()
class UDailyRoutine_NC_BAU_Peasant13_923_Start : UDailyRoutines_Peasants
{
    
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_NewCamp_Exterior_RiceFields_Huts_02);
    default KnownPlaces.Add(Location::Bed, n"IO_NC_BED_PEASANT923");
    default KnownPlaces.Add(Location::Home, n"IO_NC_BED_PEASANT923");

    //default Schedule(7, 5, UAIState_WashSelf_and_Work(n"FP_NC_WASHSELF_03"), n"FP_NC_PICKRICE_17");
    default Schedule(7, 5, UAIState_QueueWashThenPickRice(), n"FP_NC_PICKRICE_17");
    //default Schedule(7, 23, UAIState_PickRice(), n"FP_NC_PICKRICE_17");
    default Schedule(13, 0, UAIState_Eat(), n"FP_NC_PICKRICE_17");
    default Schedule(13, 25, UAIState_PickRice(), n"FP_NC_PICKRICE_17");
    default Schedule(20, 5, UAIState_Campfire(), n"FP_NC_CAMPFIRE_04");
    default Schedule(21, 45, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);

    default ScheduleIfRaining(7, 5, UAIState_RainShelter_Digger(), n"FP_NC_RAINSHELTER_20");
    default ScheduleIfRaining(21, 45, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
}