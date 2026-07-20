UCLASS()
class UAIAgentConfig_Human_OC_GRD_Guard02_206 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OC_GRD_Guard02_206::StaticClass();

}

UCLASS()
class UDailyRoutine_OC_GRD_Guard02_206_Start : UAIState_DailyRoutine_Human
{
    default KnownPlaces.Add(Location::Bed, n"IO_OC_BED_GUARD206");
    default KnownPlaces.Add(Location::Home, n"IO_OC_BED_GUARD206");

    default Schedule(6, 0, UAIState_Sleep(), Location::Bed);
    default Schedule(9, 0, UAIState_Smalltalk(), n"FP_OC_SMALLTALK_27",500);
    default Schedule(13, 30, UAIState_Eat(), n"FP_OC_STANDAROUND_70",1000);
    default Schedule(14, 30, UAIState_Smalltalk(), n"FP_OC_SMALLTALK_27",500);
    default Schedule(20, 0, UAIState_Eat(), n"FP_OC_STANDAROUND_70",1000);
    default Schedule(21, 0, UAIState_Smalltalk(), n"FP_OC_SMALLTALK_27",500);
    default Schedule(23, 0, UAISTate_Guard_Watch_Patrolling_Route_Bloodwyn_Night(), n"BreadcrumbActor_OC_Bloodwyn_1");

    default ScheduleIfRaining(6, 0, UAIState_Sleep(), Location::Bed);
    default ScheduleIfRaining(9, 0, UAIState_Smalltalk(), n"FP_OC_SMALLTALK_36",500);
    default ScheduleIfRaining(13, 30, UAIState_Eat(), n"FP_OC_STANDAROUND_70",1000);
    default ScheduleIfRaining(14, 30, UAIState_Smalltalk(), n"FP_OC_SMALLTALK_36",500);
    default ScheduleIfRaining(20, 0, UAIState_Eat(), n"FP_OC_STANDAROUND_70",1000);
    default ScheduleIfRaining(21, 0, UAIState_Smalltalk(), n"FP_OC_SMALLTALK_36",500);
    default ScheduleIfRaining(23, 0, UAISTate_Guard_Watch_Patrolling_Route_Bloodwyn_Night(), n"BreadcrumbActor_OC_Bloodwyn_1");
}