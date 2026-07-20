UCLASS()
class UAIAgentConfig_Human_NC_ORG_Rogue01_800 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_NC_ORG_Rogue01_800::StaticClass();

}



UCLASS()
class UDailyRoutine_NC_ORG_Rogue01_800_Start : UAIState_DailyRoutine_Human
{
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_NewCamp_Cave_Village_Huts_03);
    default KnownPlaces.Add(Location::Bed, n"IO_NC_BED_ROGUE800");
    default KnownPlaces.Add(Location::Home, n"IO_NC_BED_ROGUE800");

    default Schedule(0, 30, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
    default Schedule(8, 5, UAIState_Eat(), n"IO_NC_CHAIR_BENCH_04");
    default Schedule(9, 23, UAIState_SitAround(), n"IO_NC_CHAIR_BENCH_04");
    default Schedule(12, 56, UAIState_Eat(), n"IO_NC_CHAIR_BENCH_04");
    default Schedule(13, 56, UAIState_SitAround(), n"IO_NC_CHAIR_BENCH_04");
    default Schedule(21, 30, UAIState_Eat(), n"IO_NC_CHAIR_BENCH_04");
    default Schedule(22, 30, UAIState_SitAround(), n"IO_NC_CHAIR_BENCH_04");
}

UCLASS()
class UDailyRoutine_NC_ORG_Rogue01_800_Shipment : UAIState_DailyRoutine_Human
{
    default Schedule(0, 0, UAIState_Sit(), n"EZ_BANDIT_ATTACK6");
    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}