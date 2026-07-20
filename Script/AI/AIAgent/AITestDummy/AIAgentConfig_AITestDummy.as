UCLASS()
class UAIAgentConfig_AITestDummy : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_AITestDummy::StaticClass();

	default m_LocomotionConfig = ULocomotionConfig_AITestDummy::StaticClass();

	default m_NavigationConfig = UAIAgentConfig_Navigation_AITestDummy::StaticClass();

	default m_CharacterEffectComponentsConfig = UDefaultCharacterEffectComponentsConfig::StaticClass();
}

UCLASS()
class AAITestDummyHuman : AAIAgentCharacter
{
	default AutoPossessAI = EAutoPossessAI::PlacedInWorldOrSpawned;
	default AIControllerClass = AGothicAIController::StaticClass();
}