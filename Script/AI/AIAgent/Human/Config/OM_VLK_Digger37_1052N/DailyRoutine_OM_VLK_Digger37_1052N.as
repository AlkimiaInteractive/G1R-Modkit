UCLASS()
class UAIAgentConfig_Human_OM_VLK_Digger37_1052N : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OM_VLK_Digger37_1052N::StaticClass();

}



UCLASS()
class UDailyRoutine_OM_VLK_Digger37_1052N_Start : UAIState_DailyRoutine_Human
{
    //default AssociatedCrimeAreas.AddTag(GameplayTag::CrimeLocation_OldMine);
    //default AssociatedCrimeAreas.AddTag(GameplayTag::CrimeLocation_OldCamp);
    
    // default Schedule(6, 0, UAIState_Rest(), n"FP_OM_REST_03");
    // default Schedule(18, 0, UAIState_CarryOreBags(n"FP_OM_TakeOreBag_05",n"FP_OM_LeaveOreBag_6"), NAME_None);

    default Schedule(6, 0, UAIState_CarryOreBags(n"FP_OM_TakeOreBag_05",n"FP_OM_LeaveOreBag_05"), NAME_None);
    default Schedule(18, 0, UAIState_StandAround(), n"FP_OM_REST_03");

    default ScheduleIfRaining(6, 0, UAIState_CarryOreBags(n"FP_OM_TakeOreBag_05",n"FP_OM_LeaveOreBag_05"), NAME_None);
    default ScheduleIfRaining(18, 0, UAIState_SitAround(), n"FP_OM_GUARD_32");
}

UCLASS()
class UDailyRoutine_OM_VLK_Digger37_1052N_Rest : UAIState_DailyRoutine_Human
{
    default Schedule(18, 0, UAIState_Rest(), n"FP_OM_REST_03");
    default ScheduleIfRaining(18, 0, UAIState_RainShelter_Digger(), n"IO_OM_CHAIR_BENCH_03");
}

UCLASS()
class UDailyRoutine_OM_VLK_Digger37_1052N_Collapsed : UAIState_DailyRoutine_Human
{
    default Schedule(6, 0, UAIState_SitAround(), n"IO_OM_CHAIR_BENCH_02");
    
    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}