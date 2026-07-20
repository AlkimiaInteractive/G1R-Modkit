
UCLASS()
class UAIAgentConfig_Lurker : UAIAgentConfig
{
	default m_CharacterDefinition =UCharacterDefinition_Creature_Lurker::StaticClass();
	default m_LocomotionConfig = ULocomotionConfig_Lurker::StaticClass();
	default m_AnimConfig = UAnimConfig_Lurker::StaticClass();
	default m_NavigationConfig = UAIAgentConfig_Navigation_Lurker::StaticClass();
	default m_CharacterEffectComponentsConfig = UDefaultCharacterEffectComponentsConfig::StaticClass();
	default m_SpawnSettings.MaxSignificanceRadius = 10000.f;
}

UCLASS()
class ALurker : AAIAgentCharacter
{

}