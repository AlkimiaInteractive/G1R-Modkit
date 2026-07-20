UCLASS()
class UAIAgentConfig_Human_BC_BAN_Bandit_08 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_BC_BAN_Bandit_08::StaticClass();

}



UCLASS()
class UDailyRoutine_BC_BAN_Bandit_08_Start : UAIState_DailyRoutine_Human
{
    default KnownPlaces.Add(Location::Bed, n"IO_BC_BED_BANDIT_08_CM");
    default KnownPlaces.Add(Location::Home, n"IO_BC_BED_BANDIT_08_CM");

    default Schedule(7, 0, UAIState_Eat(), n"IO_BC_CHAIR_07",450);
    default Schedule(8, 0, UAIState_CheckGoods_TakeNotes(),n"FP_BC_CheckGoods_08",1000);
    default Schedule(10, 35, UAIState_Smoke(),n"IO_BC_CHAIR_14",750);
    default Schedule(12, 0, UAIState_Smalltalk(), n"FP_BC_SMALLTALK_07",750);
    default Schedule(15, 0, UAIState_Eat(), n"IO_BC_CHAIR_14",750);
    default Schedule(16, 20, UAIState_CheckGoods_TakeNotes(),n"FP_BC_CheckGoods_08",1000);
    default Schedule(21, 0, UAIState_SitCampfire(), n"IO_BC_CHAIR_01",600);
    default Schedule(23, 25, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);

    default ScheduleIfRaining(7, 0, UAIState_RainShelter(), n"FP_BC_RAINSHELTER_11",450);
    default ScheduleIfRaining(12, 0, UAIState_Smalltalk(), n"FP_BC_SMALLTALK_12",450);
    default ScheduleIfRaining(15, 0, UAIState_RainShelter(), n"FP_BC_RAINSHELTER_11",450);
    default ScheduleIfRaining(23, 25, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
}