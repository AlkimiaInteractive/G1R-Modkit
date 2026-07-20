UCLASS()
class UAIAgentConfig_Human_NC_ORG_Rogue06_811 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_NC_ORG_Rogue06_811::StaticClass();

}



UCLASS()
class UDailyRoutine_NC_ORG_Rogue06_811_Start : UAIState_DailyRoutine_Human
{
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_NewCamp_Cave_Village_Huts_22);
    default KnownPlaces.Add(Location::Bed, n"IO_NC_BED_ROGUE811");
    default KnownPlaces.Add(Location::Home, n"IO_NC_BED_ROGUE811");

    default Schedule(7, 5, UAIState_Sit(), n"IO_NC_CHAIR_BENCH_09");
    default Schedule(8, 25, UAIState_Smalltalk(), n"FP_NC_SMALLTALK_05",300);
    default Schedule(12, 56, UAIState_Sit(), n"IO_NC_CHAIR_BENCH_09");
    default Schedule(13, 56, UAIState_Smalltalk(), n"FP_NC_SMALLTALK_05",300);
    default Schedule(21, 30, UAIState_Sit(), n"IO_NC_CHAIR_BENCH_09");
    default Schedule(22, 30, UAIState_Smalltalk(), n"FP_NC_SMALLTALK_05",300);
    default Schedule(23, 57, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
}