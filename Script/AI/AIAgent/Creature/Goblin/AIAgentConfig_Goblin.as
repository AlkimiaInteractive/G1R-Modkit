
UCLASS()
class UAIAgentConfig_Goblin : UAIAgentConfig
{
	default m_CharacterDefinition = UCharacterDefinition_Creature_Goblin::StaticClass();
	default m_LocomotionConfig = ULocomotionConfig_Goblin::StaticClass();
	default m_AnimConfig = UAnimConfig_Goblin::StaticClass();
	default m_SpawnSettings.MaxSignificanceRadius = 10000.f;
	default m_NavigationConfig = UAIAgentConfig_Navigation_Goblin::StaticClass();

	default m_CharacterEffectComponentsConfig = UDefaultCharacterEffectComponentsConfig::StaticClass();
}

UCLASS()
class AGoblin : AAIAgentCharacter
{

}