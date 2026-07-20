UCLASS()
class UAIAgentConfig_Zombie : UAIAgentConfig
{
	default m_CharacterDefinition = UCharacterDefinition_Creature_Zombie::StaticClass();
	default m_LocomotionConfig = ULocomotionConfig_Zombie::StaticClass();
	default m_AnimConfig = UAnimConfig_Zombie::StaticClass();
	default m_SpawnSettings.MaxSignificanceRadius = 10000.f;
	
	default m_NavigationConfig = UAIAgentConfig_Navigation_Zombie::StaticClass();



	default m_CharacterEffectComponentsConfig = UDefaultCharacterEffectComponentsConfig::StaticClass();

}

UCLASS()
class AZombie : AAIAgentCharacter
{

}