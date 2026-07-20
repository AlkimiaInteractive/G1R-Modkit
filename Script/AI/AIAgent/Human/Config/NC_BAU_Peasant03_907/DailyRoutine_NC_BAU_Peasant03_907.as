UCLASS()
class UAIAgentConfig_Human_NC_BAU_Peasant03_907 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_NC_BAU_Peasant03_907::StaticClass();

}



UCLASS()
class UDailyRoutine_NC_BAU_Peasant03_907_Start : UAIState_DailyRoutine_Human
{
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_NewCamp_Exterior_RiceFields_Huts_04);
    default KnownPlaces.Add(Location::Bed, n"IO_NC_BED_PEASANT907_CM");
    default KnownPlaces.Add(Location::Home, n"IO_NC_BED_PEASANT907_CM");

    default Schedule(7, 0, UAIState_Eat(), n"IO_NC_CHAIR_BENCH_32");
    default Schedule(7, 45, UAIState_PickRice(), n"FP_NC_PICKRICE_24");
    default Schedule(13, 1, UAIState_Eat(), n"FP_NC_PICKRICE_24");
    default Schedule(13, 31, UAIState_PickRice(), n"FP_NC_PICKRICE_24");
    default Schedule(20, 10, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);

    default ScheduleIfRaining(7, 0, UAIState_RainShelter(), n"IO_NC_CHAIR_PEASANT2", 300);
    default ScheduleIfRaining(20, 10, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
} 