UCLASS()
class UAIAgentConfig_Human_OC_IE_Steve : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OC_IE_Steve::StaticClass();
	default m_AnimConfig = UAnimConfig_Human::StaticClass();
	
	default  m_NavigationConfig = UAIAgentConfig_Navigation_Human::StaticClass();

	//default m_ReactionConfig = UAIAgentConfig_Reaction_Human::StaticClass();
}

UCLASS()
class UDailyRoutine_OC_IE_Steve_Start : UAIState_DailyRoutine_Human
{
    default Schedule(13, 0, UAIState_Sit(),n"FP_STEVE_CELL");
    default Schedule(20, 0, UAIState_Clap(),n"FP_INEXTREMO_CLAP");
    default Schedule(0, 0, UAIState_Sit(),n"FP_STEVE_CELL");
}