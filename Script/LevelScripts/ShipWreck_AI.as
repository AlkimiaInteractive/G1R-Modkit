class UOW_GOBBO_SHIPWRECK_01_SPAWN_WP : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Goblin_Green_Club::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_Goblin_Green_Club::StaticClass());
        SpawnAIAgent(USpawnAIAgentDefinition_Goblin_Green_Club::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_Goblin_Green_Club::StaticClass());
	}
};

class UOW_GOBBO_SHIPWRECK_02_SPAWN_WP : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Goblin_Green_Club::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_Goblin_Green_Torch::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_Goblin_Green_Club::StaticClass());
	}
};

class UOW_GOBBO_SHIPWRECK_03_SPAWN_WP : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Goblin_Green_Club::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_Goblin_Green_Club::StaticClass());
        SpawnAIAgent(USpawnAIAgentDefinition_Goblin_Green_Club::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_Goblin_Green_Torch::StaticClass());
        SpawnAIAgent(USpawnAIAgentDefinition_Goblin_Green_Club::StaticClass());
	}
};

class UOW_TROLL_SHIPWRECK_SPAWN_WP : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_TrollYoung::StaticClass());
	}
};