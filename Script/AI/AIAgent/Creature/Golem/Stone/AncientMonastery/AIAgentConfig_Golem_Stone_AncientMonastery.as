
UCLASS()
class UAIAgentConfig_Golem_Stone_AncientMonastery : UAIAgentConfig
{
	default m_CharacterDefinition =UCharacterDefinition_Creature_Golem_Stone_AncientMonastery;
	default m_LocomotionConfig = ULocomotionConfig_Golem_Stone_Bridge;
    default m_AnimConfig = UAnimConfig_Golem_Stone_Bridge;

	default m_NavigationConfig = UAIAgentConfig_Navigation_Golem;
	default m_SpawnSettings.MaxSignificanceRadius = 10000.f;
	default m_CharacterEffectComponentsConfig = UDefaultCharacterEffectComponentsConfig;
}
