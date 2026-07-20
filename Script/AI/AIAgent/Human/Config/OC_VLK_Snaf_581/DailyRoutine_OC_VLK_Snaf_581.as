UCLASS()
class UAIAgentConfig_Human_OC_VLK_Snaf_581 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OC_VLK_Snaf_581::StaticClass();

}



UCLASS()
class UDailyRoutine_OC_VLK_Snaf_581_Start : UDailyRoutine_Digger
{
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_OldCamp_OuterRing_Hut_58);
    default KnownPlaces.Add(Location::Bed, n"IO_OC_BED_SNAF");
    default KnownPlaces.Add(Location::Home, n"IO_OC_BED_SNAF");

    default Schedule(6, 0, UAIState_Eat(), n"IO_OC_CHAIR_BENCH_48",1000.0f);
    default Schedule(7, 0, UAIState_Cook(), n"FP_OC_CAMPFIRE_02");
    default Schedule(13, 0, UAIState_Smoke(), n"FP_OC_CAMPFIRE_02",100.0f);
    default Schedule(15, 0, UAIState_Cook(), n"FP_OC_CAMPFIRE_02");
    default Schedule(20, 30, UAIState_Smoke(), n"FP_OC_CAMPFIRE_02",100.0f);
    default Schedule(22, 0, UAIState_Sleep(), n"IO_OC_BED_SNAF", WaypointRadius = 500);

    //default Schedule(7, 0, UAIState_ServeFood(), n"FP_OC_CAMPFIRE_02");

    default ScheduleIfRaining(8, 0, UAIState_RainShelter_Digger(), Location::Home,500);
    default ScheduleIfRaining(22, 0, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
}
