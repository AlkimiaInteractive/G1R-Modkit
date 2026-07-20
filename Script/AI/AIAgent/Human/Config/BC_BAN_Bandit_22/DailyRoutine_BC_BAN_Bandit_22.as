UCLASS()
class UAIAgentConfig_Human_BC_BAN_Bandit_22 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_BC_BAN_Bandit_22::StaticClass();

}



UCLASS()
class UDailyRoutine_BC_BAN_Bandit_22_Start : UAIState_DailyRoutine_Human
{
    default Schedule(10, 0, UAIState_SitAround(), n"IO_BC_CHAIR_CAVE");
}