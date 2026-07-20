UCLASS()
class UAIAgentConfig_Human_NC_ORG_Rogue26_875 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_NC_ORG_Rogue26_875::StaticClass();

}



UCLASS()
class UDailyRoutine_NC_ORG_Rogue26_875_Start : UAIState_DailyRoutine_Human
{
    default Schedule(23, 0, UAIState_Guard(), n"FP_NC_GUARD_34",100);
}