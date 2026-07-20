UCLASS()
class UAIAgentConfig_Human_NC_ORG_Rogue25_846 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_NC_ORG_Rogue25_846::StaticClass();

}



UCLASS()
class UDailyRoutine_NC_ORG_Rogue25_846_Start : UAIState_DailyRoutine_Human
{
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_NewCamp_Exterior_RiceFields_Huts_05);
    default KnownPlaces.Add(Location::Bed, n"IO_NC_BED_ROGUE846_CM");
    default KnownPlaces.Add(Location::Home, n"IO_NC_BED_ROGUE846_CM");

    default Schedule(0, 0, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
    default Schedule(7, 15, UAIState_Eat(), n"IO_NC_CHAIR_BENCH_29");
    default Schedule(8, 30, UAIState_Smalltalk(), n"FP_NC_SMALLTALK_26");
    default Schedule(12, 56, UAIState_Guard(), n"FP_NC_GUARD_31");
    default Schedule(13, 56, UAIState_Smalltalk(), n"FP_NC_SMALLTALK_26");
    default Schedule(17, 0, UAIState_Cook(), n"IO_NC_RF_CAULDRON_01");
    default Schedule(19, 0, UAIState_Guard(), n"FP_NC_GUARD_31");
    default Schedule(20, 0, UAIState_Campfire(), n"IO_NC_CHAIR_BENCH_29");

    default ScheduleIfRaining(2, 30, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
    default ScheduleIfRaining(7, 15, UAIState_SitAround(), n"IO_NC_CHAIR_34", 500);
    default ScheduleIfRaining(8, 30, UAIState_Sit(), n"IO_NC_CHAIR_BENCH_41",500);
    default ScheduleIfRaining(12, 56, UAIState_SitAround(), n"IO_NC_CHAIR_34",500);
    default ScheduleIfRaining(13, 56, UAIState_Sit(), n"IO_NC_CHAIR_BENCH_41",500);
}