UCLASS()
class UAIAgentConfig_Human_NC_ORG_Rogue13_823 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_NC_ORG_Rogue13_823::StaticClass();

}



UCLASS()
class UDailyRoutine_NC_ORG_Rogue13_823_Start : UAIState_DailyRoutine_Human
{
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_NewCamp_Cave_Village_Huts_19);
    default KnownPlaces.Add(Location::Bed, n"IO_NC_BED_ROGUE823");
    default KnownPlaces.Add(Location::Home, n"IO_NC_BED_ROGUE823");

    default Schedule(0, 0, UAIState_Sleep(), Location::Bed, WaypointRadius = 200);
    default Schedule(7, 0, UAIState_CarryFoodBags(n"FP_NC_TakeFoodBag_01", n"FP_NC_LeaveFoodBag_01"), NAME_None);
    default Schedule(22, 0, UAIState_SitAround(), n"IO_NC_CHAIR_BENCH_05", 500);
}