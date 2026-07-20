UCLASS()
class UAIAgentConfig_SH_Skeleton : UAIAgentConfig_Skeleton
{
	default m_CharacterDefinition = UCharacterDefinition_SH_Skeleton::StaticClass();
}

UCLASS()
class USpawnAIAgentDefinition_SH_Skeleton : USpawnAIAgentDefinition
{
	default AIAgentConfigClass = UAIAgentConfig_SH_Skeleton::StaticClass();
	default AIAgentCharacterClass = n"AAIAgentCharacter'/Game/AI/AIAgent/Creature/Skeleton/AIAgentCharacter_Skeleton.AIAgentCharacter_Skeleton_C'";
}