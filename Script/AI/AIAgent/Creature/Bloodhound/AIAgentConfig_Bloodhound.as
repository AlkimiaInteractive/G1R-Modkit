UCLASS()
class UAIAgentConfig_Bloodhound : UAIAgentConfig
{
	default m_CharacterDefinition = UCharacterDefinition_Creature_Bloodhound::StaticClass();
	default m_LocomotionConfig = ULocomotionConfig_Bloodhound::StaticClass();
	default m_AnimConfig = UAnimConfig_Bloodhound::StaticClass();
	

	default m_NavigationConfig = UAIAgentConfig_Navigation_Bloodhound::StaticClass();

	default m_CharacterEffectComponentsConfig = UDefaultCharacterEffectComponentsConfig::StaticClass();
	default m_SpawnSettings.MaxSignificanceRadius = 10000.f;
}

UCLASS()
class ABloodhound : AAIAgentCharacter
{

}