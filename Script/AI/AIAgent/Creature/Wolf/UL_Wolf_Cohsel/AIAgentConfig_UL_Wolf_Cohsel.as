UCLASS()
class UAIAgentConfig_UL_Wolf_Cohsel : UAIAgentConfig_Wolf
{
	default m_CharacterDefinition = UCharacterDefinition_UL_Wolf_Cohsel::StaticClass();
	default m_SpawnSettings.MaxSignificanceRadius = 10000.f;
}

UCLASS()
class USpawnAIAgentDefinition_UL_Wolf_Cohsel : USpawnAIAgentDefinition
{
	default AIAgentConfigClass = UAIAgentConfig_UL_Wolf_Cohsel::StaticClass();
	default AIAgentCharacterClass = n"/Script/Engine.Blueprint'/Game/AI/AIAgent/Creature/Wolf/AIAgentCharacter_Wolf_Cohsel.AIAgentCharacter_Wolf_Cohsel_C'";
}