UCLASS()
class UAIAgentConfig_Human_OC_STT_Shadow01_304 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OC_STT_Shadow01_304::StaticClass();

}



UCLASS()
class UDailyRoutine_OC_STT_Shadow01_304_Start : UAIState_DailyRoutine_Human
{
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_OldCamp_OuterRing_Hut_6);
    default KnownPlaces.Add(Location::Bed, n"IO_OC_BED_SHADOW304");
    default KnownPlaces.Add(Location::Home, n"IO_OC_BED_SHADOW304");

    default Schedule(0, 0, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
    default Schedule(8, 0, UAIState_Eat(), n"IO_OC_CHAIR_46");
    default Schedule(8, 30, UAIState_Smalltalk(), n"FP_OC_SMALLTALK_59",300.0f);
    default Schedule(13, 0, UAIState_Eat(), n"FP_OC_CAMPFIRE_06");
    default Schedule(15, 0, UAIState_Smalltalk(), n"FP_OC_SMALLTALK_59",300.0f);
    default Schedule(22, 0, UAIState_Eat(), n"FP_OC_CAMPFIRE_06");

    default ScheduleIfRaining(0, 0, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
    default ScheduleIfRaining(8, 0, UAIState_RainShelter_Shadow(), Location::Home,500);
    default ScheduleIfRaining(14, 15, UAIState_RainShelter_Shadow(), n"FP_OC_RAINSHELTER_100",500);
    default ScheduleIfRaining(15, 0, UAIState_RainShelter_Shadow(), Location::Home,500);
    default ScheduleIfRaining(22, 0, UAIState_RainShelter_Shadow(), n"FP_OC_RAINSHELTER_100",500);



}