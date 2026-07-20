UCLASS()
class UAIAgentConfig_Human_UL_ORG_Jacko_862: UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_UL_ORG_Jacko_862::StaticClass();
}

UCLASS()
class UDailyRoutine_UL_ORG_Jacko_862_Ownership : UAIState_DailyRoutine_Human
{
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_ILWM_Cave_Loot);
}

UCLASS()
class UDailyRoutine_UL_ORG_Jacko_862_Start : UDailyRoutine_UL_ORG_Jacko_862_Ownership
{
    default Schedule(8, 0, UAIState_Guard(), n"FP_IWM_GUARD_01");
}


UCLASS()
class UDailyRoutine_UL_ORG_Jacko_862_Arbeitslos : UDailyRoutine_UL_ORG_Jacko_862_Ownership
{
    default Schedule(8, 0, UAIState_StandAround(), n"FP_BC_STANDAROUND_16");
}

UCLASS()
class UDailyRoutine_UL_ORG_Jacko_862_RunArbeitslos : UDailyRoutine_UL_ORG_Jacko_862_Ownership
{
    default Schedule(8, 0, UAIState_RunToStandAround(), n"FP_BC_STANDAROUND_16");
}
