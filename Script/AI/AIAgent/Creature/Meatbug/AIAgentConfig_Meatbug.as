UCLASS()
class UAIAgentConfig_Meatbug : UAIAgentConfig
{
	default m_CharacterDefinition = UCharacterDefinition_Creature_Meatbug::StaticClass();
	default m_LocomotionConfig = ULocomotionConfig_Meatbug::StaticClass();
	default m_AnimConfig = UAnimConfig_Meatbug::StaticClass();

	default m_CharacterDefaultInteraction = USmashMeatBugCharacterInteraction::StaticClass();
	
	default m_NavigationConfig = UAIAgentConfig_Navigation_Meatbug::StaticClass();

	default m_CharacterEffectComponentsConfig = UDefaultCharacterEffectComponentsConfig::StaticClass();

	default m_SpawnSettings.MaxSignificanceRadius = 4000.f;	// spawn radius - distance to player
}

UCLASS()
class AMeatbug : AAIAgentCharacter
{

}
