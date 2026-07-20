
UCLASS()
class UAIAgentConfig_Golem_Stone : UAIAgentConfig
{
	default m_CharacterDefinition = UCharacterDefinition_Creature_Golem_Stone;
	default m_LocomotionConfig = ULocomotionConfig_Golem_Stone;
    default m_AnimConfig = UAnimConfig_Golem_Stone;

	default m_NavigationConfig = UAIAgentConfig_Navigation_Golem_Arena;

	default m_CharacterEffectComponentsConfig = UDefaultCharacterEffectComponentsConfig;
	default m_SpawnSettings.MaxSignificanceRadius = 10000.f;
}

UCLASS()
class UAIAgentConfig_Golem_Stone_Bridge : UAIAgentConfig
{
	default m_CharacterDefinition = UCharacterDefinition_Creature_Golem_Stone_Bridge;
	default m_LocomotionConfig = ULocomotionConfig_Golem_Stone_Bridge;
    default m_AnimConfig = UAnimConfig_Golem_Stone_Bridge;

	default m_NavigationConfig = UAIAgentConfig_Navigation_Golem;
	default m_SpawnSettings.MaxSignificanceRadius = 10000.f;
	default m_CharacterEffectComponentsConfig = UDefaultCharacterEffectComponentsConfig;
}

UCLASS()
class UAIAgentConfig_Golem_Stone_Summoned : UAIAgentConfig
{
	default m_CharacterDefinition = UCharacterDefinition_Creature_Golem_Stone_Summoned;
	default m_LocomotionConfig = ULocomotionConfig_Golem_Stone_Bridge;
    default m_AnimConfig = UAnimConfig_Golem_Stone_Bridge;

	default m_NavigationConfig = UAIAgentConfig_Navigation_Golem;
	default m_SpawnSettings.MaxSignificanceRadius = 10000.f;
	default m_CharacterEffectComponentsConfig = UDefaultCharacterEffectComponentsConfig;

}

UCLASS()
class AGolemStone : AGolemBase
{
	default DefaultAIAgentConfig = UAIAgentConfig_Golem_Stone;

	UPROPERTY(DefaultComponent)
	UStoneGolemTeleportComponent m_TeleportComponent;
}