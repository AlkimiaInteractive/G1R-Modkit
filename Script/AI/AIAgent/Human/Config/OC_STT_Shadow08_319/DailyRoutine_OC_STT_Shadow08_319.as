UCLASS()
class UAIAgentConfig_Human_OC_STT_Shadow08_319 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OC_STT_Shadow08_319::StaticClass();

}



UCLASS()
class UDailyRoutine_OC_STT_Shadow08_319_Start : UAIState_DailyRoutine_Human
{
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_OldCamp_OuterRing_Hut_9);
    default KnownPlaces.Add(Location::Bed, n"IO_OC_BED_SHADOW319");
    default KnownPlaces.Add(Location::Home, n"IO_OC_BED_SHADOW319");

    default Schedule(5, 0, UAIState_Eat(), n"FP_OC_CAMPFIRE_06");
    default Schedule(6, 0, UAIState_RepairBuilding(), n"FP_OC_REPAIRHUT_36");
    default Schedule(20, 0, UAIState_Eat(), n"FP_OC_CAMPFIRE_06");
    default Schedule(21, 0, UAIState_StandAround(), n"FP_OC_CAMPFIRE_06");
    default Schedule(23, 0, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);

    default ScheduleIfRaining(5, 0, UAIState_RainShelter_Shadow(), Location::Home,500);
    default ScheduleIfRaining(23, 0, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
}