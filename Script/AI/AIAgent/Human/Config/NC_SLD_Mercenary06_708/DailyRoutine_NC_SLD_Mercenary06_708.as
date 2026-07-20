UCLASS()
class UAIAgentConfig_Human_NC_SLD_Mercenary06_708 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_NC_SLD_Mercenary06_708::StaticClass();

}

UCLASS()
class UDailyRoutine_NC_SLD_Mercenary06_708_Ownership : UAIState_DailyRoutine_Human
{
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_NewCamp_Cave_Village_Huts_29);
    default KnownPlaces.Add(Location::Bed, n"IO_NC_BED_MERCENARY708");
    default KnownPlaces.Add(Location::Home, n"IO_NC_BED_MERCENARY708");
}


UCLASS()
class UDailyRoutine_NC_SLD_Mercenary06_708_Start : UDailyRoutine_NC_SLD_Mercenary06_708_Ownership
{
    default Schedule(0, 0, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
    default Schedule(8, 0, UAIState_Eat(), n"IO_NC_CHAIR_BENCH_47",1000);
    default Schedule(9, 0, UAIState_SitAround(), n"IO_NC_CHAIR_BENCH_47",1000);
    default Schedule(13, 1, UAIState_Eat(), n"IO_NC_CHAIR_BENCH_47",1000);
    default Schedule(14, 4, UAIState_SitAround(), n"IO_NC_CHAIR_BENCH_47",1000);
    default Schedule(21, 28, UAIState_Eat(), n"IO_NC_CHAIR_BENCH_47",1000);
    default Schedule(22, 29, UAIState_SitAround(), n"IO_NC_CHAIR_BENCH_47",1000);
}

UCLASS()
class UDailyRoutine_NC_SLD_Mercenary06_708_FMOre : UDailyRoutine_NC_SLD_Mercenary06_708_Ownership
{
    default Schedule(5, 0, UAIState_StandAround(), n"FP_NC_STANDAROUND_MERCENARY_STORY");
}