UCLASS()
class UAIAgentConfig_Human_NC_ORG_Rogue29_878N : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_NC_ORG_Rogue29_878N::StaticClass();

}



UCLASS()
class UDailyRoutine_NC_ORG_Rogue29_878N_Start : UAIState_DailyRoutine_Human
{
    default Schedule(23, 0, UAIState_Drink(), n"FP_NC_STANDAROUND_04",300);
    default Schedule(5, 45, UAIState_Sleep_Table(), n"IO_NC_CHAIR_16");
}