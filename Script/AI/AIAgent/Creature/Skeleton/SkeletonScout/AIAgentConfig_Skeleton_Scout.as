UCLASS()
class UAIAgentConfig_Skeleton_Scout : UAIAgentConfig
{
	default m_CharacterDefinition = UCharacterDefinition_Creature_Skeleton_Scout::StaticClass();
	default m_SpawnSettings.MaxSignificanceRadius = 10000.f;
	default m_LocomotionConfig = ULocomotionConfig_Skeleton::StaticClass();
	default m_AnimConfig = UAnimConfig_Skeleton::StaticClass();

	default m_NavigationConfig = UAIAgentConfig_Navigation_Skeleton_Scout::StaticClass();

	default m_CharacterEffectComponentsConfig = UDefaultCharacterEffectComponentsConfig::StaticClass();
}