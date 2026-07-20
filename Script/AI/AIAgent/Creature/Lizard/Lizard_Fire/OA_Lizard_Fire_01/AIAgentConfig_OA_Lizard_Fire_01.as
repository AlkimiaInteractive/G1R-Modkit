UCLASS()
class UAIAgentConfig_OA_Lizard_Fire_01 : UAIAgentConfig_Lizard_Fire
{
	default m_CharacterDefinition = UCharacterDefinition_OA_Lizard_Fire_01::StaticClass();
}

UCLASS()
class USpawnAIAgentDefinition_OA_Lizard_Fire_01 : USpawnAIAgentDefinition
{
	default AIAgentConfigClass = UAIAgentConfig_OA_Lizard_Fire_01::StaticClass();
	default AIAgentCharacterClass = n"AAIAgentCharacter'/Game/AI/AIAgent/Creature/Lizard/AI/AIAgentCharacter_Lizard_Fire.AIAgentCharacter_Lizard_Fire_C'";
}