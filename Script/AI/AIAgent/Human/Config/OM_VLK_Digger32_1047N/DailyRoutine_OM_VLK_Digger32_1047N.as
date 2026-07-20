UCLASS()
class UAIAgentConfig_Human_OM_VLK_Digger32_1047N : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OM_VLK_Digger32_1047N::StaticClass();

}



UCLASS()
class UDailyRoutine_OM_VLK_Digger32_1047N_Start : UAIState_DailyRoutine_Human
{
    default Schedule(18, 0, UAIState_CarryOreBags(n"FP_OM_TakeOreBag_03", n"FP_OM_LeaveOreBag_03"), NAME_None);
}

UCLASS()
class UDailyRoutine_OM_VLK_Digger32_1047N_Collapsed : UAIState_DailyRoutine_Human
{
    default Schedule(8, 40, UAIState_Wounded(), n"FP_OM_FL_WOUNDED_06");
    default Schedule(12, 20, UAIState_SitAround(), n"FP_OM_FL_WOUNDED_06");
    default Schedule(18, 40, UAIState_Wounded(), n"FP_OM_FL_WOUNDED_06");
    default Schedule(2, 20, UAIState_SitAround(), n"FP_OM_FL_WOUNDED_06");

    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}