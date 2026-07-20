UCLASS()
class UAIAgentConfig_Scavenger_Medium : UAIAgentConfig
{
	default m_CharacterDefinition = UCharacterDefinition_Creature_Scavenger_Medium::StaticClass();
	default m_LocomotionConfig = ULocomotionConfig_Scavenger_Medium::StaticClass();
	//default m_SoundConfig = USoundConfig_Creature::StaticClass();
	default m_AnimConfig = UAnimConfig_Scavenger_Medium::StaticClass();
	default m_SpawnSettings.MaxSignificanceRadius = 10000.f;
	default m_NavigationConfig = UAIAgentConfig_Navigation_Scavenger::StaticClass();

	default m_CharacterEffectComponentsConfig = UDefaultCharacterEffectComponentsConfig::StaticClass();
}

UCLASS()
class AScavenger_Medium : AAIAgentCharacter
{

}