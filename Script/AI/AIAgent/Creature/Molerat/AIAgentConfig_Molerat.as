
UCLASS()
class UAIAgentConfig_Molerat : UAIAgentConfig
{
	default m_CharacterDefinition = UCharacterDefinition_Creature_Molerat::StaticClass();
	default m_LocomotionConfig = ULocomotionConfig_Molerat::StaticClass();
	default m_AnimConfig = UAnimConfig_Molerat::StaticClass();

	default m_NavigationConfig = UAIAgentConfig_Navigation_Molerat::StaticClass();
	default m_SpawnSettings.MaxSignificanceRadius = 10000.f;
	default m_CharacterEffectComponentsConfig = UDefaultCharacterEffectComponentsConfig::StaticClass();

}

UCLASS()
class AMolerat : AAIAgentCharacter
{
	default DefaultAIAgentConfig = UAIAgentConfig_Molerat::StaticClass();
}