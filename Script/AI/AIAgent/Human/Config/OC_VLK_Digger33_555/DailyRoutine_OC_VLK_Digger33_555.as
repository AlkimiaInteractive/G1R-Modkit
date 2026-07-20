UCLASS()
class UAIAgentConfig_Human_OC_VLK_Digger33_555 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OC_VLK_Digger33_555::StaticClass();

}



UCLASS()
class UDailyRoutine_OC_VLK_Digger33_555_Start : UDailyRoutine_Digger
{
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_OldCamp_OuterRing_Hut_22);
    default KnownPlaces.Add(Location::Bed, n"IO_OC_BED_DIGGER555");
    default KnownPlaces.Add(Location::Home, n"IO_OC_BED_DIGGER555");

    default Schedule(6, 30, UAIState_RepairBuilding(), n"FP_OC_REPAIRHUT_10",5000.0f);
    default Schedule(12, 0, UAIState_Eat(), n"IO_OC_CHAIR_BENCH_46");
    default Schedule(13, 0, UAIState_RepairBuilding(), n"FP_OC_REPAIRHUT_10",5000.0f);
    default Schedule(18, 0, UAIState_SitAround(), n"IO_OC_CHAIR_BENCH_46");
    default Schedule(21, 0, UAIState_Eat(), n"IO_OC_CHAIR_BENCH_46");
    default Schedule(22, 0, UAIState_SitAround(), n"IO_OC_CHAIR_BENCH_46");
    default Schedule(23, 0, UAIState_Sleep(), Location::Bed);

    default ScheduleIfRaining(5, 0, UAIState_RainShelter_Digger(), Location::Home,500);
    default ScheduleIfRaining(22, 0, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
}
