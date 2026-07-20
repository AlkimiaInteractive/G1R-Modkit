UCLASS()
class UAIAgentConfig_Human_OC_GRD_Guard11_227 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OC_GRD_Guard11_227::StaticClass();

}

UCLASS()
class UDailyRoutine_OC_GRD_Guard11_227_Ownership : UAIState_DailyRoutine_Human
{
    default KnownPlaces.Add(Location::Bed, n"IO_OC_BED_GUARD227");
    default KnownPlaces.Add(Location::Home, n"IO_OC_BED_GUARD227");
}

UCLASS()
class UDailyRoutine_OC_GRD_Guard11_227_Start : UDailyRoutine_OC_GRD_Guard11_227_Ownership
{
    default Schedule(23, 15, UAISTate_Guard_Watch_Patrolling_Route_Guard11(), n"BreadcrumbActor_OC_NIGHTWATCH_GUARD11_1");
    default Schedule(7, 45, UAIState_Eat(), n"FP_OC_CAMPFIRE_34",1000);
    default Schedule(8, 30, UAIState_StandAround(), n"FP_OC_CAMPFIRE_34",1000);
    default Schedule(11, 0, UAIState_RoastScavenger(), n"IO_OC_CAMPFIRE_ROTISSERIE_05",1000);
    default Schedule(13, 30, UAIState_Eat(), n"FP_OC_CAMPFIRE_34",1000);
    default Schedule(14, 0, UAIState_RoastScavenger(), n"IO_OC_CAMPFIRE_ROTISSERIE_05",1000);
    default Schedule(16, 20, UAIState_StandAround(), n"FP_OC_CAMPFIRE_34",1000);
    default Schedule(20, 0, UAIState_Eat(), n"FP_OC_CAMPFIRE_34",1000);
    default Schedule(21, 0, UAIState_StandAround(), n"FP_OC_CAMPFIRE_34",1000);

    default ScheduleIfRaining(23, 15, UAISTate_Guard_Watch_Patrolling_Route_Guard11(), n"BreadcrumbActor_OC_NIGHTWATCH_GUARD11_1");
    default ScheduleIfRaining(7, 45, UAIState_RainShelter_Guard(), n"FP_OC_RAINSHELTER_91",750);
}

UCLASS()
class UDailyRoutine_OC_GRD_Guard11_227_WaitYard : UDailyRoutine_OC_GRD_Guard11_227_Ownership
{
    default Schedule(20, 0, UAIState_Guard(), n"FP_OC_STAND_YARD_10", 300);
    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
} 

UCLASS()
class UDailyRoutine_OC_GRD_Guard11_227_Ot : UDailyRoutine_OC_GRD_Guard11_227_Ownership
{
    default Schedule(20, 0, UAIState_Guard(), n"FP_OC_GUARDPASSAGE_17", 300);
    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
} 