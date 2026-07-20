UCLASS()
class UAIAgentConfig_Human_NC_SLD_Jarvis_728 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_NC_SLD_Jarvis_728::StaticClass();

}



UCLASS()
class UDailyRoutine_NC_SLD_Jarvis_728_Start : UAIState_DailyRoutine_Human
{
    default RolesWhileAssigned.AddTag(GameplayTag::Role_GateWatchman);
    
    default Schedule(0, 0, UAIState_Guard(), n"FP_NC_GUARD_03");
    default Schedule(7, 0, UAIState_Eat(), n"FP_NC_GUARD_03");
    default Schedule(8, 30, UAIState_Guard(), n"FP_NC_GUARD_03");
    default Schedule(23, 0, UAIState_Eat(), n"FP_NC_GUARD_03");
}
