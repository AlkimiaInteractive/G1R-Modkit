UCLASS()
class UAIAgentConfig_Human_OC_GRD_Guard03_209 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OC_GRD_Guard03_209::StaticClass();

}



UCLASS()
class UDailyRoutine_OC_GRD_Guard03_209_Start : UAIState_DailyRoutine_Human
{
    default KnownPlaces.Add(Location::Bed, n"IO_OC_BED_GUARD209");
    default KnownPlaces.Add(Location::Home, n"IO_OC_BED_GUARD209");

    default Schedule(23, 0, UAISTate_Guard_Watch_Patrolling_Route_Guard03(), n"BreadcrumbActor_OC_NIGHTWATCH_GUARD03_1");
    default Schedule(7, 20, UAIState_Eat(), n"FP_OC_STANDAROUND_70",1000);
    default Schedule(8, 20, UAIState_Smalltalk(), n"FP_OC_SMALLTALK_55",750);
    default Schedule(13, 30, UAIState_Eat(), n"FP_OC_STANDAROUND_70",1000);
    default Schedule(14, 30, UAIState_Smalltalk(), n"FP_OC_SMALLTALK_55",750);
    default Schedule(20, 0, UAIState_Eat(), n"FP_OC_STANDAROUND_70",1000);
    default Schedule(21, 20, UAIState_Smalltalk(), n"FP_OC_SMALLTALK_55",750);

    default ScheduleIfRaining(23, 0, UAISTate_Guard_Watch_Patrolling_Route_Guard03(), n"BreadcrumbActor_OC_NIGHTWATCH_GUARD03_1");
    default ScheduleIfRaining(7, 20, UAIState_Eat(), n"FP_OC_STANDAROUND_70",1000);
    default ScheduleIfRaining(8, 20, UAIState_Smalltalk(), n"FP_OC_SMALLTALK_64",750);
    default ScheduleIfRaining(13, 30, UAIState_Eat(), n"FP_OC_STANDAROUND_70",1000);
    default ScheduleIfRaining(14, 30, UAIState_Smalltalk(), n"FP_OC_SMALLTALK_64",750);
    default ScheduleIfRaining(20, 0, UAIState_Eat(), n"FP_OC_STANDAROUND_70",1000);
    default ScheduleIfRaining(21, 20, UAIState_Smalltalk(), n"FP_OC_SMALLTALK_64",750);
    
}