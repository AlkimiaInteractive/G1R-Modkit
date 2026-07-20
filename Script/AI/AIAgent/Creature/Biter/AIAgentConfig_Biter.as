UCLASS()
class UAIAgentConfig_Biter : UAIAgentConfig
{
	default m_CharacterDefinition = UCharacterDefinition_Creature_Biter::StaticClass();
	default m_LocomotionConfig = ULocomotionConfig_Biter::StaticClass();
	default m_AnimConfig = UAnimConfig_Biter::StaticClass();

	default m_NavigationConfig = UAIAgentConfig_Navigation_Biter::StaticClass();

	default m_CharacterEffectComponentsConfig = UDefaultCharacterEffectComponentsConfig::StaticClass();
	default m_SpawnSettings.MaxSignificanceRadius = 10000.f;
}

class UAIAgentConfig_BiterArmored : UAIAgentConfig
{
	default m_CharacterDefinition = UCharacterDefinition_Creature_Biter_Armored::StaticClass();
	default m_LocomotionConfig = ULocomotionConfig_Biter::StaticClass();
	default m_AnimConfig = UAnimConfig_Biter::StaticClass();

	default m_NavigationConfig = UAIAgentConfig_Navigation_Biter::StaticClass();

	default m_CharacterEffectComponentsConfig = UDefaultCharacterEffectComponentsConfig::StaticClass();
	default m_SpawnSettings.MaxSignificanceRadius = 10000.f;
}

class UAIAgentConfig_BiterStrapped : UAIAgentConfig_BiterArmored
{
	default m_CharacterDefinition = UCharacterDefinition_Creature_Biter_Strapped::StaticClass();
	default m_SpawnSettings.MaxSignificanceRadius = 10000.f;
}

UCLASS()
class UAIAgentConfig_Biter_OrcGraveyard : UAIAgentConfig_Biter
{
	default m_CharacterDefinition = UCharacterDefinition_Creature_Biter_OrcGraveyard::StaticClass();
}


UCLASS()
class ABiter : AAIAgentCharacter
{
	default DefaultAIAgentConfig = UAIAgentConfig_Biter::StaticClass();
}