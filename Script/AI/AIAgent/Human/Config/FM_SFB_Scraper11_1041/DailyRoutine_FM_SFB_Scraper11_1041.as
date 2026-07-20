UCLASS()
class UAIAgentConfig_Human_FM_SFB_Scraper11_1041 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_FM_SFB_Scraper11_1041::StaticClass();

}


UCLASS()
class UDailyRoutine_FM_SFB_Scraper11_1041_Start : UAIState_DailyRoutine_Human
{
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_FreeMine_Exterior_Huts_08);
    default KnownPlaces.Add(Location::Bed, n"IO_FM_BED_SCRAPER1041");
    default KnownPlaces.Add(Location::Home, n"IO_FM_BED_SCRAPER1041");

    default Schedule(0, 30, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
    default Schedule(8, 0, UAIState_Eat(), n"IO_FM_CHAIR_BENCH_01");
    default Schedule(9, 0, UAIState_SitAround(), n"IO_FM_CHAIR_BENCH_01");
    default Schedule(12, 56, UAIState_Eat(), n"IO_FM_CHAIR_BENCH_01");
    default Schedule(13, 56, UAIState_SitAround(), n"IO_FM_CHAIR_BENCH_01");
    default Schedule(21, 30, UAIState_Eat(), n"IO_FM_CHAIR_BENCH_01");
    default Schedule(22, 30, UAIState_SitAround(), n"IO_FM_CHAIR_BENCH_01");

    default ScheduleIfRaining(0, 30, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
    default ScheduleIfRaining(8, 0, UAIState_RainShelter(), n"FP_FM_RAINSHELTER_03");
}