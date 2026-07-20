UCLASS()
class UAIAgentConfig_Human_BC_BAN_Bandit_09 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_BC_BAN_Bandit_09::StaticClass();

}



UCLASS()
class UDailyRoutine_BC_BAN_Bandit_09_Start : UAIState_DailyRoutine_Human
{
    default KnownPlaces.Add(Location::Bed, n"IO_BC_BED_BANDIT_09");
    default KnownPlaces.Add(Location::Home, n"IO_BC_BED_BANDIT_09");

    default Schedule(8, 0, UAIState_Eat(), n"IO_BC_CHAIR_08",450);
    default Schedule(9, 0, UAIState_CarryOreBags(n"FP_BC_TakeOreBag_01", n"FP_BC_LeaveOreBag_01"), NAME_None);
    default Schedule(12, 0, UAIState_Smalltalk(), n"FP_BC_SMALLTALK_08",750);
    default Schedule(15, 0, UAIState_Eat(), n"IO_BC_CHAIR_12",750);
    default Schedule(16, 0, UAIState_CarryOreBags(n"FP_BC_TakeOreBag_01", n"FP_BC_LeaveOreBag_01"), NAME_None);
    default Schedule(21, 0, UAIState_SitCampfire(), n"IO_BC_CHAIR_02",600);
    default Schedule(23, 25, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);

    default ScheduleIfRaining(8, 0, UAIState_RainShelter(), n"FP_BC_RAINSHELTER_12",450);
    default ScheduleIfRaining(12, 0, UAIState_Smalltalk(), n"FP_BC_SMALLTALK_11",450);
    default ScheduleIfRaining(15, 0, UAIState_RainShelter(), n"FP_BC_RAINSHELTER_12",450);
    default ScheduleIfRaining(23, 25, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
}