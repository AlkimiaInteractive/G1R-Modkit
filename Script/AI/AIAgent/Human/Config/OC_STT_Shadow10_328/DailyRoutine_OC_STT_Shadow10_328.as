UCLASS()
class UAIAgentConfig_Human_OC_STT_Shadow10_328 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OC_STT_Shadow10_328::StaticClass();

}



UCLASS()
class UDailyRoutine_OC_STT_Shadow10_328_Start : UAIState_DailyRoutine_Human
{
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_OldCamp_OuterRing_Hut_14);
    default KnownPlaces.Add(Location::Bed, n"IO_OC_BED_SHADOW328");
    default KnownPlaces.Add(Location::Home, n"IO_OC_BED_SHADOW328");

    default Schedule(7, 0, UAIState_SitAround(), n"IO_OC_CHAIR_BENCH_47",200);
    default Schedule(11, 0, UAIState_Leatherworking(), n"IO_OC_TANNINGTABLE_01",750);
    default Schedule(13, 12, UAIState_Eat(), n"IO_OC_CHAIR_BENCH_47",200);
    default Schedule(14, 12, UAIState_Leatherworking(), n"IO_OC_TANNINGTABLE_01",750);
    default Schedule(17, 30, UAIState_SitAround(), n"IO_OC_CHAIR_BENCH_47",200);
    default Schedule(23, 0, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);

    default ScheduleIfRaining(7, 0, UAIState_RainShelter_Shadow(), Location::Home,500);
    default Schedule(19, 0, UAIState_ArenaSpectator(), n"FP_OC_ARENASPECTATE_05",3000);
    default ScheduleIfRaining(23, 0, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
}