UCLASS()
class UAIAgentConfig_Human_OC_GRD_Guard13_229 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OC_GRD_Guard13_229::StaticClass();

}



UCLASS()
class UDailyRoutine_OC_GRD_Guard13_229_Start : UAIState_DailyRoutine_Human
{
    default Schedule(7, 0, UAIState_Eat(), n"FP_OC_STANDAROUND_70");
    default Schedule(8, 0, UAISTate_Guard_Watch_Patrolling_Route_Guard13(), n"Breadcrumb_OldCamp_GuardPalisade_Market_Guard229_1");
    default Schedule(20, 0, UAIState_Eat(), n"FP_OC_STANDAROUND_70");
    default Schedule(21, 30, UAIState_SitAround(), n"FP_OC_STANDAROUND_70");
    default Schedule(23, 45, UAIState_Sleep(), n"IO_OC_BED_GUARD229");
}

