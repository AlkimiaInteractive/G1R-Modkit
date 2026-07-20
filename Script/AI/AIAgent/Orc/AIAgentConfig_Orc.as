
// This is the base class of all human config to have at least a minimal setup
UCLASS(abstract)
class UAIAgentConfig_Orc : UAIAgentConfig
{
	default m_CharacterDefinition = UCharacterDefinition_Orc::StaticClass();
	default m_LocomotionConfig = ULocomotionConfig_Orc::StaticClass();
	default m_AnimConfig = UAnimConfig_Orc::StaticClass();
	default m_CharacterDefaultInteraction = UDefaultCharacterInteraction::StaticClass();

	default m_NavigationConfig = UAIAgentConfig_Navigation_Orc::StaticClass();
	default m_CharacterEffectComponentsConfig = UDefaultCharacterEffectComponentsConfig::StaticClass();
}

UCLASS(abstract)
class UAIAgentConfig_Orc_Shaman : UAIAgentConfig_Orc
{
	default m_AnimConfig = UAnimConfig_Orc_Shaman::StaticClass();
}

UCLASS(abstract)
class UAIAgentConfig_UndeadOrc : UAIAgentConfig_Orc
{
	default m_AnimConfig = UAnimConfig_UndeadOrc::StaticClass();
}

UCLASS(abstract)
class UAIAgentConfig_UndeadOrc_Shaman : UAIAgentConfig_Orc
{
	default m_AnimConfig = UAnimConfig_UndeadOrc_Shaman::StaticClass();
}

UCLASS()
class AOrc : AAIAgentCharacter
{
    default DefaultAIAgentConfig = UAIAgentConfig_Orc::StaticClass();
}