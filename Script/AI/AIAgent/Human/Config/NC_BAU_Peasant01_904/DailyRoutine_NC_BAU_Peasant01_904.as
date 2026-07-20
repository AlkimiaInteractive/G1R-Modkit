UCLASS()
class UAIAgentConfig_Human_NC_BAU_Peasant01_904 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_NC_BAU_Peasant01_904::StaticClass();

}



UCLASS()
class UDailyRoutine_NC_BAU_Peasant01_904_Start : UDailyRoutines_Peasants
{
    
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_NewCamp_Exterior_RiceFields_Huts_02);
    default KnownPlaces.Add(Location::Bed, n"IO_NC_BED_PEASANT904");
    default KnownPlaces.Add(Location::Home, n"IO_NC_BED_PEASANT904");

    //default Schedule(7, 0, UAIState_WashSelf_and_Work(n"FP_NC_WASHSELF_03"), n"FP_NC_PICKRICE_13");
    default Schedule(7, 5, UAIState_QueueWashThenPickRice(), n"FP_NC_PICKRICE_21");
    //default Schedule(7, 35, UAIState_PickRice(), n"FP_NC_PICKRICE_13");
    default Schedule(13, 0, UAIState_Eat(), n"FP_NC_PICKRICE_13");
    default Schedule(13, 30, UAIState_PickRice(), n"FP_NC_PICKRICE_13");
    default Schedule(20, 30, UAIState_Campfire(), n"IO_NC_CHAIR_BENCH_33");
    default Schedule(23, 0, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);

    default ScheduleIfRaining(7, 5, UAIState_RainShelter(), n"FP_NC_RAINSHELTER_04", 300);
    default ScheduleIfRaining(23, 0, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
}