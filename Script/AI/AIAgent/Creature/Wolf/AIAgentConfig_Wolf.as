UCLASS()
class UAIAgentConfig_Wolf : UAIAgentConfig
{
    default m_CharacterDefinition = UCharacterDefinition_Creature_Wolf::StaticClass();
	
	default m_LocomotionConfig = ULocomotionConfig_Wolf::StaticClass();
	default m_AnimConfig = UAnimConfig_Wolf::StaticClass();
    	default m_SpawnSettings.MaxSignificanceRadius = 10000.f;

	
    default m_NavigationConfig = UAIAgentConfig_Navigation_Wolf::StaticClass();




    default m_CharacterEffectComponentsConfig = UDefaultCharacterEffectComponentsConfig::StaticClass();
}

UCLASS()
class UAIAgentConfig_Wolf_Alpha : UAIAgentConfig
{
    default m_CharacterDefinition = UCharacterDefinition_Creature_Wolf_Alpha::StaticClass();
	
	default m_LocomotionConfig = ULocomotionConfig_Wolf_Alpha::StaticClass();
	default m_AnimConfig = UAnimConfig_Wolf_Alpha::StaticClass();
    	default m_SpawnSettings.MaxSignificanceRadius = 10000.f;

	
    default m_NavigationConfig = UAIAgentConfig_Navigation_Wolf::StaticClass();




    default m_CharacterEffectComponentsConfig = UDefaultCharacterEffectComponentsConfig::StaticClass();
}

UCLASS()
class AWolf : AAIAgentCharacter
{
    default DefaultAIAgentConfig = UAIAgentConfig_Wolf::StaticClass();
}

