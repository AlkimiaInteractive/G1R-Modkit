UCLASS()
class UAIAgentConfig_Minecrawler_Nymph : UAIAgentConfig
{
	default m_CharacterDefinition = UCharacterDefinition_Creature_Minecrawler_Nymph;
	default m_LocomotionConfig = ULocomotionConfig_Minecrawler_Nymph;
	default m_AnimConfig = UAnimConfig_Minecrawler_Nymph;
	default m_NavigationConfig = UAIAgentConfig_Navigation_Minecrawler_Nymph;
	default m_CharacterEffectComponentsConfig = UDefaultCharacterEffectComponentsConfig;
}

UCLASS()
class AMinecrawler_Nymph : AMinecrawler
{
	default DefaultAIAgentConfig = UAIAgentConfig_Minecrawler_Nymph;
}

UCLASS()
class UAIAgentConfig_Minecrawler_Nymph_Queen : UAIAgentConfig
{
	default m_CharacterDefinition = UCharacterDefinition_Creature_Minecrawler_Nymph_Queen;
	default m_LocomotionConfig = ULocomotionConfig_Minecrawler_Nymph;
	default m_AnimConfig = UAnimConfig_Minecrawler_Nymph;
	default m_NavigationConfig = UAIAgentConfig_Navigation_Minecrawler_Nymph;
	default m_CharacterEffectComponentsConfig = UDefaultCharacterEffectComponentsConfig;
}
