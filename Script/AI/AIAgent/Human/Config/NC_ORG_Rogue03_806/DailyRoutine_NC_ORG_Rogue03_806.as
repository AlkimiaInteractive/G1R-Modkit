UCLASS()
class UAIAgentConfig_Human_NC_ORG_Rogue03_806 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_NC_ORG_Rogue03_806::StaticClass();

}



UCLASS()
class UDailyRoutine_NC_ORG_Rogue03_806_Start : UAIState_DailyRoutine_Human
{
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_NewCamp_Cave_Village_Huts_20);
    default KnownPlaces.Add(Location::Bed, n"IO_NC_BED_ROGUE806");
    default KnownPlaces.Add(Location::Home, n"IO_NC_BED_ROGUE806");

    default Schedule(0, 0, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
    default Schedule(7, 30, UAIState_Eat(), n"IO_NC_CHAIR_BENCH_31");
    default Schedule(8, 30, UAIState_Sweep(), n"FP_NC_SWEEP_CAVE");
    default Schedule(12, 56, UAIState_Eat(), n"IO_NC_CHAIR_BENCH_31");
    default Schedule(13, 56, UAIState_Sweep(), n"FP_NC_SWEEP_CAVE");
    default Schedule(21, 30, UAIState_Eat(), n"IO_NC_CHAIR_BENCH_31");
    default Schedule(22, 30, UAIState_Sweep(), n"FP_NC_SWEEP_CAVE");
}