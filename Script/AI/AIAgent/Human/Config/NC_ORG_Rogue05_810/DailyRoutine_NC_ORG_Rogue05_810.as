UCLASS()
class UAIAgentConfig_Human_NC_ORG_Rogue05_810 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_NC_ORG_Rogue05_810::StaticClass();

}



UCLASS()
class UDailyRoutine_NC_ORG_Rogue05_810_Start : UAIState_DailyRoutine_Human
{
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_NewCamp_Cave_Village_Huts_11);
    default KnownPlaces.Add(Location::Bed, n"IO_NC_BED_ROGUE810");
    default KnownPlaces.Add(Location::Home, n"IO_NC_BED_ROGUE810");

    default Schedule(0, 0, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
    default Schedule(8, 0, UAIState_Sit(), n"IO_NC_CHAIR_BENCH_07");
}