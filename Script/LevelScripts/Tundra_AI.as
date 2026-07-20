class UWP_TA_GOBLINGREEN_SPAWN_01 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Goblin_Green_Club::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_Goblin_Green_Torch::StaticClass());
        SpawnAIAgent(USpawnAIAgentDefinition_Goblin_Green_Sword::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_Goblin_Green_Club::StaticClass());
        SpawnAIAgent(USpawnAIAgentDefinition_Goblin_Green_Sword::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_Goblin_Green_Torch::StaticClass());
	}
};

class UWP_TA_GOBLINBLACK_SPAWN_01 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Goblin_Black::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_Goblin_Warrior::StaticClass());
        SpawnAIAgent(USpawnAIAgentDefinition_Goblin_Black::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_Goblin_Black_Torch::StaticClass());
	}
};

class UWP_TA_WOLF_SPAWN_02 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Wolf_Alpha::StaticClass(),UDailyRoutine_Wolf_Base(2000));
		SpawnAIAgent(USpawnAIAgentDefinition_Wolf_Alpha::StaticClass(), UDailyRoutine_Wolf_Base(2000));
        SpawnAIAgent(USpawnAIAgentDefinition_Wolf_Alpha::StaticClass(), UDailyRoutine_Wolf_Base(3000));
		SpawnAIAgent(USpawnAIAgentDefinition_Wolf_Alpha::StaticClass(), UDailyRoutine_Wolf_Base(2000));
		SpawnAIAgent(USpawnAIAgentDefinition_Wolf_Alpha::StaticClass(), UDailyRoutine_Wolf_Base(2000));
		SpawnAIAgent(USpawnAIAgentDefinition_Wolf_Alpha::StaticClass(), UDailyRoutine_Wolf_Base(3000));
		SpawnAIAgent(USpawnAIAgentDefinition_Wolf_Alpha::StaticClass(), UDailyRoutine_Wolf_Base(2000));
		SpawnAIAgent(USpawnAIAgentDefinition_Wolf_Alpha::StaticClass(), UDailyRoutine_Wolf_Base(3000));
	}
};

class UWP_TA_WOLF_SPAWN_03 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Wolf_Alpha::StaticClass(),UDailyRoutine_Wolf_Base(2000));
		SpawnAIAgent(USpawnAIAgentDefinition_Wolf_Alpha::StaticClass(), UDailyRoutine_Wolf_Base(2000));
	}
};

class UWP_TA_WOLF_SPAWN_04 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Wolf_Alpha::StaticClass(),UDailyRoutine_Wolf_Base(2000));
		SpawnAIAgent(USpawnAIAgentDefinition_Wolf_Alpha::StaticClass(), UDailyRoutine_Wolf_Base(2000));
		SpawnAIAgent(USpawnAIAgentDefinition_Wolf_Alpha::StaticClass(), UDailyRoutine_Wolf_Base(2000));
	}
};

class UWP_TA_MEATBUG_SPAWN_01 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Meatbug::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_Meatbug::StaticClass());
	}
};


class UWP_TA_SHADOWBEASTTUNDRA_SPAWN_01 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
#ifdef WITH_STORY_G1R
		auto HuntQuest = G1R::Quest::ValleyOfMines_VoMCHAPTER4_BESTIARY_5_BESTIARY_5_OBJ_HUNTSHADOWBEAST;
		if (HuntQuest == nullptr || !HuntQuest.IsRunning())
			return;

		for (auto Beast : FCharacterUniqueName(n"ShadowBeastFrost").AllNPCStates)
		{
			if (!Beast.IsDead())
				return;
		}

		auto Hero = AGothicCharacterState::FindByUniqueName(n"Hero");
		if (Hero != nullptr && Hero.HasItem(UItAt_Shadow_06, 1))
			return;

		SpawnShadowBeastFrost();
#endif
	}

	UFUNCTION()
	void SpawnShadowBeastFrost()
	{
		for (auto ShadowBeastFrost : FCharacterUniqueName(n"ShadowBeastFrost").AllNPCStates)
		{
			if (!ShadowBeastFrost.IsDead())
			{
				ShadowBeastFrost.RemoveFromWorld();
			}
		}

		SpawnAIAgent(USpawnAIAgentDefinition_ShadowBeast_Frost::StaticClass());
	}
};

class UWP_TA_SKELETONMAGE_SPAWN_01 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_SkeletonMage5::StaticClass());
	}
};

class UWP_TA_SKELETON_SPAWN_01 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Skeleton::StaticClass(),UDailyRoutine_Skeleton(1100));
		SpawnAIAgent(USpawnAIAgentDefinition_Skeleton::StaticClass(),UDailyRoutine_Skeleton(1500));
	}
};

class UWP_TA_SKELETONWARRIOR_SPAWN_01 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_SkeletonWarrior::StaticClass(),UDailyRoutine_Skeleton(1500));
		SpawnAIAgent(USpawnAIAgentDefinition_SkeletonWarrior::StaticClass(),UDailyRoutine_Skeleton(1500));
		SpawnAIAgent(USpawnAIAgentDefinition_SkeletonWarrior::StaticClass(),UDailyRoutine_Skeleton(250));
	}
};

class UWP_TA_SKELETONSCOUT_SPAWN_01 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_SkeletonScout::StaticClass(),UDailyRoutine_Skeleton(1500));
		SpawnAIAgent(USpawnAIAgentDefinition_SkeletonScout::StaticClass(),UDailyRoutine_Skeleton(1100));
	}
};