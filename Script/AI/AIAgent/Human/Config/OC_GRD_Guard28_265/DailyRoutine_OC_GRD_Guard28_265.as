UCLASS()
class UAIAgentConfig_Human_OC_GRD_Guard28_265 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OC_GRD_Guard28_265::StaticClass();

}



UCLASS()
class UDailyRoutine_OC_GRD_Guard28_265_Start : UAIState_DailyRoutine_Human
{
    default KnownPlaces.Add(Location::Bed, n"");
    default KnownPlaces.Add(Location::Home, n"");

    //default Schedule(1, 0, UAIState_SleepStanding(), n"FP_OC_STANDAROUND_72",2000);
    default Schedule(21, 0, UAISTate_Guard_Watch_Patrolling_Route_Guard28_Night(), n"BreadcrumbActor_OC_NIGHTWATCH_GUARD28_1");
    default Schedule(7, 0, UAISTate_Guard_Watch_Patrolling_Route_Guard28_Day(), n"BreadcrumbActor_OC_NIGHTWATCH_GUARD28_1");

    
    default ScheduleIfRaining(21, 0, UAISTate_Guard_Watch_Patrolling_Route_Guard28_Night(), n"BreadcrumbActor_OC_NIGHTWATCH_GUARD28_1");
    default ScheduleIfRaining(7, 0, UAISTate_Guard_Watch_Patrolling_Route_Guard28_Day(), n"BreadcrumbActor_OC_NIGHTWATCH_GUARD28_1");

}
