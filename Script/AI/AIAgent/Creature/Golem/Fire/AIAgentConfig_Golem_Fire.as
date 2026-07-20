
UCLASS()
class UAIAgentConfig_Golem_Fire : UAIAgentConfig
{
	default m_CharacterDefinition = UCharacterDefinition_Creature_Golem_Fire::StaticClass();
	default m_LocomotionConfig = ULocomotionConfig_Golem_Fire::StaticClass();
	default m_AnimConfig = UAnimConfig_Golem_Fire::StaticClass();
	default m_SpawnSettings.MaxSignificanceRadius = 10000.f;

	default m_NavigationConfig = UAIAgentConfig_Navigation_Golem_Arena::StaticClass();	

	default m_CharacterEffectComponentsConfig = UDefaultCharacterEffectComponentsConfig::StaticClass();
}

UCLASS()
class AGolemFire : AGolemBase
{
	default DefaultAIAgentConfig = UAIAgentConfig_Golem_Fire::StaticClass();
}