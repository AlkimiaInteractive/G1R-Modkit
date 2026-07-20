UCLASS()
class UAIAgentConfig_Human_OM_SC_TPL_Templar03_1436 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OM_SC_TPL_Templar03_1436::StaticClass();

}



UCLASS()
class UDailyRoutine_OM_SC_TPL_Templar03_1436_Start : UAIState_DailyRoutine_Human
{
    default Schedule(12, 0, UAIState_Smalltalk(), n"FP_OM_SMALLTALK_04");
    default Schedule(20, 0, UAIState_Smalltalk(), n"FP_OM_SMALLTALK_04");


}