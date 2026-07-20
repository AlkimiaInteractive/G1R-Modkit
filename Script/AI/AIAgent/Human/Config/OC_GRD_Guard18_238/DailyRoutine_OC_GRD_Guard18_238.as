UCLASS()
class UAIAgentConfig_Human_OC_GRD_Guard18_238 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OC_GRD_Guard18_238::StaticClass();

}



UCLASS()
class UDailyRoutine_OC_GRD_Guard18_238_Start : UAIState_DailyRoutine_Human
{
    default Schedule(0, 0, UAIState_Eat(), n"FP_SMALLTALK_A_START_PATH_GUARD1",300);
    default Schedule(6, 0, UAIState_Sleep(), n"FP_SMALLTALK_A_START_PATH_GUARD1",300);
    default Schedule(13, 30, UAIState_Guard(), n"FP_SMALLTALK_A_START_PATH_GUARD1",300);
    default Schedule(23, 30, UAIState_Eat(), n"FP_SMALLTALK_A_START_PATH_GUARD1",300);
}