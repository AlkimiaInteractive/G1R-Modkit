UCLASS()
class UAIAgentConfig_Human_NC_BAU_Peasant12_922 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_NC_BAU_Peasant12_922::StaticClass();

}



UCLASS()
class UDailyRoutine_NC_BAU_Peasant12_922_Start : UDailyRoutines_Peasants
{
    
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_NewCamp_Exterior_RiceFields_Huts_02);
    default KnownPlaces.Add(Location::Bed, n"IO_NC_BED_PEASANT922");
    default KnownPlaces.Add(Location::Home, n"IO_NC_BED_PEASANT922");

    //default Schedule(7, 0, UAIState_WashSelf_and_Work(n"FP_NC_WASHSELF_03"), n"FP_NC_PICKRICE_01");
    default Schedule(7, 0, UAIState_QueueWashThenPickRice(), n"FP_NC_PICKRICE_01");
    //default Schedule(7, 18, UAIState_PickRice(), n"FP_NC_PICKRICE_01");
    default Schedule(13, 0, UAIState_Eat(), n"FP_NC_PICKRICE_01");
    default Schedule(13, 27, UAIState_PickRice(), n"FP_NC_PICKRICE_01");
    default Schedule(20, 0, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);

    default ScheduleIfRaining(7, 0, UAIState_RainShelter(), n"IO_NC_CHAIR_PEASANT",500);
    default ScheduleIfRaining(20, 0, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
}