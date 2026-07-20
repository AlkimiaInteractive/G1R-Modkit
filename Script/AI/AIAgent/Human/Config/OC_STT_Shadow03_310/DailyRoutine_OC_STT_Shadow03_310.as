UCLASS()
class UAIAgentConfig_Human_OC_STT_Shadow03_310 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OC_STT_Shadow03_310::StaticClass();

}



UCLASS()
class UDailyRoutine_OC_STT_Shadow03_310_Start : UAIState_DailyRoutine_Human
{
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_OldCamp_OuterRing_Hut_8);
    default KnownPlaces.Add(Location::Bed, n"IO_OC_BED_SHADOW310");
    default KnownPlaces.Add(Location::Home, n"IO_OC_BED_SHADOW310");

    default Schedule(6, 0, UAIState_Eat(), n"FP_OC_STANDAROUND_35",1000.0f);
    default Schedule(7, 5, UAIState_Smalltalk(), n"FP_OC_SMALLTALK_15",1000.0f);
    default Schedule(10, 5, UAIState_LeanWall(), n"FP_OC_STANDAROUND_35",1000.0f);
    default Schedule(13, 0, UAIState_Eat(), n"FP_OC_STANDAROUND_35",1000.0f);
    default Schedule(14, 0, UAIState_StandAround(), n"FP_OC_CAMPFIRE_12",3000.0f);
    default Schedule(20, 5, UAIState_Smalltalk(), n"FP_OC_SMALLTALK_15",1000.0f);
    default Schedule(22, 5, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);

    default ScheduleIfRaining(6, 0, UAIState_RainShelter_Shadow(), Location::Home,500);
    default ScheduleIfRaining(7, 0, UAIState_Smalltalk(), n"FP_OC_SMALLTALK_15",1000.0f);
    default ScheduleIfRaining(13, 0, UAIState_RainShelter_Shadow(), Location::Home,500);
    default ScheduleIfRaining(20, 0, UAIState_Smalltalk(), n"FP_OC_SMALLTALK_15",1000.0f);
    default ScheduleIfRaining(22, 0, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
}