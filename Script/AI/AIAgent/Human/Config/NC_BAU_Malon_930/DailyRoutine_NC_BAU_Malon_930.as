UCLASS()
class UAIAgentConfig_Human_NC_BAU_Malon_930 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_NC_BAU_Malon_930::StaticClass();

}


UCLASS()
class UDailyRoutine_NC_BAU_Malon_930_Ownership : UAIState_DailyRoutine_Human
{
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_NewCamp_Exterior_RiceFields_Huts_03);
    default KnownPlaces.Add(Location::Bed, n"IO_NC_BED_PEASANT930");
    default KnownPlaces.Add(Location::Home, n"IO_NC_BED_PEASANT930");
}

UCLASS()
class UDailyRoutine_NC_BAU_Malon_930_Start : UDailyRoutine_NC_BAU_Malon_930_Ownership
{
    default Schedule(7, 25, UAIState_PickRice(), n"FP_NC_PICKRICE_25");
    default Schedule(13, 14, UAIState_Eat(), n"FP_NC_PICKRICE_25");
    default Schedule(14, 0, UAIState_PickRice(), n"FP_NC_PICKRICE_25");
    default Schedule(20, 25, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);

    default ScheduleIfRaining(7, 25, UAIState_SmalltalkWhileRain(), n"FP_NC_GUARD_47",200);
    default ScheduleIfRaining(20, 25, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
}

UCLASS()
class UDailyRoutine_NC_BAU_Malon_930_FMRaid : UDailyRoutine_NC_BAU_Malon_930_Ownership
{
    default Schedule(7, 25, UAIState_StandAround(), n"FP_NC_STAND_PEASANT_STORY_02");
}