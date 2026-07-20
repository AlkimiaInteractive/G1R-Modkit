UCLASS()
class UAIAgentConfig_OA_Biter_Arena_01 : UAIAgentConfig_Biter
{
	default m_CharacterDefinition = UCharacterDefinition_OA_Biter_Arena_01::StaticClass();
}

UCLASS()
class USpawnAIAgentDefinition_OA_Biter_Arena_01 : USpawnAIAgentDefinition
{
	default AIAgentConfigClass = UAIAgentConfig_OA_Biter_Arena_01::StaticClass();
	default AIAgentCharacterClass = n"AAIAgentCharacter'/Game/AI/AIAgent/Creature/Biter/AIAgentCharacter_Biter.AIAgentCharacter_Biter_C'";
}