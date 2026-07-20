UCLASS()
class UAIAgentConfig_Human_OC_GRD_Guard23_243 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OC_GRD_Guard23_243::StaticClass();

}



UCLASS()
class UDailyRoutine_OC_GRD_Guard23_243_Start : UAIState_DailyRoutine_Human
{
    default Schedule(7, 0, UAIState_Eat(), n"FP_OC_GUARD_01");
    default Schedule(8, 0, UAISTate_Guard_Watch_Patrolling_Route_Guard23(), n"BreadcrumbActor_OC_GuardPalisade_Market_Guard243_1");
    default Schedule(20, 0, UAIState_Eat(), n"FP_OC_GUARD_01");
    default Schedule(23, 0, UAISTate_Guard_Watch_Patrolling_Route_Guard23_Night(), n"BreadcrumbActor_OC_GuardPalisade_Night_Market_Guard243_20");

    default ScheduleIfRaining(7, 0, UAIState_Eat(), n"FP_OC_RAINSHELTER_105");
    default ScheduleIfRaining(8, 0, UAIState_RainShelter_Guard(),n"FP_OC_RAINSHELTER_105");
    default ScheduleIfRaining(20, 0, UAIState_Eat(), n"FP_OC_RAINSHELTER_105");
    default ScheduleIfRaining(23, 0, UAISTate_Guard_Watch_Patrolling_Route_Guard23_Night(), n"BreadcrumbActor_OC_GuardPalisade_Night_Market_Guard243_20");

}

UCLASS()
class UDailyRoutine_OC_GRD_Guard23_243_Fmtaken : UAIState_DailyRoutine_Human
{
    default Schedule(8, 0, UAIState_GuardPatrol(), n"FMC_FM_ENTRANCE");
    default Schedule(24, 0, UAIState_Sleep(), n"OCC_MERCS_UPPER_LEFT_ROOM_FRONT");
}


UCLASS()
class UDailyRoutine_OC_GRD_Guard23_243_Orcassault : UAIState_DailyRoutine_Human
{

}