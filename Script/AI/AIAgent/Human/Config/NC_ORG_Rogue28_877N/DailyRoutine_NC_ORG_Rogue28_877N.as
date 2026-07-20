UCLASS()
class UAIAgentConfig_Human_NC_ORG_Rogue28_877N : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_NC_ORG_Rogue28_877N::StaticClass();

}



UCLASS()
class UDailyRoutine_NC_ORG_Rogue28_877N_Start : UAIState_DailyRoutine_Human
{
    default Schedule(23, 0, UAIState_Drink(), n"IO_NC_CHAIR_20",300);
}