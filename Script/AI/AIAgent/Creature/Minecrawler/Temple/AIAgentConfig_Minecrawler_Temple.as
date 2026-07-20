
UCLASS()
class UAIAgentConfig_Minecrawler_Temple : UAIAgentConfig
{
	default m_CharacterDefinition = UCharacterDefinition_Creature_Minecrawler_Temple::StaticClass();
	default m_LocomotionConfig = ULocomotionConfig_Minecrawler::StaticClass();
	default m_AnimConfig = UAnimConfig_Minecrawler_Warrior::StaticClass();

	default m_SpawnSettings.MaxSignificanceRadius = 10000.f;


	
	default m_NavigationConfig = UAIAgentConfig_Navigation_Minecrawler_Large::StaticClass();



	default m_CharacterEffectComponentsConfig = UDefaultCharacterEffectComponentsConfig::StaticClass();
}

UCLASS()
class UAIAgentConfig_Minecrawler_Temple_Sleeper : UAIAgentConfig
{
	default m_CharacterDefinition = UCharacterDefinition_Creature_Minecrawler_Temple_Sleeper::StaticClass();
	default m_LocomotionConfig = ULocomotionConfig_Minecrawler::StaticClass();
	default m_AnimConfig = UAnimConfig_Minecrawler_Warrior::StaticClass();

	default m_SpawnSettings.MaxSignificanceRadius = 10000.f;


	
	default m_NavigationConfig = UAIAgentConfig_Navigation_Minecrawler_Large::StaticClass();



	default m_CharacterEffectComponentsConfig = UDefaultCharacterEffectComponentsConfig::StaticClass();
}

UCLASS()
class AMinecrawler_Temple : AMinecrawler
{
	
}