UCLASS()
class UAIAgentConfig_Swampshark : UAIAgentConfig
{
	default m_CharacterDefinition = UCharacterDefinition_Creature_Swampshark::StaticClass();
	default m_LocomotionConfig = ULocomotionConfig_Swampshark::StaticClass();
	default m_AnimConfig = UAnimConfig_Swampshark::StaticClass();
	default m_NavigationConfig = UAIAgentConfig_Navigation_Swampshark::StaticClass();
	default m_CharacterEffectComponentsConfig = UDefaultCharacterEffectComponentsConfig::StaticClass();
	default m_SpawnSettings.MaxSignificanceRadius = 10000.f;
}

UCLASS()
class UAIAgentConfig_Swampshark_Prime : UAIAgentConfig
{
	default m_CharacterDefinition = UCharacterDefinition_Creature_Swampshark_Prime::StaticClass();
	default m_LocomotionConfig = ULocomotionConfig_Swampshark::StaticClass();
	default m_AnimConfig = UAnimConfig_Swampshark::StaticClass();
	default m_NavigationConfig = UAIAgentConfig_Navigation_Swampshark::StaticClass();
	default m_CharacterEffectComponentsConfig = UDefaultCharacterEffectComponentsConfig::StaticClass();
	default m_SpawnSettings.MaxSignificanceRadius = 10000.f;
}

UCLASS()
class ASwampshark : AAIAgentCharacter
{
	default DefaultAIAgentConfig = UAIAgentConfig_Swampshark::StaticClass();
}

UCLASS()
class UAIAgentConfig_Swampshark_Named : UAIAgentConfig_Swampshark
{
	default m_CharacterDefinition = UCharacterDefinition_Creature_Swampshark_Named::StaticClass();
}