
UCLASS()
class UAIAgentConfig_Razor : UAIAgentConfig
{
	default m_CharacterDefinition = UCharacterDefinition_Creature_Razor::StaticClass();
	default m_LocomotionConfig = ULocomotionConfig_Razor::StaticClass();
	default m_AnimConfig = UAnimConfig_Razor::StaticClass();

	default m_NavigationConfig = UAIAgentConfig_Navigation_Razor::StaticClass();
	default m_SpawnSettings.MaxSignificanceRadius = 10000.f;
	default m_CharacterEffectComponentsConfig = UDefaultCharacterEffectComponentsConfig::StaticClass();

}

UCLASS()
class ARazor : AAIAgentCharacter
{

}