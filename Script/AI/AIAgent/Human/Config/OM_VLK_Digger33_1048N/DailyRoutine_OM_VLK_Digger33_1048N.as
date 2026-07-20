UCLASS()
class UAIAgentConfig_Human_OM_VLK_Digger33_1048N : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OM_VLK_Digger33_1048N::StaticClass();

}



UCLASS()
class UDailyRoutine_OM_VLK_Digger33_1048N_Start : UAIState_DailyRoutine_Human
{
    default Schedule(18, 0, UAIState_CarryOreBags(n"FP_OM_TakeOreBag_04", n"FP_OM_LeaveOreBag_04"), NAME_None);
}

UCLASS()
class UDailyRoutine_OM_VLK_Digger33_1048N_Collapsed : UAIState_DailyRoutine_Human
{
    default Schedule(10, 0, UAIState_Sit(), n"FP_OM_FL_REST_02");
    default Schedule(14, 0, UAIState_Drink(), n"FP_OM_FL_REST_02");
    default Schedule(18, 0, UAIState_Sit(), n"FP_OM_FL_REST_02");

    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}