UCLASS()
class UCharacterDefinition_AM_JuvenileTroll_01: UCharacterDefinition_Creature_JuvenileTroll
{
    default m_UniqueName = n"AM_JuvenileTroll_01";
}

UCLASS()
class USpawnAIAgentDefinition_AM_JuvenileTroll_01 : USpawnAIAgentDefinition
{
	default AIAgentConfigClass = UAIAgentConfig_AM_JuvenileTroll_01::StaticClass();
	default AIAgentCharacterClass = n"AAIAgentCharacter'/Game/AI/AIAgent/Creature/Troll/AIAgentCharacter_Troll_Young.AIAgentCharacter_Troll_Young_C'";
}
