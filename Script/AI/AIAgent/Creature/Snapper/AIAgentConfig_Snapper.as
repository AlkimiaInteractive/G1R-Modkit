
UCLASS()
class UAIAgentConfig_Snapper : UAIAgentConfig
{
	default m_CharacterDefinition = UCharacterDefinition_Creature_Snapper::StaticClass();
	default m_LocomotionConfig = ULocomotionConfig_Snapper::StaticClass();;
	default m_AnimConfig = UAnimConfig_Snapper::StaticClass();
	default m_SpawnSettings.MaxSignificanceRadius = 10000.f;
	default m_NavigationConfig = UAIAgentConfig_Navigation_Snapper::StaticClass();


	default m_CharacterEffectComponentsConfig = UDefaultCharacterEffectComponentsConfig::StaticClass();
}

UCLASS()
class ASnapper : AAIAgentCharacter
{
	default AutoPossessAI = EAutoPossessAI::PlacedInWorldOrSpawned;
	default AIControllerClass = AGothicAIController::StaticClass();
}