
UCLASS()
class UAIAgentConfig_Demon_Lesser : UAIAgentConfig
{
	default m_CharacterDefinition = UCharacterDefinition_Creature_Demon_Lesser::StaticClass();
	default m_LocomotionConfig = ULocomotionConfig_Demon_Lesser::StaticClass();
	default m_AnimConfig = UAnimConfig_Demon_Lesser::StaticClass();	
	default m_NavigationConfig = UAIAgentConfig_Navigation_Demon::StaticClass();


	default m_CharacterEffectComponentsConfig = UDefaultCharacterEffectComponentsConfig::StaticClass();
}

UCLASS()
class ADemonLesser : AAIAgentCharacter
{
	default DefaultAIAgentConfig = UAIAgentConfig_Demon_Lesser::StaticClass();
}


UCLASS()
class UAIAgentConfig_Demon_Lesser_VKasorg : UAIAgentConfig
{
	default m_CharacterDefinition = UCharacterDefinition_Creature_Demon_Lesser_VKasorg::StaticClass();
	default m_LocomotionConfig = ULocomotionConfig_Demon_Lesser::StaticClass();
	default m_AnimConfig = UAnimConfig_Demon_Lesser::StaticClass();	
	default m_NavigationConfig = UAIAgentConfig_Navigation_Demon::StaticClass();


	default m_CharacterEffectComponentsConfig = UDefaultCharacterEffectComponentsConfig::StaticClass();
}