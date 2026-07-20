
// This is the base class of all human config to have at least a minimal setup
UCLASS(abstract)
class UAIAgentConfig_Human : UAIAgentConfig
{
	default m_CharacterDefinition = UCharacterDefinition_Human::StaticClass();
	default m_LocomotionConfig = ULocomotionConfig_AIHuman::StaticClass();
	default m_AnimConfig = UAnimConfig_Human::StaticClass();
	

	
	default  m_NavigationConfig = UAIAgentConfig_Navigation_Human::StaticClass();



	//WIP Effect components
	default m_CharacterEffectComponentsConfig = UDefaultCharacterEffectComponentsConfig::StaticClass();
	//WIP Effect components - END

}

UCLASS()
class UAIAgentConfig_Human_Woman : UAIAgentConfig_Human
{
	default m_AnimConfig = UAnimConfig_Human_Woman::StaticClass();
}

UCLASS()
class AAIAgentCharacter_Human : AAIAgentCharacter
{

}

UCLASS()
class AAIAgentCharacter_Human_Woman : AAIAgentCharacter_Human
{

}
