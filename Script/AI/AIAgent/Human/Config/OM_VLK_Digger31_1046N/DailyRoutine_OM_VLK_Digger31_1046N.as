UCLASS()
class UAIAgentConfig_Human_OM_VLK_Digger31_1046N : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OM_VLK_Digger31_1046N::StaticClass();

}



UCLASS()
class UDailyRoutine_OM_VLK_Digger31_1046N_Start : UAIState_DailyRoutine_Human
{
    default Schedule(18, 0, UAIState_CarryOreBags(n"FP_OM_TakeOreBag_02", n"FP_OM_LeaveOreBag_02"), NAME_None);
}