UCLASS()
class UAIAgentConfig_Human_UL_ORG_Killian_861: UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_UL_ORG_Killian_861::StaticClass();
}

UCLASS()
class UDailyRoutine_UL_ORG_Killian_861_Ownership : UAIState_DailyRoutine_Human
{
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_ILWM_Cave_Loot);
}

UCLASS()
class UDailyRoutine_UL_ORG_Killian_861_Start : UDailyRoutine_UL_ORG_Killian_861_Ownership
{
    default Schedule(0, 0, UAIState_PotionAlchemy(), n"IO_IWM_ALCHEMY_01");
    default Schedule(9, 9, UAIState_Smoke_Ground(), n"IO_IWM_WATERPIPE_01");
    default Schedule(17, 0, UAIState_PotionAlchemy(), n"IO_IWM_ALCHEMY_01");
}


UCLASS()
class UDailyRoutine_UL_ORG_Killian_861_Arbeitslos : UDailyRoutine_UL_ORG_Killian_861_Ownership
{
    default Schedule(8, 0, UAIState_StandAround(), n"FP_BC_STANDAROUND_17");
}

UCLASS()
class UDailyRoutine_UL_ORG_Killian_861_RunArbeitslos : UDailyRoutine_UL_ORG_Killian_861_Ownership
{
    default Schedule(8, 0, UAIState_RunToStandAround(), n"FP_BC_STANDAROUND_17");
}
