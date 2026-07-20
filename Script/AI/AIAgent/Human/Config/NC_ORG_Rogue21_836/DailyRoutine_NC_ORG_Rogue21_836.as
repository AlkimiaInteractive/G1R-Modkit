UCLASS()
class UAIAgentConfig_Human_NC_ORG_Rogue21_836 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_NC_ORG_Rogue21_836::StaticClass();

}



UCLASS()
class UDailyRoutine_NC_ORG_Rogue21_836_Start : UAIState_DailyRoutine_Human
{
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_NewCamp_Cave_Village_Huts_08);
    default KnownPlaces.Add(Location::Bed, n"IO_NC_BED_ROGUE836");
    default KnownPlaces.Add(Location::Home, n"IO_NC_BED_ROGUE836");

    default Schedule(0, 0, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
    default Schedule(7, 30, UAIState_Eat(), n"IO_NC_CHAIR_BENCH_04");
    default Schedule(8, 0, UAISTate_Guard_Watch_Patrolling_Route_Rogue21(), n"Breadcrumb_NewCamp_RiceFields");
    default Schedule(22, 30, UAIState_Campfire(), n"FP_NC_CAMPFIRE_13");
}