
UCLASS()
class UAIAgentConfig_Bloodfly : UAIAgentConfig
{
	default m_CharacterDefinition = UCharacterDefinition_Creature_Bloodfly::StaticClass();
	default m_LocomotionConfig = ULocomotionConfig_Bloodfly::StaticClass();
	default m_AnimConfig = UAnimConfig_Bloodfly::StaticClass();
	default m_SpawnSettings.MaxSignificanceRadius = 10000.f;
    

	
	default m_NavigationConfig = UAIAgentConfig_Navigation_Bloodfly::StaticClass();
	
	default m_CharacterEffectComponentsConfig = UDefaultCharacterEffectComponentsConfig::StaticClass();
}

UCLASS()
class ABloodfly : AAIAgentCharacter
{

}