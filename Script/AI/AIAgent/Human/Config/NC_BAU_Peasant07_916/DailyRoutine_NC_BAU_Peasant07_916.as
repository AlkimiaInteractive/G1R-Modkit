UCLASS()
class UAIAgentConfig_Human_NC_BAU_Peasant07_916 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_NC_BAU_Peasant07_916::StaticClass();

}



UCLASS()
class UDailyRoutine_NC_BAU_Peasant07_916_Start : UDailyRoutines_Peasants
{
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_NewCamp_Exterior_RiceFields_Huts_03);
    default KnownPlaces.Add(Location::Bed, n"IO_NC_BED_PEASANT916");
    default KnownPlaces.Add(Location::Home, n"IO_NC_BED_PEASANT916");

    //default Schedule(7, 0, UAIState_WashSelf_and_Work(n"FP_NC_WASHSELF_03"), n"FP_NC_PICKRICE_20");
    default Schedule(7, 0, UAIState_QueueWashThenPickRice(), n"FP_NC_PICKRICE_20");
    //default Schedule(7, 20, UAIState_PickRice(), n"FP_NC_PICKRICE_20");
    default Schedule(13, 0, UAIState_Eat(), n"FP_NC_PICKRICE_20");
    default Schedule(13, 30, UAIState_PickRice(), n"FP_NC_PICKRICE_20");
    default Schedule(20, 30, UAIState_StandAround(), n"FP_NC_RAINSHELTER_06",100);
    default Schedule(23, 0, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);

    default ScheduleIfRaining(7, 0, UAIState_RainShelter(), n"FP_NC_RAINSHELTER_06", 300);
    default ScheduleIfRaining(23, 0, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
}