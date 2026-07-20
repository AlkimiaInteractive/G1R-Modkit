UCLASS()
class UAIAgentConfig_Human_OC_GRD_Guard17_237 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OC_GRD_Guard17_237::StaticClass();

}



UCLASS()
class UDailyRoutine_OC_GRD_Guard17_237_Start : UAIState_DailyRoutine_Human
{
    default Schedule(0, 0, UAIState_Sleep(), n"FP_SMALLTALK_A_START_PATH_GUARD3",300);
    default Schedule(6, 0, UAIState_Eat(), n"FP_SMALLTALK_A_START_PATH_GUARD3",300);
    default Schedule(6, 30, UAIState_Guard(), n"FP_SMALLTALK_A_START_PATH_GUARD3",300);
    default Schedule(23, 30, UAIState_Eat(), n"FP_SMALLTALK_A_START_PATH_GUARD3",300);
}