UCLASS()
class UAIAgentConfig_Human_OC_GRD_Guard14_230 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OC_GRD_Guard14_230::StaticClass();

}



UCLASS()
class UDailyRoutine_OC_GRD_Guard14_230_Start : UAIState_DailyRoutine_Human
{
    // default Schedule(8, 0, UAIState_Eat(), n"FP_OC_STANDAROUND_66",1000);
    // default Schedule(8, 30, UAIState_Guard(), n"FP_OC_GUARDPASSAGE_22",700);
    // default Schedule(13, 0, UAIState_Eat(), n"FP_OC_GUARDPASSAGE_22",500);
    // default Schedule(14, 30, UAIState_Guard(), n"FP_OC_GUARDPASSAGE_22",700);
    // default Schedule(21, 0, UAIState_Eat(), n"FP_OC_STANDAROUND_66",1000);
    // default Schedule(22, 30, UAIState_SitAround(), n"FP_OC_STANDAROUND_66",1000);
    // default Schedule(23, 45, UAIState_Sleep(), n"IO_OC_BED_GUARD230");

    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_OldCamp_OuterRing_Hut_MGate);
    default Schedule(0, 0, UAIState_EnsureGateIsOpened(n"Interactive_Winch729213"), n"Interactive_Winch729213");
}



