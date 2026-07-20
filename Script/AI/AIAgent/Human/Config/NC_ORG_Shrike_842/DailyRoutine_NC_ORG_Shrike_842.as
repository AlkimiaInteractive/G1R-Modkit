UCLASS()
class UAIAgentConfig_Human_NC_ORG_Shrike_842 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_NC_ORG_Shrike_842::StaticClass();

}

UCLASS()
class UDailyRoutine_NC_ORG_Shrike_842_Ownership : UAIState_DailyRoutine_Human
{
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_NewCamp_Cave_Village_Huts_Shrike);
    default KnownPlaces.Add(Location::Bed, n"IO_NC_BED_SHRIKE");
    default KnownPlaces.Add(Location::Home, n"IO_NC_BED_SHRIKE");
}

UCLASS()
class UDailyRoutine_NC_ORG_Shrike_842_Start : UDailyRoutine_NC_ORG_Shrike_842_Ownership
{
    default Schedule(1, 0, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
    default Schedule(8, 30, UAIState_RepairBuilding(), n"FP_NC_REPAIRHUT_01");
}

UCLASS()
class UDailyRoutine_NC_ORG_Shrike_842_AfterFight : UAIState_DailyRoutine_Human
{
    // default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_NewCamp_Cave_Village_Huts_Shrike);

    default Schedule(1, 0, UAIState_Sleep_Seated(), n"IO_NC_CHAIR_BENCH_59");
    default Schedule(8, 0, UAIState_Eat(), n"IO_NC_CHAIR_BENCH_59");
    default Schedule(12, 56, UAIState_Eat(), n"IO_NC_CHAIR_BENCH_59");
    default Schedule(13, 56, UAIState_Leatherworking(), n"IO_NC_TANNING_01");
    default Schedule(16, 56, UAIState_Rest(), n"IO_NC_CHAIR_BENCH_59");
    default Schedule(18, 30, UAIState_Leatherworking(), n"IO_NC_TANNING_01");
    default Schedule(21, 30, UAIState_Eat(), n"IO_NC_CHAIR_BENCH_59");
}