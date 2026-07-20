UCLASS()
class USpawnAIAgentDefinition_Goblin_TrollTest : USpawnAIAgentDefinition
{
    default AIAgentConfigClass = UAIAgentConfig_Goblin_TrollTest::StaticClass();
    default AIAgentCharacterClass = n"AAIAgentCharacter'/Game/AI/AIAgent/Creature/Goblin/AIAgentCharacter_GoblinGreen.AIAgentCharacter_GoblinGreen_C'";
}