
UCLASS()
class UAIAgentConfig_Demon_Lord : UAIAgentConfig
{
	default m_CharacterDefinition = UCharacterDefinition_Creature_Demon_Lord::StaticClass();
	default m_LocomotionConfig = ULocomotionConfig_Demon::StaticClass();
	default m_AnimConfig = UAnimConfig_Demon_Lord::StaticClass();
	

	
	default m_NavigationConfig = UAIAgentConfig_Navigation_Demon::StaticClass();

	default m_CharacterEffectComponentsConfig = UDefaultCharacterEffectComponentsConfig::StaticClass();
}

UCLASS()
class ADemonLord : AAIAgentCharacterDemonBase
{
	default DefaultAIAgentConfig = UAIAgentConfig_CorKalomDemon::StaticClass();
}
