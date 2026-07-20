UCLASS()
class UAIAgentConfig_TheSleeper : UAIAgentConfig
{
	default m_CharacterDefinition = UCharacterDefinition_Creature_TheSleeper::StaticClass();
	default m_LocomotionConfig = ULocomotionConfig_Creature::StaticClass();
	default m_AnimConfig = UAnimConfig_TheSleeper::StaticClass();
	default m_NavigationConfig = UAIAgentConfig_Navigation_TheSleeper::StaticClass();
	default m_CharacterEffectComponentsConfig = UDefaultCharacterEffectComponentsConfig::StaticClass();

	default m_SpawnSettings.MaxSignificanceRadius = 20000.f;
}

UCLASS()
class ATheSleeper : AAIAgentCharacter
{

}