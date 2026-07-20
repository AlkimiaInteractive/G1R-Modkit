UCLASS()
class UAIAgentConfig_Human_BC_BAN_Bandit_18 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_BC_BAN_Bandit_18::StaticClass();

}



UCLASS()
class UDailyRoutine_BC_BAN_Bandit_18_Start : UAIState_DailyRoutine_Human
{
    default KnownPlaces.Add(Location::Bed, n"IO_BC_BED_BANDIT_18");
    default KnownPlaces.Add(Location::Home, n"IO_BC_BED_BANDIT_18");

    default Schedule(7, 8, UAIState_Guard(), n"FP_BC_Guard_03");
    default Schedule(12, 10, UAIState_TakeNotes(), n"FP_BC_Guard_03");
    default Schedule(15, 40, UAIState_Guard(), n"FP_BC_Guard_03");
    default Schedule(23, 50, UAIState_Sleep(), n"FP_BC_Guard_03");

    default Schedule(23, 0, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);

    default ScheduleIfRaining(0, 0, UAIState_Guard(), n"FP_BC_RAINSHELTER_21", 450);
    default ScheduleIfRaining(23, 0, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
}