UCLASS()
class UAIAgentConfig_Human_OC_GRD_Guard25_245 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OC_GRD_Guard25_245::StaticClass();

}



UCLASS()
class UDailyRoutine_OC_GRD_Guard25_245_Start : UAIState_DailyRoutine_Human
{
    default Schedule(0, 0, UAIState_Sleep(), n"FP_OC_GUARDPASSAGE_04",300);
    default Schedule(6, 0, UAIState_Eat(), n"FP_OC_GUARDPASSAGE_04",300);
    default Schedule(6, 30, UAISTate_Guard_Watch_Patrolling_Route_Guard25(), n"BreadcrumbActor_OC_Castle_Out_Guard245_1");
    default Schedule(23, 00, UAIState_Eat(), n"FP_OC_GUARDPASSAGE_04",300);

    default ScheduleIfRaining(0, 0, UAIState_Sleep(), n"FP_OC_GUARDPASSAGE_46",300);
    default ScheduleIfRaining(6, 0, UAIState_Eat(), n"FP_OC_GUARDPASSAGE_46",300);
    default ScheduleIfRaining(6, 30, UAIState_Guard(), n"FP_OC_GUARDPASSAGE_46",300);
    default ScheduleIfRaining(23, 00, UAIState_Eat(), n"FP_OC_GUARDPASSAGE_46",300);

}

UCLASS()
class UDailyRoutine_OC_GRD_Guard25_245_Ot : UAIState_DailyRoutine_Human
{
    default Schedule(20, 0, UAIState_Guard(), n"FP_OC_GUARDPASSAGE_42");
}

