UCLASS()
class UAIAgentConfig_Human_NC_BAU_Peasant19_929 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_NC_BAU_Peasant19_929::StaticClass();

}

UCLASS()
class UDailyRoutine_NC_BAU_Peasant19_929_Ownership : UAIState_DailyRoutine_Human
{
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_NewCamp_Exterior_RiceFields_Huts_03);
    default KnownPlaces.Add(Location::Bed, n"IO_NC_BED_PEASANT929_CM");
    default KnownPlaces.Add(Location::Home, n"IO_NC_BED_PEASANT929_CM");
}

UCLASS()
class UDailyRoutine_NC_BAU_Peasant19_929_Start : UDailyRoutine_NC_BAU_Peasant19_929_Ownership
{
    default Schedule(7, 25, UAIState_PickRice(), n"FP_NC_PICKRICE_29");
    default Schedule(13, 14, UAIState_Eat(), n"FP_NC_PICKRICE_29");
    default Schedule(14, 0, UAIState_PickRice(), n"FP_NC_PICKRICE_29");
    default Schedule(20, 25, UAIState_SitAround(), n"IO_NC_CHAIR_BENCH_37",200);
    default Schedule(23, 20, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);

    default ScheduleIfRaining(7, 25, UAIState_RainShelter_Digger(), n"FP_NC_RAINSHELTER_16");
    default ScheduleIfRaining(23, 20, UAIState_Sleep(), Location::Bed);
}

UCLASS()
class UDailyRoutine_NC_BAU_Peasant19_929_FMRaid : UDailyRoutine_NC_BAU_Peasant19_929_Ownership
{
    default Schedule(7, 25, UAIState_StandAround(), n"FP_NC_STAND_PEASANT_STORY");
}