UCLASS()
class UAIAgentConfig_Human_OC_GRD_Guard24_244 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OC_GRD_Guard24_244::StaticClass();

}



UCLASS()
class UDailyRoutine_OC_GRD_Guard24_244_Start : UAIState_DailyRoutine_Human
{
    default Schedule(7, 0, UAIState_Eat(), n"FP_OC_GUARD_02");
    default Schedule(8, 0, UAISTate_Guard_Watch_Patrolling_Route_Guard24(), n"BreadcrumbActor_OC_GuardPalisade_Arena_Guard244_1");
    default Schedule(20, 0, UAIState_Eat(), n"FP_OC_GUARD_02");
    default Schedule(23, 0, UAISTate_Guard_Watch_Patrolling_Route_Guard24_Night(), n"BreadcrumbActor_OC_GuardPalisade_Night_Arena_Guard244_17");

    default ScheduleIfRaining(7, 0, UAIState_Eat(), n"FP_OC_RAINSHELTER_97");
    default ScheduleIfRaining(8, 0, UAIState_RainShelter_Guard(),n"FP_OC_RAINSHELTER_97");
    default ScheduleIfRaining(20, 0, UAIState_Eat(), n"FP_OC_RAINSHELTER_97");
    default ScheduleIfRaining(23, 0, UAISTate_Guard_Watch_Patrolling_Route_Guard24_Night(), n"BreadcrumbActor_OC_GuardPalisade_Night_Arena_Guard244_17");

}

UCLASS()
class UDailyRoutine_OC_GRD_Guard24_244_Fmtaken : UAIState_DailyRoutine_Human
{
    default Schedule(20, 0, UAIState_Guard(), n"FP_OC_GUARDPASSAGE_33");
    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}


UCLASS()
class UDailyRoutine_OC_GRD_Guard24_244_Fmtaken2 : UAIState_DailyRoutine_Human
{
    default Schedule(20, 0, UAIState_Guard(), n"FP_OC_GUARDPASSAGE_33");
    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}

