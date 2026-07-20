UCLASS()
class UAIAgentConfig_Rat : UAIAgentConfig
{
	default m_CharacterDefinition = UCharacterDefinition_Creature_Rat::StaticClass();
	default m_LocomotionConfig = ULocomotionConfig_Creature::StaticClass();
	default m_AnimConfig = UAnimConfig_Creature::StaticClass();
	default m_SpawnSettings.MaxSignificanceRadius = 10000.f;



	
	default m_NavigationConfig = UAIAgentConfig_Navigation_Rat::StaticClass();



	default m_CharacterEffectComponentsConfig = UDefaultCharacterEffectComponentsConfig::StaticClass();
}

UCLASS()
class ARat : AAIAgentCharacter
{

}