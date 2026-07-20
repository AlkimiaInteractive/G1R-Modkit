UCLASS()
class UAIAgentConfig_Human_OC_GRD_Guard15_231 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OC_GRD_Guard15_231::StaticClass();

}

UCLASS()
class UDailyRoutine_OC_GRD_Guard15_231_Ownership : UAIState_DailyRoutine_Human
{
    default KnownPlaces.Add(Location::Bed, n"IO_OC_BED_GUARD231");
    default KnownPlaces.Add(Location::Home, n"IO_OC_BED_GUARD231");
}

UCLASS()
class UDailyRoutine_OC_GRD_Guard15_231_Start : UDailyRoutine_OC_GRD_Guard15_231_Ownership
{
    default Schedule(23, 0, UAISTate_Guard_Watch_Patrolling_Route_Guard15(), n"BreadcrumbActor_OC_NIGHTWATCH_GUARD15_1");
    default Schedule(7, 46, UAIState_Eat(), n"FP_OC_CAMPFIRE_34",1000);
    default Schedule(8, 30, UAIState_StandAround(), n"FP_OC_CAMPFIRE_34",1000);
    default Schedule(13, 32, UAIState_Eat(), n"FP_OC_CAMPFIRE_34",1000);
    default Schedule(14, 30, UAIState_StandAround(), n"FP_OC_CAMPFIRE_34",1000);
    default Schedule(20, 0, UAIState_Eat(), n"FP_OC_CAMPFIRE_34",1000);
    default Schedule(21, 0, UAIState_StandAround(), n"FP_OC_CAMPFIRE_34",1000);

    default ScheduleIfRaining(7, 46, UAIState_RainShelter_Digger(), n"FP_OC_RAINSHELTER_91",500);
    default ScheduleIfRaining(23, 0, UAISTate_Guard_Watch_Patrolling_Route_Guard15(), n"BreadcrumbActor_OC_NIGHTWATCH_GUARD15_1");

    
}

UCLASS()
class UDailyRoutine_OC_GRD_Guard15_231_WaitYard : UDailyRoutine_OC_GRD_Guard15_231_Ownership
{
    default Schedule(20, 0, UAIState_Guard(), n"FP_OC_STAND_YARD_11", 300);
    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
} 

