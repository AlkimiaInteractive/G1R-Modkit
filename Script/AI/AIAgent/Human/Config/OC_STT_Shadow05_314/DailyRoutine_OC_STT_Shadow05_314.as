UCLASS()
class UAIAgentConfig_Human_OC_STT_Shadow05_314 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OC_STT_Shadow05_314::StaticClass();

}



UCLASS()
class UDailyRoutine_OC_STT_Shadow05_314_Start : UAIState_DailyRoutine_Human
{
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_OldCamp_OuterRing_Hut_26);
    default KnownPlaces.Add(Location::Bed, n"IO_OC_BED_SHADOW314");
    default KnownPlaces.Add(Location::Home, n"IO_OC_BED_SHADOW314");

    default Schedule(7, 0, UAIState_Smalltalk(), n"FP_OC_SMALLTALK_18",500.0f);
    default Schedule(9, 0, UAIState_Eat(), n"FP_OC_CAMPFIRE_33",500.0f);
    default Schedule(9, 45, UAIState_Smoke(), n"FP_OC_STANDAROUND_62",300);
    default Schedule(12, 30, UAIState_Eat(), n"FP_OC_CAMPFIRE_33",500.0f);
    default Schedule(13, 30, UAIState_SitAround(), n"IO_OC_CHAIR_BOX_02",200.0f);
    default Schedule(17, 0, UAIState_Campfire(), n"FP_OC_CAMPFIRE_33",500.0f);
    default Schedule(22, 45, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);

    default ScheduleIfRaining(7, 45, UAIState_RainShelter_Shadow(), n"FP_OC_RAINSHELTER_24",500);
    default ScheduleIfRaining(8, 45, UAIState_RainShelter_Shadow(), Location::Home,500);
    default ScheduleIfRaining(12, 30, UAIState_RainShelter_Shadow(), n"FP_OC_RAINSHELTER_24",500);
    default ScheduleIfRaining(22, 0, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
}