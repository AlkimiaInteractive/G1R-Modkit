UCLASS()
class UAIAgentConfig_Scavenger_Adult_Rideable : UAIAgentConfig_Scavenger_Adult
{
	default m_CharacterDefinition = UCharacterDefinition_Creature_Scavenger_Adult_Riding::StaticClass();
	default m_LocomotionConfig = ULocomotionConfig_Scavenger_Adult_Rideable::StaticClass();
	default m_AnimConfig = UAnimConfig_Scavenger_Adult_Rideable::StaticClass();

	default m_CharacterEffectComponentsConfig = UDefaultCharacterEffectComponentsConfig::StaticClass();
}