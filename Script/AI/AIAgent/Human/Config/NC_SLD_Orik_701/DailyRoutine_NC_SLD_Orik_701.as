UCLASS()
class UAIAgentConfig_Human_NC_SLD_Orik_701 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_NC_SLD_Orik_701::StaticClass();

}



UCLASS()
class UDailyRoutine_NC_SLD_Orik_701_Start : UAIState_DailyRoutine_Human
{
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_NewCamp_Cave_Village_Huts_Orik);
    default KnownPlaces.Add(Location::Bed, n"IO_NC_BED_ORIK");
    default KnownPlaces.Add(Location::Home, n"IO_NC_BED_ORIK");

    default Schedule(0, 0, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
    default Schedule(6, 0, UAIState_Eat(), n"IO_NC_CHAIR_BENCH_22",500);
    default Schedule(7, 0, UAIState_Smalltalk(), n"FP_NC_SMALLTALK_21");
    default Schedule(19, 0, UAIState_Guard(), n"FP_NC_GUARD_10",500);
    default Schedule(23, 30, UAIState_Eat(), n"IO_NC_CHAIR_BENCH_22",500);
}

