
UCLASS()
class UAIAgentConfig_OrcDog : UAIAgentConfig
{
	default m_CharacterDefinition = UCharacterDefinition_Creature_OrcDog::StaticClass();
	default m_LocomotionConfig = ULocomotionConfig_OrcDog::StaticClass();
	default m_AnimConfig = UAnimConfig_OrcDog::StaticClass();
	default m_SpawnSettings.MaxSignificanceRadius = 10000.f;
	default m_NavigationConfig = UAIAgentConfig_Navigation_OrcDog::StaticClass();

	default m_CharacterEffectComponentsConfig = UDefaultCharacterEffectComponentsConfig::StaticClass();
}

UCLASS()
class AOrcDog : AAIAgentCharacter
{

}