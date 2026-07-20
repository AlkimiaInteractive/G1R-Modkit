UCLASS()
class UAIAgentConfig_Human_NC_SLD_Mercenary10_725 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_NC_SLD_Mercenary10_725::StaticClass();

}

UCLASS()
class UDailyRoutine_NC_SLD_Mercenary10_725_Ownership : UAIState_DailyRoutine_Human
{
    
}

UCLASS()
class UDailyRoutine_NC_SLD_Mercenary10_725_Start : UDailyRoutine_NC_SLD_Mercenary10_725_Ownership
{
    default Schedule(8, 30, UAIState_Guard(), n"FP_NC_GUARD_14");
}

UCLASS()
class UDailyRoutine_NC_SLD_Mercenary10_725_Rest : UDailyRoutine_NC_SLD_Mercenary10_725_Ownership
{
    default Schedule(8, 30, UAIState_Drink(), n"IO_NC_CHAIR_BENCH_17");
}