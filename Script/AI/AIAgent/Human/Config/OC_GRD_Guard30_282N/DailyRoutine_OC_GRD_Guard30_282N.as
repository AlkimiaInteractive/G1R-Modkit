UCLASS()
class UAIAgentConfig_Human_OC_GRD_Guard30_282N : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OC_GRD_Guard30_282N::StaticClass();

}

UCLASS()
class UDailyRoutine_OC_GRD_Guard30_282N_Start : UAIState_DailyRoutine_Human
{
    //default Schedule(1, 0, UAIState_CarryBoxes(n"FP_EZ_TakeBox",n"FP_EZ_LeaveBox"), NAME_None);
    //default Schedule(22, 0, UAIState_CarryBoxesMidHigh(n"FP_EZ_TakeBoxMidHigh",n"FP_EZ_LeaveBox"), NAME_None);
    //default Schedule(1, 0, UAIState_CarryPlanks(n"FP_EZ_TakePlank",n"FP_EZ_LeaveBox"), NAME_None);
    //default Schedule(17, 0, UAIState_CarryPlanksFromWall(n"FP_EZ_TakePlankFromWall",n"FP_EZ_LeaveBox"), NAME_None);
    //default Schedule(10, 0, UAIState_CarryOreBags(n"FP_EZ_TakeOreBag",n"FP_EZ_LeaveBox"), NAME_None);

    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_ExchangeZone_Hut);
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_ExchangeZone_Cage_01);
    default Schedule(8, 0, UAIState_CarryBoxesMidHigh(n"FP_EZ_TakeBoxMidHigh",n"FP_EZ_LeaveBox"), NAME_None);
    default Schedule(13, 0, UAIState_Eat_Seated(), n"IO_EZ_CHAIR_BENCH_02",400);
    default Schedule(15, 0, UAIState_CarryPlanksFromWall(n"FP_EZ_TakePlankFromWall",n"FP_EZ_LeavePlank"), NAME_None);
    default Schedule(19, 0, UAIState_Smoke_Seated(), n"IO_EZ_CHAIR_BENCH_02",400);
    default Schedule(21, 0, UAIState_Cook(), n"IO_EZ_Cauldron_01");
    default Schedule(23, 0, UAIState_Sleep(), n"IO_EZ_CHAIR_BENCH_02",400);
}