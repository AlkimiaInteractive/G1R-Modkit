UCLASS()
class UAIAgentConfig_Human_NC_ORG_Ratford_818 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_NC_ORG_Ratford_818::StaticClass();

}



UCLASS()
class UDailyRoutine_NC_ORG_Ratford_818_Start : UAIState_DailyRoutine_Human
{
    default Schedule(0, 0, UAIState_Sleep(), n"Bed_Ratford_818");
    default Schedule(8, 0, UAIState_Eat(), n"IO_CHAIR_EF_RATFORD_CAMP",400);
    default Schedule(9, 0, UAIState_Smalltalk(), n"FP_SMALLTALK_A_START_PATH_1_5_1",400);
    default Schedule(11, 0, UAIState_Leatherworking(), n"IO_OC_TANNING_02",400);
    default Schedule(15, 0, UAIState_Eat(), n"IO_CHAIR_EF_RATFORD_CAMP",400);
    default Schedule(16, 0, UAIState_Smalltalk(), n"FP_SMALLTALK_A_START_PATH_1_5_1",400);
    default Schedule(18, 0, UAIState_Leatherworking(), n"IO_OC_TANNING_02",400);
    default Schedule(21, 0, UAIState_Eat(), n"IO_CHAIR_EF_RATFORD_CAMP",400);
    default Schedule(22, 0, UAIState_SitCampfire(), n"IO_CHAIR_EF_RATFORD_CAMP",400);

    default ScheduleIfRaining(0, 0, UAIState_Sleep(), n"Bed_Ratford_818", WaypointRadius = 500);
    default ScheduleIfRaining(8, 0, UAIState_Eat(), n"IO_CHAIR_EF_RATFORD_CAMP",500);
}