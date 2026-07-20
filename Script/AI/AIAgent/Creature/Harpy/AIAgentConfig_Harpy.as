
UCLASS()
class UAIAgentConfig_Harpy : UAIAgentConfig
{
	default m_CharacterDefinition = UCharacterDefinition_Creature_Harpy::StaticClass();
	default m_LocomotionConfig = ULocomotionConfig_Harpy::StaticClass();
	default m_AnimConfig = UAnimConfig_Harpy::StaticClass();
	default m_SpawnSettings.MaxSignificanceRadius = 10000.f;

    default m_NavigationConfig = UAIAgentConfig_Navigation_Harpy::StaticClass();


	default m_CharacterEffectComponentsConfig = UDefaultCharacterEffectComponentsConfig::StaticClass();
}

UCLASS()
class UAIAgentConfig_Harpy_Sleeper : UAIAgentConfig
{
	default m_CharacterDefinition = UCharacterDefinition_Creature_Harpy_Sleeper::StaticClass();
	default m_LocomotionConfig = ULocomotionConfig_Harpy::StaticClass();
	default m_AnimConfig = UAnimConfig_Harpy::StaticClass();
	default m_SpawnSettings.MaxSignificanceRadius = 10000.f;

    default m_NavigationConfig = UAIAgentConfig_Navigation_Harpy::StaticClass();

	default m_CharacterEffectComponentsConfig = UDefaultCharacterEffectComponentsConfig::StaticClass();
}

UCLASS()
class AHarpy : AAIAgentCharacter
{
	default DefaultAIAgentConfig = UAIAgentConfig_Harpy::StaticClass();
}