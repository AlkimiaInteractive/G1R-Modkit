UCLASS()
class UAIAgentConfig_Human_NC_BAU_Pock_902 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_NC_BAU_Pock_902::StaticClass();

}



UCLASS()
class UDailyRoutine_NC_BAU_Pock_902_Start : UAIState_DailyRoutine_Human
{
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_NewCamp_Exterior_RiceFields_Huts_03);
    default KnownPlaces.Add(Location::Bed, n"IO_NC_BED_POCK");
    default KnownPlaces.Add(Location::Home, n"IO_NC_BED_POCK");

    default Schedule(7, 15, UAIState_PickRice(), n"FP_NC_PICKRICE_07");
    default Schedule(13, 0, UAIState_Eat(), n"FP_NC_PICKRICE_07");
    default Schedule(13, 30, UAIState_PickRice(), n"FP_NC_PICKRICE_07");
    default Schedule(20, 15, UAIState_SitAround(), n"IO_NC_CHAIR_BENCH_35",750);
    default Schedule(23, 2, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);

    default ScheduleIfRaining(7, 15, UAIState_Sit(), n"IO_NC_CHAIR_BENCH_51");
    default ScheduleIfRaining(23, 2, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
}