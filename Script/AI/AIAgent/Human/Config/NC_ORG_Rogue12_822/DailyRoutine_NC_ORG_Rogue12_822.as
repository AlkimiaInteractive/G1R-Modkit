UCLASS()
class UAIAgentConfig_Human_NC_ORG_Rogue12_822 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_NC_ORG_Rogue12_822::StaticClass();

}



UCLASS()
class UDailyRoutine_NC_ORG_Rogue12_822_Start : UAIState_DailyRoutine_Human
{
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_NewCamp_Cave_Village_Huts_10);
    default KnownPlaces.Add(Location::Bed, n"IO_NC_BED_ROGUE822");
    default KnownPlaces.Add(Location::Home, n"IO_NC_BED_ROGUE822");

    default Schedule(0, 5, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
    default Schedule(8, 30, UAIState_Sit(), n"IO_NC_CHAIR_BENCH_11");
    default Schedule(12, 56, UAIState_PlayKnife(), n"IO_NC_CHAIR_BENCH_11");
    default Schedule(13, 56, UAIState_Sit(), n"IO_NC_CHAIR_BENCH_11");
    default Schedule(22, 0, UAIState_PlayKnife(), n"IO_NC_CHAIR_BENCH_11");
    default Schedule(22, 30, UAIState_Sit(), n"IO_NC_CHAIR_BENCH_11");
}


UCLASS()
class UDailyRoutine_NC_ORG_Rogue12_822_Shipment : UAIState_DailyRoutine_Human
{
    default Schedule(0, 0, UAIState_LeanWall(), n"EZ_BANDIT_ATTACK5");
    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}