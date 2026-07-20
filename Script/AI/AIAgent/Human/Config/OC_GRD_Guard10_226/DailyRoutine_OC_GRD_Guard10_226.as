UCLASS()
class UAIAgentConfig_Human_OC_GRD_Guard10_226 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OC_GRD_Guard10_226::StaticClass();

}



UCLASS()
class UDailyRoutine_OC_GRD_Guard10_226_Start : UAIState_DailyRoutine_Human
{
    default KnownPlaces.Add(Location::Bed, n"IO_OC_BED_GUARD226");
    default KnownPlaces.Add(Location::Home, n"IO_OC_BED_GUARD226");

    default Schedule(23, 0, UAISTate_Guard_Watch_Patrolling_Route_Guard10(), n"BreadcrumbActor_OC_NIGHTWATCH_GUARD10_1");
    default Schedule(7, 25, UAIState_Eat(), n"FP_OC_STANDAROUND_68",1000);
    default Schedule(8, 20, UAIState_Smalltalk(), n"FP_OC_SMALLTALK_55",750);
    default Schedule(13, 30, UAIState_Eat(), n"FP_OC_STANDAROUND_68");
    default Schedule(14, 30, UAIState_Smalltalk(), n"FP_OC_SMALLTALK_55",750);
    default Schedule(20, 0, UAIState_Eat(), n"FP_OC_STANDAROUND_68");
    default Schedule(21, 20, UAIState_Smalltalk(), n"FP_OC_SMALLTALK_55",750);

    default ScheduleIfRaining(23, 0, UAISTate_Guard_Watch_Patrolling_Route_Guard10(), n"BreadcrumbActor_OC_NIGHTWATCH_GUARD10_1");
    default ScheduleIfRaining(7, 25, UAIState_Eat(), n"FP_OC_STANDAROUND_68",1000);
    default ScheduleIfRaining(8, 20, UAIState_Smalltalk(), n"FP_OC_RAINSHELTER_94",750);
    default ScheduleIfRaining(13, 30, UAIState_Eat(), n"FP_OC_STANDAROUND_68");
    default ScheduleIfRaining(14, 30, UAIState_Smalltalk(), n"FP_OC_RAINSHELTER_94",750);
    default ScheduleIfRaining(20, 0, UAIState_Eat(), n"FP_OC_STANDAROUND_68");
    default ScheduleIfRaining(21, 20, UAIState_Smalltalk(), n"FP_OC_RAINSHELTER_94",750);
}