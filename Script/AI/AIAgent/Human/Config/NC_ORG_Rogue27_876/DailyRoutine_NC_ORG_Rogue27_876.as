UCLASS()
class UAIAgentConfig_Human_NC_ORG_Rogue27_876 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_NC_ORG_Rogue27_876::StaticClass();

}



UCLASS()
class UDailyRoutine_NC_ORG_Rogue27_876_Start : UAIState_DailyRoutine_Human
{
    default Schedule(23, 0, UAIState_Guard(), n"FP_NC_GUARD_35",100);
}