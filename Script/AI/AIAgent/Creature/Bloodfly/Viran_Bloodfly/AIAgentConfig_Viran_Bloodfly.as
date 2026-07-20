UCLASS()
class UAIAgentConfig_Viran_Bloodfly : UAIAgentConfig_Bloodfly
{
	default m_CharacterDefinition = UCharacterDefinition_Viran_Bloodlfy::StaticClass();
	default m_SpawnSettings.MaxSignificanceRadius = 10000.f;
}

UCLASS()
class USpawnAIAgentDefinition_Viran_Bloodfly : USpawnAIAgentDefinition
{
	default AIAgentConfigClass = UAIAgentConfig_Viran_Bloodfly::StaticClass();
	default AIAgentCharacterClass = n"AAIAgentCharacter'/Game/AI/AIAgent/Creature/Bloodfly/AIAgentCharacter_Bloodfly.AIAgentCharacter_Bloodfly_C'";
}