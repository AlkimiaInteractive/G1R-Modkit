UCLASS()
class UAIAgentConfig_Troll_Adult_Shrinked : UAIAgentConfig
{
	default m_CharacterDefinition = UCharacterDefinition_Creature_Troll_Adult_Shrinked::StaticClass();
	default m_LocomotionConfig = ULocomotionConfig_Troll_Adult_Shrinked::StaticClass();
	default m_AnimConfig = UAnimConfig_Troll::StaticClass();
	default m_SpawnSettings.MaxSignificanceRadius = 10000.f;
	default m_NavigationConfig = UAIAgentConfig_Navigation_Troll::StaticClass();
	
	default m_CharacterEffectComponentsConfig = UDefaultCharacterEffectComponentsConfig::StaticClass();
}