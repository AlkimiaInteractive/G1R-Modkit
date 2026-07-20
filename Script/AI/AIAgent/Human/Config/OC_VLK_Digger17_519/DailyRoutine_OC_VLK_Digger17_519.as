UCLASS()
class UAIAgentConfig_Human_OC_VLK_Digger17_519 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OC_VLK_Digger17_519::StaticClass();

}



UCLASS()
class UDailyRoutine_OC_VLK_Digger17_519_Start : UDailyRoutine_Digger
{
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_OldCamp_OuterRing_Hut_66);
    default KnownPlaces.Add(Location::Bed, n"IO_OC_BED_DIGGER519");
    default KnownPlaces.Add(Location::Home, n"IO_OC_BED_DIGGER519");

    default Schedule(0, 0, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
    default Schedule(8, 0, UAIState_RepairBuilding(), n"FP_OC_REPAIRHUT_17");
    default Schedule(12, 0, UAIState_Eat(), n"IO_OC_CHAIR_BENCH_12");
    default Schedule(13, 0, UAIState_RepairBuilding(), n"FP_OC_REPAIRHUT_17");
    default Schedule(19, 0, UAIState_Eat(), n"FP_OC_STANDAROUND_49");
    default Schedule(20, 30, UAIState_SitAround(), n"IO_OC_CHAIR_BENCH_12");

    default ScheduleIfRaining(0, 0, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
    default ScheduleIfRaining(8, 0, UAIState_RainShelter_Digger(), Location::Home,500);
    default ScheduleIfRaining(12, 0, UAIState_Eat(), n"IO_OC_CHAIR_BENCH_12");
    default ScheduleIfRaining(13, 0, UAIState_RainShelter_Digger(), Location::Home,500);
    default ScheduleIfRaining(19, 0, UAIState_Eat(), n"FP_OC_STANDAROUND_49");
    default ScheduleIfRaining(20, 30, UAIState_SitAround(), n"IO_OC_CHAIR_BENCH_12");
}
