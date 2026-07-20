UCLASS()
class UAIAgentConfig_Human_NC_ORG_Butch_851 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_NC_ORG_Butch_851::StaticClass();

}

UCLASS()
class UDailyRoutine_NC_ORG_Butch_851_Ownership : UAIState_DailyRoutine_Human
{
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_NewCamp_Cave_Village_Huts_Butch);
    default KnownPlaces.Add(Location::Bed, n"IO_NC_BED_BUTCH");
    default KnownPlaces.Add(Location::Home, n"IO_NC_BED_BUTCH");
}

UCLASS()
class UDailyRoutine_NC_ORG_Butch_851_Start : UDailyRoutine_NC_ORG_Butch_851_Ownership
{
    default Schedule(1, 0, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
    default Schedule(8, 0, UAIState_Eat(), n"IO_NC_CHAIR_BENCH_11");
    default Schedule(8, 30, UAIState_Campfire(), n"FP_NC_CAMPFIRE_10",600);
    default Schedule(12, 30, UAIState_Eat(), n"IO_NC_CHAIR_BENCH_11");
    default Schedule(13, 30, UAIState_Campfire(), n"FP_NC_CAMPFIRE_10",600);
    default Schedule(18, 0, UAIState_Cook(), n"IO_NC_CAMP_CAULDRON_01");
    default Schedule(22, 25, UAIState_Eat(), n"IO_NC_CHAIR_BENCH_11");
    default Schedule(23, 20, UAIState_Campfire(), n"FP_NC_CAMPFIRE_10",600);
    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}

UCLASS()
class UDailyRoutine_NC_ORG_Butch_851_Convoy : UDailyRoutine_NC_ORG_Butch_851_Ownership
{
    default Schedule(0, 0, UAIState_Lurk(), n"FP_OW_CONVOY_16");
    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}

UCLASS()
class UDailyRoutine_NC_ORG_Butch_851_AfterConvoy : UDailyRoutine_NC_ORG_Butch_851_Ownership
{
    default Schedule(0, 0, UAIState_Smoke(), n"FP_OW_CONVOY_24");
}