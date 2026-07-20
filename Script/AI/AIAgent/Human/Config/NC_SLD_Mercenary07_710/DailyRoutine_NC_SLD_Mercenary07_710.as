UCLASS()
class UAIAgentConfig_Human_NC_SLD_Mercenary07_710 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_NC_SLD_Mercenary07_710::StaticClass();

}



UCLASS()
class UDailyRoutine_NC_SLD_Mercenary07_710_Start : UAIState_DailyRoutine_Human
{
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_NewCamp_Cave_Village_Huts_26);
    default KnownPlaces.Add(Location::Bed, n"IO_NC_BED_MERCENARY710");
    default KnownPlaces.Add(Location::Home, n"IO_NC_BED_MERCENARY710");

    default Schedule(7, 0, UAIState_Eat(), n"IO_NC_CHAIR_BENCH_13",400);
    default Schedule(7, 35, UAIState_Smalltalk(), n"FP_NC_SMALLTALK_12",300);
    default Schedule(12, 57, UAIState_Eat(), n"IO_NC_CHAIR_BENCH_13",400);
    default Schedule(14, 2, UAIState_Smalltalk(), n"FP_NC_SMALLTALK_12",300);
    default Schedule(20, 28, UAIState_Eat(), n"IO_NC_CHAIR_BENCH_13",400);
    default Schedule(21, 29, UAIState_Smalltalk(), n"FP_NC_SMALLTALK_12",300);
    default Schedule(22, 55, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
}