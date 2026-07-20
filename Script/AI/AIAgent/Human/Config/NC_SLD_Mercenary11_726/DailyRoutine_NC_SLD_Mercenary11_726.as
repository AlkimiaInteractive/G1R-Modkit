UCLASS()
class UAIAgentConfig_Human_NC_SLD_Mercenary11_726 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_NC_SLD_Mercenary11_726::StaticClass();

}

UCLASS()
class UDailyRoutine_NC_SLD_Mercenary11_726_Ownership : UAIState_DailyRoutine_Human
{
    
}

UCLASS()
class UDailyRoutine_NC_SLD_Mercenary11_726_Start : UAIState_DailyRoutine_Human
{
    default Schedule(8, 30, UAIState_Guard(), n"FP_NC_GUARD_27");
}

UCLASS()
class UDailyRoutine_NC_SLD_Mercenary11_726_Loadsword : UAIState_DailyRoutine_Human
{
    default Schedule(23, 0, UAIState_Guard(), n"NC_PLACE02"); //TO BE DEFINED
}
