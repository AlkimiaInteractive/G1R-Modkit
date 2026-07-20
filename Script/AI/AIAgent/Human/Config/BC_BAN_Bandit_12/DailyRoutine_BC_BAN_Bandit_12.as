UCLASS()
class UAIAgentConfig_Human_BC_BAN_Bandit_12 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_BC_BAN_Bandit_12::StaticClass();

}



UCLASS()
class UDailyRoutine_BC_BAN_Bandit_12_Start : UAIState_DailyRoutine_Human
{
    default KnownPlaces.Add(Location::Bed, n"IO_BC_BED_BANDIT_12_CM");
    default KnownPlaces.Add(Location::Home, n"IO_BC_BED_BANDIT_12_CM");

    default Schedule(0, 10, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
    default Schedule(8, 0, UAISTate_Guard_Watch_Patrolling_Route_Bandit12(), n"BreadcrumbActor_BC_GuardPlatform_1");

    default ScheduleIfRaining(0, 10, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
    default ScheduleIfRaining(8, 0, UAIState_RainShelter(), n"FP_BC_RAINSHELTER_15", 400);
}