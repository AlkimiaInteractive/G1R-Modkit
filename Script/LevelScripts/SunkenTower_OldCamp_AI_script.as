class USPAWN_ST_SMALLCAVE01_MOLERAT_WP : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Molerat::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_Molerat::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_Molerat::StaticClass());
	}
};