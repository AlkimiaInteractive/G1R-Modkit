UCLASS()
class UAIAgentConfig_Human_OC_STT_Shadow07_318 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OC_STT_Shadow07_318::StaticClass();

}



UCLASS()
class UDailyRoutine_OC_STT_Shadow07_318_Start : UAIState_DailyRoutine_Human
{
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_OldCamp_OuterRing_Hut_40);
    default KnownPlaces.Add(Location::Bed, n"IO_OC_BED_SHADOW318");
    default KnownPlaces.Add(Location::Home, n"IO_OC_BED_SHADOW318");

    default Schedule(7, 0, UAIState_Guard(), n"FP_OC_STANDAROUND_64");
    default Schedule(7, 30, UAIState_Eat(), n"FP_OC_CAMPFIRE_26",500);
    default Schedule(8, 0, UAIState_StandAround(), n"FP_OC_STANDAROUND_64");
    default Schedule(14, 0, UAIState_Eat(), n"FP_OC_CAMPFIRE_26",500);
    default Schedule(15, 0, UAIState_SitAround(), n"IO_OC_CHAIR_BENCH_83",200);
    default Schedule(17, 25, UAIState_StandAround(), n"FP_OC_STANDAROUND_64");
    default Schedule(23, 0, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);

    default ScheduleIfRaining(7, 0, UAIState_RainShelter_Shadow(), Location::Home,500);
    default ScheduleIfRaining(23, 0, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
    
}