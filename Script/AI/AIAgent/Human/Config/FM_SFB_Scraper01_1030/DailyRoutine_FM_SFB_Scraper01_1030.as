UCLASS()
class UAIAgentConfig_Human_FM_SFB_Scraper01_1030 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_FM_SFB_Scraper01_1030::StaticClass();

}



UCLASS()
class UDailyRoutine_FM_SFB_Scraper01_1030_Start : UAIState_DailyRoutine_Human
{
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_FreeMine_Exterior_Huts_07);
    default KnownPlaces.Add(Location::Bed, n"IO_FM_BED_SCRAPER1030");
    default KnownPlaces.Add(Location::Home, n"IO_FM_BED_SCRAPER1030");

    default Schedule(0, 0, UAIState_PickOre(), n"IO_FM_PICKORE_12",500);
    default Schedule(6, 0, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
    default Schedule(11, 0, UAIState_Rest(), n"FP_FM_REST_06");
    default Schedule(12, 0, UAIState_PickOre(), n"IO_FM_PICKORE_12",500);
    default Schedule(23, 0, UAIState_Eat(), n"FP_FM_REST_06");
}