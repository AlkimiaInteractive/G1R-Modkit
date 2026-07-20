UCLASS()
class UAIAgentConfig_Human_NC_ORG_Sharky_843 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_NC_ORG_Sharky_843::StaticClass();

}



UCLASS()
class UDailyRoutine_NC_ORG_Sharky_843_Start : UAIState_DailyRoutine_Human
{
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_NewCamp_Cave_Village_Huts_Sharky);
    default KnownPlaces.Add(Location::Bed, n"IO_NC_BED_SHARKY");
    default KnownPlaces.Add(Location::Home, n"IO_NC_BED_SHARKY");

    default Schedule(3, 0, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
    default Schedule(8, 0, UAIState_Eat(), n"IO_NC_CHAIR_BENCH_25",100);
    default Schedule(8, 30, UAIState_Trader_Seated(), n"IO_NC_CHAIR_BENCH_25",100);
    default Schedule(12, 56, UAIState_Eat(), n"IO_NC_CHAIR_BENCH_25",100);
    default Schedule(13, 56, UAIState_Trader_Seated(), n"IO_NC_CHAIR_BENCH_25",100);
    default Schedule(22, 30, UAIState_Eat(), n"IO_NC_CHAIR_BENCH_25",100);
    default Schedule(23, 30, UAIState_StandAround(), n"FP_NC_STANDAROUND_09");
}

UCLASS()
class UDailyRoutine_NC_ORG_Sharky_843_NewDealer : UDailyRoutine_OC_ORG_Mordrag_826_Ownership
{
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_OldCamp_OuterRing_Hut_67);
    default KnownPlaces.Add(Location::Bed, n"IO_OC_BED_MORDRAG");
    default KnownPlaces.Add(Location::Home, n"IO_OC_BED_MORDRAG");

    default Schedule(0, 0, UAIState_Sleep(), Location::Bed);
    default Schedule(8, 0, UAIState_SitAround(), n"IO_OC_CHAIR_BENCH_05",200);
    default Schedule(22, 0, UAIState_Smalltalk(), n"FP_OC_SMALLTALK_63",500);

    default ScheduleIfRaining(0, 0, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
    default ScheduleIfRaining(10, 0, UAIState_RainShelter_Guard(), Location::Home,500);

    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;

}

