UCLASS()
class UAIAgentConfig_Human_NC_BAU_Peasant11_921 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_NC_BAU_Peasant11_921::StaticClass();

}



UCLASS()
class UDailyRoutine_NC_BAU_Peasant11_921_Start : UAIState_DailyRoutine_Human
{
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_NewCamp_Exterior_RiceFields_Huts_04);
    default KnownPlaces.Add(Location::Bed, n"IO_NC_BED_PEASANT921");
    default KnownPlaces.Add(Location::Home, n"IO_NC_BED_PEASANT921");

    default Schedule(7, 50, UAIState_PickRice(), n"FP_NC_PICKRICE_30");
    default Schedule(12, 59, UAIState_Eat(), n"FP_NC_PICKRICE_30");
    default Schedule(13, 31, UAIState_PickRice(), n"FP_NC_PICKRICE_30");
    default Schedule(20, 50, UAIState_SitAround(), n"IO_NC_CHAIR_31",200);
    default Schedule(22, 23, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);

    default ScheduleIfRaining(7, 50, UAIState_RainShelter(), n"IO_NC_CHAIR_31");
    default ScheduleIfRaining(22, 23, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
}