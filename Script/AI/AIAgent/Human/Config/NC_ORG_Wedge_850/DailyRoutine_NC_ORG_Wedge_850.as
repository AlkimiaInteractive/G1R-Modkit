UCLASS()
class UAIAgentConfig_Human_NC_ORG_Wedge_850 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_NC_ORG_Wedge_850::StaticClass();

}

UCLASS()
class UDailyRoutine_NC_ORG_Wedge_850_Ownership : UAIState_DailyRoutine_Human
{
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_NewCamp_Cave_Village_Huts_Wedge);
    default KnownPlaces.Add(Location::Bed, n"IO_NC_BED_WEDGE");
    default KnownPlaces.Add(Location::Home, n"IO_NC_BED_WEDGE");
}

UCLASS()
class UDailyRoutine_NC_ORG_Wedge_850_Start : UDailyRoutine_NC_ORG_Wedge_850_Ownership
{
    default KnownPlaces.Add(Location::Bed, n"IO_NC_BED_WEDGE");
    default KnownPlaces.Add(Location::Home, n"IO_NC_BED_WEDGE");
    
    default Schedule(0, 0, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
    default Schedule(7, 30, UAIState_Sit(), n"IO_NC_CHAIR_BENCH_30",1500);
    default Schedule(8, 30, UAIState_Smalltalk(), n"FP_NC_SMALLTALK_22",300);
    default Schedule(12, 56, UAIState_Sit(), n"IO_NC_CHAIR_BENCH_30",1500);
    default Schedule(13, 56, UAIState_Smalltalk(), n"FP_NC_SMALLTALK_22",300);
    default Schedule(21, 30, UAIState_Sit_PlayStone(), n"IO_NC_CHAIR_BENCH_30",1500);
    default Schedule(22, 30, UAIState_Smalltalk(), n"FP_NC_SMALLTALK_22",300);
    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}

UCLASS()
class UDailyRoutine_NC_ORG_Wedge_850_Convoy : UDailyRoutine_NC_ORG_Wedge_850_Ownership
{
    default Schedule(0, 0, UAIState_Lurk(), n"FP_OW_CONVOY_10");
    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}

UCLASS()
class UDailyRoutine_NC_ORG_Wedge_850_AfterConvoy : UDailyRoutine_NC_ORG_Wedge_850_Ownership
{
    default Schedule(0, 0, UAIState_Guard(), n"FP_OW_CONVOY_25");
}