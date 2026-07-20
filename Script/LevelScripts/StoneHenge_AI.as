class UWP_SH_SKELETON_SPAWN_01 : UWorldPointScript
{
	// UFUNCTION()
	// void StoneHenge01Event()
	// {
	// 	SpawnAIAgent(USpawnAIAgentDefinition_SH_Skeleton::StaticClass());
	// 	SpawnAIAgent(USpawnAIAgentDefinition_SH_Skeleton::StaticClass());
	// 	SpawnAIAgent(USpawnAIAgentDefinition_SH_Skeleton::StaticClass());
	// 	SpawnAIAgent(USpawnAIAgentDefinition_SH_Skeleton::StaticClass());
	// }
};

class UWP_SH_SKELETON_SPAWN_02 : UWorldPointScript
{
	// UFUNCTION()
	// void StoneHenge02Event()
	// {
	// 	SpawnAIAgent(USpawnAIAgentDefinition_SH_Skeleton::StaticClass());
	// 	SpawnAIAgent(USpawnAIAgentDefinition_SH_Skeleton::StaticClass());
	// 	SpawnAIAgent(USpawnAIAgentDefinition_SH_Skeleton::StaticClass());
	// 	SpawnAIAgent(USpawnAIAgentDefinition_SH_Skeleton::StaticClass());
	// }
};

// class UWP_SH_SKELETON_SPAWN_01_00 : UWorldPointScript
// {
// 	UFUNCTION()
// 	void StoneHenge01Event()
// 	{
// 		SpawnAIAgent(USpawnAIAgentDefinition_SH_Skeleton::StaticClass());
// 	}
// };

// class UWP_SH_SKELETON_SPAWN_01_01 : UWorldPointScript
// {
// 	UFUNCTION()
// 	void StoneHenge01Event()
// 	{
// 		SpawnAIAgent(USpawnAIAgentDefinition_SH_Skeleton::StaticClass());
// 	}
// };


class UWP_SH_SKELETON_SPAWN_01_02 : UWorldPointScript
{
	UFUNCTION()
	void StoneHenge01Event()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_SH_Skeleton::StaticClass());
	}
};


class UWP_SH_SKELETON_SPAWN_01_03 : UWorldPointScript
{
	UFUNCTION()
	void StoneHenge01Event()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_SH_Skeleton::StaticClass());
	}
};


class UWP_SH_SKELETON_SPAWN_02_00 : UWorldPointScript
{
	UFUNCTION()
	void StoneHenge02Event()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_SH_Skeleton::StaticClass());
	}
};


class UWP_SH_SKELETON_SPAWN_02_01 : UWorldPointScript
{
	UFUNCTION()
	void StoneHenge02Event()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_SH_Skeleton::StaticClass());
	}
};


// class UWP_SH_SKELETON_SPAWN_02_02 : UWorldPointScript
// {
// 	UFUNCTION()
// 	void StoneHenge02Event()
// 	{
// 		SpawnAIAgent(USpawnAIAgentDefinition_SH_Skeleton::StaticClass());
// 	}
// };


// class UWP_SH_SKELETON_SPAWN_02_03 : UWorldPointScript
// {
// 	UFUNCTION()
// 	void StoneHenge02Event()
// 	{
// 		SpawnAIAgent(USpawnAIAgentDefinition_SH_Skeleton::StaticClass());
// 	}
// };







class UWP_SH_Zombie_SPAWN_01 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_SH_Zombie_01::StaticClass());
	}
};
        