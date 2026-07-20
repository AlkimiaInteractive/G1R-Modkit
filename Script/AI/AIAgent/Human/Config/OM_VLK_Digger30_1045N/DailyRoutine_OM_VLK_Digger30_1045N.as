UCLASS()
class UAIAgentConfig_Human_OM_VLK_Digger30_1045N : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OM_VLK_Digger30_1045N::StaticClass();

}



UCLASS()
class UDailyRoutine_OM_VLK_Digger30_1045N_Start : UAIState_DailyRoutine_Human
{
    default Schedule(18, 0, UAIState_CarryOreBags(n"FP_OM_TakeOreBag_01", n"FP_OM_LeaveOreBag_01"), NAME_None);
}