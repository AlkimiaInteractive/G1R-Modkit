UCLASS()
class UAIAgentConfig_Human_NC_BAU_Rayk_941 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_NC_BAU_Rayk_941::StaticClass();

}

UCLASS()
class UDailyRoutine_NC_BAU_Rayk_941_Start : UAIState_DailyRoutine_Human
{
    default RolesWhileAssigned.AddTag(GameplayTag::State_Drugs_Forced_Alcohol_High);
    
    default Schedule(13, 0, UAIState_Disturb(), n"FP_NC_STANDAROUND_01",100);
}


UCLASS()
class UDailyRoutine_NC_BAU_Rayk_941_Outside : UAIState_DailyRoutine_Human
{
    default RolesWhileAssigned.AddTag(GameplayTag::State_Drugs_Forced_Alcohol_High);

    default Schedule(13, 0, UAIState_StandAround(), n"FP_NC_STANDAROUND_RAYK",200);
}

UCLASS()
class UDailyRoutine_NC_BAU_Rayk_941_Sleep : UAIState_DailyRoutine_Human
{
    default Schedule(13, 0, UAIState_Sleep(), n"IO_NC_CHAIR_15");
}