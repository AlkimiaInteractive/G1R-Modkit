
UCLASS()
class UCharacterDefinition_AM_Snapper_01 : UCharacterDefinition_Creature_Snapper
{ 
    default m_UniqueName = n"AM_Snapper_01";
}

UCLASS()
class USpawnAIAgentDefinition_AM_Snapper_01 : USpawnAIAgentDefinition
{
	default AIAgentConfigClass = UAIAgentConfig_AM_Snapper_01::StaticClass();
	default AIAgentCharacterClass = n"AAIAgentCharacter'/Game/AI/AIAgent/Creature/Snapper/AIAgentCharacter_Snapper.AIAgentCharacter_Snapper_C'";
}
