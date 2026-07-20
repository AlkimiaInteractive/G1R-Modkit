
UCLASS()
class UAIAgentConfig_Lizard_Fire : UAIAgentConfig
{
	default m_CharacterDefinition = UCharacterDefinition_Creature_Lizard_Fire::StaticClass();
	default m_LocomotionConfig = ULocomotionConfig_Lizard::StaticClass();
	default m_AnimConfig = UAnimConfig_Lizard_Fire::StaticClass();
	default m_SpawnSettings.MaxSignificanceRadius = 10000.f;
	default m_NavigationConfig = UAIAgentConfig_Navigation_Lizard::StaticClass();

	default m_CharacterEffectComponentsConfig = UDefaultCharacterEffectComponentsConfig::StaticClass();
}

UCLASS()
class UAIAgentConfig_Lizard_Fire_Prime : UAIAgentConfig
{
	default m_CharacterDefinition = UCharacterDefinition_Creature_Lizard_Fire_Prime::StaticClass();
	default m_LocomotionConfig = ULocomotionConfig_Lizard::StaticClass();
	default m_AnimConfig = UAnimConfig_Lizard_Fire_Prime::StaticClass();
	default m_SpawnSettings.MaxSignificanceRadius = 10000.f;
	default m_NavigationConfig = UAIAgentConfig_Navigation_Lizard::StaticClass();

	default m_CharacterEffectComponentsConfig = UDefaultCharacterEffectComponentsConfig::StaticClass();
}

UCLASS()
class ALizard_Fire : ALizard
{
}