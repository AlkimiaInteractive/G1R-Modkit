UCLASS()
class UAIAgentConfig_Human_NC_BAU_Peasant14_924 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_NC_BAU_Peasant14_924::StaticClass();

}



UCLASS()
class UDailyRoutine_NC_BAU_Peasant14_924_Start : UAIState_DailyRoutine_Human
{
    
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_NewCamp_Exterior_RiceFields_Huts_02);
    default KnownPlaces.Add(Location::Bed, n"IO_NC_BED_PEASANT924");
    default KnownPlaces.Add(Location::Home, n"IO_NC_BED_PEASANT924");

    default Schedule(8, 20, UAIState_PickRice(), n"FP_NC_PICKRICE_26");
    default Schedule(13, 8, UAIState_Eat(), n"FP_NC_PICKRICE_26");
    default Schedule(13, 32, UAIState_PickRice(), n"FP_NC_PICKRICE_26");
    default Schedule(20, 20, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);

    default ScheduleIfRaining(8, 20, UAIState_SmalltalkWhileRain(), n"FP_NC_GUARD_48",200);
    default ScheduleIfRaining(20, 20, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
}