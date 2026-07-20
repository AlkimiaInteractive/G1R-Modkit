UCLASS()
class UAIAgentConfig_Human_OC_GRD_Guard20_240 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OC_GRD_Guard20_240::StaticClass();

}



UCLASS()
class UDailyRoutine_OC_GRD_Guard20_240_Start : UAIState_DailyRoutine_Human
{
    default Schedule(7, 0, UAIState_Eat(), n"FP_OC_STANDAROUND_70");
    default Schedule(8, 0, UAISTate_Guard_Watch_Patrolling_Route_Guard20(), n"BreadcrumbActor_OC_GuardPalisade_Entrance_Guard240_1");
    default Schedule(20, 0, UAIState_Eat(), n"FP_OC_STANDAROUND_70");
    default Schedule(21, 0, UAIState_StandAround(), n"FP_OC_STANDAROUND_70",1000);
    default Schedule(23, 46, UAIState_Sleep(), n"IO_OC_BED_GUARD240");

    default ScheduleIfRaining(7, 0, UAIState_Eat(), n"FP_OC_STANDAROUND_70");
    default ScheduleIfRaining(8, 0, UAIState_RainShelter_Guard(),n"FP_OC_RAINSHELTER_95");
    default ScheduleIfRaining(20, 0, UAIState_Eat(), n"FP_OC_STANDAROUND_70");
    default ScheduleIfRaining(21, 0, UAIState_StandAround(), n"FP_OC_STANDAROUND_70",1000);
    default ScheduleIfRaining(23, 46, UAIState_Sleep(), n"IO_OC_BED_GUARD240");
}

UCLASS()
class UDailyRoutine_OC_GRD_Guard20_240_Fmtaken : UAIState_DailyRoutine_Human
{

}


UCLASS()
class UDailyRoutine_OC_GRD_Guard20_240_Orcassault : UAIState_DailyRoutine_Human
{

}