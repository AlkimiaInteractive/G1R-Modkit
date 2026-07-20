
UCLASS()
class UAIAgentConfig_Minecrawler_Warrior : UAIAgentConfig
{
	default m_CharacterDefinition =UCharacterDefinition_Creature_Minecrawler_Warrior::StaticClass();
	default m_LocomotionConfig = ULocomotionConfig_Minecrawler::StaticClass();
	default m_AnimConfig = UAnimConfig_Minecrawler_Warrior::StaticClass();

	default m_SpawnSettings.MaxSignificanceRadius = 10000.f;


	
	default m_NavigationConfig = UAIAgentConfig_Navigation_Minecrawler_Large::StaticClass();

	default m_CharacterEffectComponentsConfig = UDefaultCharacterEffectComponentsConfig::StaticClass();

}

UCLASS()
class UAIAgentConfig_Minecrawler_Warrior_King : UAIAgentConfig
{
	default m_CharacterDefinition =UCharacterDefinition_Creature_Minecrawler_Warrior_King::StaticClass();
	default m_LocomotionConfig = ULocomotionConfig_Minecrawler::StaticClass();
	default m_AnimConfig = UAnimConfig_Minecrawler_Warrior_King::StaticClass();

	default m_SpawnSettings.MaxSignificanceRadius = 10000.f;


	
	default m_NavigationConfig = UAIAgentConfig_Navigation_Minecrawler_Large::StaticClass();

	default m_CharacterEffectComponentsConfig = UDefaultCharacterEffectComponentsConfig::StaticClass();

}

UCLASS()
class AMinecrawler_Warrior : AMinecrawler
{
	
}