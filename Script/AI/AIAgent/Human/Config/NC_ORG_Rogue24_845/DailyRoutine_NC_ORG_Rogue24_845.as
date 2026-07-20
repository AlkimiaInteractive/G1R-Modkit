UCLASS()
class UAIAgentConfig_Human_NC_ORG_Rogue24_845 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_NC_ORG_Rogue24_845::StaticClass();

}



UCLASS()
class UDailyRoutine_NC_ORG_Rogue24_845_Start : UAIState_DailyRoutine_Human
{
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_NewCamp_Exterior_RiceFields_Huts_05);
    default KnownPlaces.Add(Location::Bed, n"IO_NC_BED_ROGUE845_CM");
    default KnownPlaces.Add(Location::Home, n"IO_NC_BED_ROGUE845_CM");

    default Schedule(2, 30, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
    default Schedule(7, 15, UAIState_Eat(), n"IO_NC_CHAIR_BENCH_29");
    default Schedule(8, 30, UAIState_GuardPatrol(), n"FP_NC_GUARD_38",3000);
    default Schedule(14, 0, UAIState_Guard(), n"FP_NC_GUARD_32");
    default Schedule(18, 45, UAIState_GuardPatrol(), n"FP_NC_GUARD_38",3000);
    default Schedule(20, 0, UAIState_Campfire(), n"IO_NC_CHAIR_BENCH_29");

    default ScheduleIfRaining(2, 30, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
    default ScheduleIfRaining(7, 15, UAIState_SitAround(), n"IO_NC_CHAIR_31", 500);
}