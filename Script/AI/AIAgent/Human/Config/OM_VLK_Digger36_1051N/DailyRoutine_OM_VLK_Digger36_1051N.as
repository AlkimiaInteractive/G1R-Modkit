UCLASS()
class UAIAgentConfig_Human_OM_VLK_Digger36_1051N : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OM_VLK_Digger36_1051N::StaticClass();

}



UCLASS()
class UDailyRoutine_OM_VLK_Digger36_1051N_Start : UAIState_DailyRoutine_Human
{
    //default AssociatedCrimeAreas.AddTag(GameplayTag::CrimeLocation_OldMine);
    //default AssociatedCrimeAreas.AddTag(GameplayTag::CrimeLocation_OldCamp);
    
    // default Schedule(6, 0, UAIState_Rest(), n"FP_OM_REST_01");
    // default Schedule(18, 0, UAIState_CarryOreBags(n"FP_OM_TakeOreBag_05",n"FP_OM_LeaveOreBag_6"), NAME_None);

    default Schedule(6, 0, UAIState_CarryOreBags(n"FP_OM_TakeOreBag_05",n"FP_OM_LeaveOreBag_05"), NAME_None);
    default Schedule(18, 0, UAIState_StandAround(), n"FP_OM_REST_03");

    default ScheduleIfRaining(6, 0, UAIState_CarryOreBags(n"FP_OM_TakeOreBag_05",n"FP_OM_LeaveOreBag_05"), NAME_None);
    default ScheduleIfRaining(18, 0, UAIState_SitAround(), n"FP_OM_RAINSHELTER_01");
}

UCLASS()
class UDailyRoutine_OM_VLK_Digger36_1051N_Rest : UAIState_DailyRoutine_Human
{
    default Schedule(18, 0, UAIState_Rest(), n"FP_OM_REST_01");
    default ScheduleIfRaining(18, 0, UAIState_RainShelter_Digger(), n"FP_OM_RAINSHELTER_01");
}


UCLASS()
class UDailyRoutine_OM_VLK_Digger36_1051N_Collapsed : UAIState_DailyRoutine_Human
{
    default Schedule(10, 0, UAIState_Wounded(), n"FP_OM_FL_WOUNDED_09");
    default Schedule(15, 0, UAIState_SitAround(), n"FP_OM_FL_WOUNDED_09");
    default Schedule(20, 0, UAIState_Wounded(), n"FP_OM_FL_WOUNDED_09");
    default Schedule(1, 0, UAIState_SitAround(), n"FP_OM_FL_WOUNDED_09");
    default Schedule(6, 0, UAIState_Wounded(), n"FP_OM_FL_WOUNDED_09");

    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}