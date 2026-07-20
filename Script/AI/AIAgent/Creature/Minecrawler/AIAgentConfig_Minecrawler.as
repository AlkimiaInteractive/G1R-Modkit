
UCLASS()
class UAIAgentConfig_Minecrawler : UAIAgentConfig
{
	default m_CharacterDefinition = UCharacterDefinition_Creature_Minecrawler::StaticClass();
	default m_LocomotionConfig = ULocomotionConfig_Minecrawler::StaticClass();
	default m_AnimConfig = UAnimConfig_Minecrawler::StaticClass();
	default m_SpawnSettings.MaxSignificanceRadius = 10000.f;

	default m_NavigationConfig = UAIAgentConfig_Navigation_Minecrawler_Mid::StaticClass();

	default m_CharacterEffectComponentsConfig = UDefaultCharacterEffectComponentsConfig::StaticClass();

}

UCLASS()
class UAIAgentConfig_Minecrawler_Named : UAIAgentConfig_Minecrawler
{
	default m_CharacterDefinition = UCharacterDefinition_Creature_Minecrawler_Named::StaticClass();
}

UCLASS()
class AMinecrawler : AAIAgentCharacter
{
	default DefaultAIAgentConfig = UAIAgentConfig_Minecrawler::StaticClass();
}