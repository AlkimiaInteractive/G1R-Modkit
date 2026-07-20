class UWP_Example_CharacterSpawner : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_ST_UOW_UndeadOrcTempleGuard01_3000);
	}
}

class UGothicModExt_ExampleCharacterSpawner : UGothicModExt_WorldPoints
{
	default WorldPointManagerConfigToExtend = UWorldpointManagerConfig_MainMap;

 	// Close to the scavengers in the exchange zone

	default Points.AddWorldPoint(n"Spawner_Example_NewCharacter");
	default Points.AddWorldPosition(FRotator::ZeroRotator, FVector(108448.65, -76480, -573.91));
	default Points.AddScriptDefinition(UWP_Example_CharacterSpawner);
}
