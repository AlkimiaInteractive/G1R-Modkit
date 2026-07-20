UCLASS()
class UAIAgentConfig_Human_OM_TPL_GorNaBar_1400 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OM_TPL_GorNaBar_1400::StaticClass();

}



UCLASS()
class UDailyRoutine_OM_TPL_GorNaBar_1400_Start : UAIState_DailyRoutine_Human
{
    default Schedule(0, 0, UAIState_Smalltalk(), n"FP_OM_SMALLTALK_03");
}


UCLASS()
class UDailyRoutine_OM_TPL_GorNaBar_1400_Tunnel : UAIState_DailyRoutine_Human
{
    default Schedule(0, 0, UAIState_Guard(), n"FP_OM_GUARD_23");
}