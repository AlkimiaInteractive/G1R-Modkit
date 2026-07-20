
UCLASS()
class UAIAgentConfig_Human_Mercenary : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human::StaticClass();
	
	default m_AnimConfig = UAnimConfig_Human::StaticClass();
	

	
	default  m_NavigationConfig = UAIAgentConfig_Navigation_Human::StaticClass();



	//default m_ReactionConfig = UAIAgentConfig_Reaction_Human::StaticClass();
}