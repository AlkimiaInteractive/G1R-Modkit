UCLASS()
class UAIAgentConfig_Human_NC_ORG_Buster_833 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_NC_ORG_Buster_833::StaticClass();

}



UCLASS()
class UDailyRoutine_NC_ORG_Buster_833_Start : UAIState_DailyRoutine_Human
{
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_NewCamp_Cave_Village_Huts_Buster);
    default KnownPlaces.Add(Location::Bed, n"IO_NC_BED_BUSTER");
    default KnownPlaces.Add(Location::Home, n"IO_NC_BED_BUSTER");

    default Schedule(1, 1, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
    default Schedule(7, 1, UAIState_Eat(), n"IO_NC_CHAIR_BENCH_04",400);
    default Schedule(7, 31, UAIState_SitAround(), n"IO_NC_CHAIR_BENCH_04",400);
    default Schedule(12, 55, UAIState_Eat(), n"IO_NC_CHAIR_BENCH_04",400);
    default Schedule(13, 55, UAIState_SitAround(), n"IO_NC_CHAIR_BENCH_04",400);
    default Schedule(21, 31, UAIState_Eat(), n"IO_NC_CHAIR_BENCH_04",400);
    default Schedule(22, 31, UAIState_SitAround(), n"IO_NC_CHAIR_BENCH_04",400);
}