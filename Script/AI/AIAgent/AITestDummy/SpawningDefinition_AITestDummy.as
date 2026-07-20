class USpawnAIAgentDefinition_AITestDummy : USpawnAIAgentDefinition
{
	default AIAgentConfigClass = UAIAgentConfig_AITestDummy::StaticClass();
	default AIAgentCharacterClass = n"Blueprint'/Game/AI/AIAgent/Human/AIAgentCharacter_Human_Base.AIAgentCharacter_Human_Base_C'";
}