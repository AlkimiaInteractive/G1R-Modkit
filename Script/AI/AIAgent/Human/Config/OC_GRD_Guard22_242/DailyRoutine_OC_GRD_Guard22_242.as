UCLASS()
class UAIAgentConfig_Human_OC_GRD_Guard22_242 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OC_GRD_Guard22_242::StaticClass();

}



UCLASS()
class UDailyRoutine_OC_GRD_Guard22_242_Start : UAIState_DailyRoutine_Human
{
    default Schedule(7, 0, UAIState_Eat(), n"FP_OC_STANDAROUND_67");
    default Schedule(8, 0, UAISTate_Guard_Watch_Patrolling_Route_Guard22(), n"BreadcrumbActor_OC_GuardPalisade_Market_Guard242_1");
    default Schedule(20, 0, UAIState_Eat(), n"FP_OC_STANDAROUND_67");
    default Schedule(21, 0, UAIState_StandAround(), n"FP_OC_STANDAROUND_67",1000);
    default Schedule(23, 46, UAIState_Sleep(), n"IO_OC_BED_GUARD242");
}

UCLASS()
class UDailyRoutine_OC_GRD_Guard22_242_Fmtaken : UAIState_DailyRoutine_Human
{

}


UCLASS()
class UDailyRoutine_OC_GRD_Guard22_242_Orcassault : UAIState_DailyRoutine_Human
{

}