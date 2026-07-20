UCLASS()
class UAIAgentConfig_Human_OC_GRD_Fletcher_255 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OC_GRD_Fletcher_255::StaticClass();

}

UCLASS()
class UDailyRoutine_OC_GRD_Fletcher_255_Ownership : UAIState_DailyRoutine_Human
{
    default KnownPlaces.Add(Location::Bed, n"IO_OC_BED_FLETCHER");
    default KnownPlaces.Add(Location::Home, n"IO_OC_BED_FLETCHER");
}

UCLASS()
class UDailyRoutine_OC_GRD_Fletcher_255_Start : UDailyRoutine_OC_GRD_Fletcher_255_Ownership
{
    default RolesWhileAssigned.AddTag(GameplayTag::Role_Guard_OC_Fletcher);

    // default Schedule(6, 0, UAIState_Eat(), n"FP_OC_STANDAROUND_70",1000);
    default Schedule(8, 30, UAISTate_Guard_Watch_Patrolling_Route_Fletcher(), n"BreadcrumbActor_OC_CAMP_FLETCHER_1");
    default Schedule(22, 30, UAISTate_Guard_Watch_Patrolling_Route_Fletcher_Night(), n"BreadcrumbActor_OC_CAMP_FLETCHER_1");

    // default Schedule(21, 0, UAIState_Eat(), n"FP_OC_STANDAROUND_70",500);
    // default Schedule(22, 0, UAIState_Sleep(), Location::Bed);

    //default ScheduleIfRaining(6, 0, UAIState_Eat(), n"FP_OC_STANDAROUND_70",1000);
    default ScheduleIfRaining(8, 30, UAISTate_Guard_Watch_Patrolling_Route_Fletcher(), n"BreadcrumbActor_OC_CAMP_FLETCHER_1");
    default ScheduleIfRaining(22, 30, UAISTate_Guard_Watch_Patrolling_Route_Fletcher_Night(), n"BreadcrumbActor_OC_CAMP_FLETCHER_1");
    //default ScheduleIfRaining(21, 0, UAIState_Eat(), n"FP_OC_STANDAROUND_70",500);
    //default ScheduleIfRaining(23, 0, UAIState_Sleep(), Location::Bed);
}

UCLASS()
class UDailyRoutine_OC_GRD_Fletcher_255_Fmtaken : UDailyRoutine_OC_GRD_Fletcher_255_Ownership
{
    default RolesWhileAssigned.AddTag(GameplayTag::Role_Guard_OC_Fletcher);

    default Schedule(20, 0, UAIState_Guard(), n"FP_OC_GUARDPASSAGE_28");
    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}


UCLASS()
class UDailyRoutine_OC_GRD_Fletcher_255_Fmtaken2 : UDailyRoutine_OC_GRD_Fletcher_255_Ownership
{
    default RolesWhileAssigned.AddTag(GameplayTag::Role_Guard_OC_Fletcher);
    
    default Schedule(20, 0, UAIState_Guard(), n"FP_OC_GUARDPASSAGE_28");
    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}