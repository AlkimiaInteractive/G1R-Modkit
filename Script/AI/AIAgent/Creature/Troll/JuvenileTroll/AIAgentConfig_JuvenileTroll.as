
UCLASS()
class UAIAgentConfig_JuvenileTroll : UAIAgentConfig
{
	default m_CharacterDefinition = UCharacterDefinition_Creature_JuvenileTroll::StaticClass();
	default m_LocomotionConfig = ULocomotionConfig_JuvenileTroll::StaticClass();
	default m_AnimConfig = UAnimConfig_JuvenileTroll::StaticClass();
	default m_SpawnSettings.MaxSignificanceRadius = 10000.f;
	default m_NavigationConfig = UAIAgentConfig_Navigation_Troll::StaticClass();


	default m_CharacterEffectComponentsConfig = UDefaultCharacterEffectComponentsConfig::StaticClass();
}


UCLASS()
class AJuvenileTroll : AAIAgentCharacter
{
	default DefaultAIAgentConfig = UAIAgentConfig_JuvenileTroll::StaticClass();
}