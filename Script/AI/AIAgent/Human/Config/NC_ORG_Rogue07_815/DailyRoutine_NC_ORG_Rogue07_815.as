UCLASS()
class UAIAgentConfig_Human_NC_ORG_Rogue07_815 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_NC_ORG_Rogue07_815::StaticClass();

}



UCLASS()
class UDailyRoutine_NC_ORG_Rogue07_815_Start : UAIState_DailyRoutine_Human
{
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_NewCamp_Cave_Village_Huts_08);
    default KnownPlaces.Add(Location::Bed, n"IO_NC_BED_ROGUE815");
    default KnownPlaces.Add(Location::Home, n"IO_NC_BED_ROGUE815");

    default Schedule(7, 5, UAIState_Eat(), n"IO_NC_CHAIR_BENCH_01", 300);
    default Schedule(8, 5, UAIState_Smalltalk(), n"FP_NC_SMALLTALK_27",300);
    default Schedule(12, 56, UAIState_Eat(), n"IO_NC_CHAIR_BENCH_01");
    default Schedule(13, 56, UAIState_Smalltalk(), n"FP_NC_SMALLTALK_27",300);
    default Schedule(21, 30, UAIState_Eat(), n"IO_NC_CHAIR_BENCH_01");
    default Schedule(22, 30, UAIState_Smalltalk(), n"FP_NC_SMALLTALK_27",300);
    default Schedule(23, 55, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
}