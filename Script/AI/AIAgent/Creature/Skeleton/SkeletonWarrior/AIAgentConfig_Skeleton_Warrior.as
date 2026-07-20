UCLASS()
class UAIAgentConfig_Skeleton_Warrior : UAIAgentConfig
{
	default m_CharacterDefinition = UCharacterDefinition_Creature_Skeleton_Warrior::StaticClass();
	default m_SpawnSettings.MaxSignificanceRadius = 10000.f;
	default m_LocomotionConfig = ULocomotionConfig_Skeleton::StaticClass();
	default m_AnimConfig = UAnimConfig_Skeleton_Warrior::StaticClass();

	default m_NavigationConfig = UAIAgentConfig_Navigation_Skeleton_Warrior::StaticClass();

	default m_CharacterEffectComponentsConfig = UDefaultCharacterEffectComponentsConfig::StaticClass();
}

UCLASS()
class UAIAgentConfig_Skeleton_Warrior_Summon : UAIAgentConfig
{
	default m_CharacterDefinition = UCharacterDefinition_Creature_Skeleton_Warrior_Summon::StaticClass();
	default m_SpawnSettings.MaxSignificanceRadius = 10000.f;
	default m_LocomotionConfig = ULocomotionConfig_Skeleton::StaticClass();
	default m_AnimConfig = UAnimConfig_Skeleton_Warrior::StaticClass();

	default m_NavigationConfig = UAIAgentConfig_Navigation_Skeleton_Warrior::StaticClass();

	default m_CharacterEffectComponentsConfig = UDefaultCharacterEffectComponentsConfig::StaticClass();
}