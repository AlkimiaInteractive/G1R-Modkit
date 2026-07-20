UCLASS()
class UAIAgentConfig_Human_NC_SLD_Blade_704 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_NC_SLD_Blade_704::StaticClass();

}



UCLASS()
class UDailyRoutine_NC_SLD_Blade_704_Start : UAIState_DailyRoutine_Human
{
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_NewCamp_Cave_Village_Huts_Blade);
    default KnownPlaces.Add(Location::Bed, n"IO_NC_BED_BLADE");
    default KnownPlaces.Add(Location::Home, n"IO_NC_BED_BLADE");

    default Schedule(7, 0, UAIState_Eat(), n"IO_NC_CHAIR_BENCH_15",500);
    default Schedule(7, 30, UAIState_Smalltalk(), n"FP_NC_SMALLTALK_13");
    default Schedule(12, 56, UAIState_Eat(), n"IO_NC_CHAIR_BENCH_15",500);
    default Schedule(13, 56, UAIState_Smalltalk(), n"FP_NC_SMALLTALK_13");
    default Schedule(20, 30, UAIState_Eat(), n"IO_NC_CHAIR_BENCH_15",500);
    default Schedule(21, 30, UAIState_Smalltalk(), n"FP_NC_SMALLTALK_13");
    default Schedule(23, 0, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
}

