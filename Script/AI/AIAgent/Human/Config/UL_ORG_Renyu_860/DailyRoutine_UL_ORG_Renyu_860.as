UCLASS()
class UAIAgentConfig_Human_UL_ORG_Renyu_860: UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_UL_ORG_Renyu_860::StaticClass();

}

UCLASS()
class UDailyRoutine_UL_ORG_Renyu_860_Start : UAIState_DailyRoutine_Human
{
    default Schedule(0, 0, UAIState_Smoke(), n"FP_IWM_SMOKE_01");
}


UCLASS()
class UDailyRoutine_UL_ORG_Renyu_860_Arbeitslos : UAIState_DailyRoutine_Human
{
    default Schedule(8, 0, UAIState_StandAround(), n"FP_BC_STANDAROUND_18");
}

UCLASS()
class UDailyRoutine_UL_ORG_Renyu_860_RunArbeitslos : UAIState_DailyRoutine_Human
{
    default Schedule(8, 0, UAIState_RunToStandAround(), n"FP_BC_STANDAROUND_18");
}
