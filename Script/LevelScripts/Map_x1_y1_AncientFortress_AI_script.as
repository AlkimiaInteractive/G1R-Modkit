
//EAST FOREST
class UWP_EF_BLOODFLY_SPAWN_01 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Bloodfly::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_Bloodfly::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_Bloodfly::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_Bloodfly::StaticClass());
	}
};

class UWP_EF_BLOODFLY_SPAWN_01_APARVEZ : UWorldPointScript
{
	UFUNCTION()
	void SpawnMonstersAfterParvez()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Bloodfly::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_Bloodfly::StaticClass());
	}
};

class UWP_EF_BLOODFLY_SPAWN_01_CH2 : UWorldPointScript
{
	UFUNCTION()
	void OnChapterRespawn()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Bloodfly::StaticClass());

	}
};

class UWP_EF_BLOODFLY_SPAWN_02 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Bloodfly::StaticClass(), UDailyRoutine_Bloodfly_Short());
		SpawnAIAgent(USpawnAIAgentDefinition_Bloodfly::StaticClass(), UDailyRoutine_Bloodfly_Short());
		SpawnAIAgent(USpawnAIAgentDefinition_Bloodfly::StaticClass(), UDailyRoutine_Bloodfly_Short());
		SpawnAIAgent(USpawnAIAgentDefinition_Bloodfly::StaticClass(), UDailyRoutine_Bloodfly_Short());
	}
};

class UWP_EF_BLOODFLY_SPAWN_03 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Bloodfly::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_Bloodfly::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_Bloodfly::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_Bloodfly::StaticClass());
	}
};

class UWP_EF_BLOODFLY_SPAWN_03_CH2 : UWorldPointScript
{
	UFUNCTION()
	void OnChapterRespawn()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Bloodfly::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_Bloodfly::StaticClass());
	}
};

class UWP_EF_SCAVENGER_SPAWN_01 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_ScavengerAdult::StaticClass());
	}
};

class UWP_EF_SCAVENGER_SPAWN_02 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_ScavengerAdult::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_ScavengerAdult::StaticClass());
	}
};

class UWP_EF_SCAVENGER_SPAWN_02_CH2 : UWorldPointScript
{
	UFUNCTION()
	void OnChapterRespawn()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_ScavengerAdult::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_ScavengerAdult::StaticClass());
	}
};

class UWP_EF_SURROUNDINGS12_SCAVENGER_SPAWN_01 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_ScavengerAdult::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_ScavengerAdult::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_ScavengerAdult::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_ScavengerAdult::StaticClass());
	}
};

class UWP_STONEGOLEM_OLDFORT : UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_GolemStone_AncientMonastery::StaticClass(),UDailyRoutine_Golem_Stone_Bridge());
    }
}

class UWP_EF_SCAVENGER_SPAWN_04 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_ScavengerAdult::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_ScavengerAdult::StaticClass());
	}
};

class UWP_EF_SCAVENGER_SPAWN_05 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_ScavengerAdult::StaticClass());
	}
};

class UWP_EF_SCAVENGER_SPAWN_06 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_ScavengerAdult::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_ScavengerAdult::StaticClass());
	}
};

class UWP_EF_SCAVENGER_SPAWN_06_APARVEZ : UWorldPointScript
{
	UFUNCTION()
	void SpawnMonstersAfterParvez()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_ScavengerAdult::StaticClass());
	}
};

class UWP_EF_SCAVENGER_SPAWN_06_CH2 : UWorldPointScript
{
	UFUNCTION()
	void OnChapterRespawn()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_ScavengerAdult::StaticClass());
	}
};

class UWP_EF_SCAVENGER_SPAWN_07 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_ScavengerAdult::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_ScavengerAdult::StaticClass());
	}
};

class UWP_EF_SCAVENGER_SPAWN_07_CH2 : UWorldPointScript
{
	UFUNCTION()
	void OnChapterRespawn()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_ScavengerAdult::StaticClass());
	}
};

class UWP_EF_SCAVENGER_SPAWN_08 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_ScavengerAdult::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_ScavengerAdult::StaticClass());
	}
};

class UWP_EF_SCAVENGER_SPAWN_08_CH2 : UWorldPointScript
{
	UFUNCTION()
	void OnChapterRespawn()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_ScavengerAdult::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_ScavengerAdult::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_ScavengerAdult::StaticClass());

	}
};

class UWP_EF_SCAVENGER_SPAWN_09 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_ScavengerAdult::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_ScavengerAdult::StaticClass());
	}
};

class UWP_EF_SCAVENGER_SPAWN_10 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_ScavengerAdult::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_ScavengerAdult::StaticClass());
	}
};

class UWP_EF_SCAVENGER_SPAWN_10_CH2 : UWorldPointScript
{
	UFUNCTION()
	void OnChapterRespawn()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_ScavengerAdult::StaticClass());
	}
};


class UWP_EF_SURROUNDINGS11_SCAVENGER_SPAWN_01 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_ScavengerAdult::StaticClass());
	}
};

class UWP_EF_SURROUNDINGS11_SCAVENGER_SPAWN_01_CH2 : UWorldPointScript
{
	UFUNCTION()
	void OnChapterRespawn()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_ScavengerAdult::StaticClass());
	}
};


class UWP_EF_MOLERAT_SPAWN_01 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Molerat::StaticClass(), UDailyRoutine_Molerat_Base(1000));
		SpawnAIAgent(USpawnAIAgentDefinition_Molerat::StaticClass(), UDailyRoutine_Molerat_Base(1000));
	}
};

class UWP_EF_MOLERAT_SPAWN_01_CH2 : UWorldPointScript
{
	UFUNCTION()
	void OnChapterRespawn()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Molerat::StaticClass(), UDailyRoutine_Molerat_Base(1000));
		SpawnAIAgent(USpawnAIAgentDefinition_Molerat::StaticClass(), UDailyRoutine_Molerat_Base(1000));
	}
};

class UWP_EF_MOLERAT_SPAWN_02 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Molerat::StaticClass(), UDailyRoutine_Molerat_Base(1000));
		SpawnAIAgent(USpawnAIAgentDefinition_Molerat::StaticClass(), UDailyRoutine_Molerat_Base(1000));
	}
};

class UWP_EF_MOLERAT_SPAWN_03 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Molerat::StaticClass(), UDailyRoutine_Molerat_Base(1000));
		SpawnAIAgent(USpawnAIAgentDefinition_Molerat::StaticClass(), UDailyRoutine_Molerat_Base(1000));
		SpawnAIAgent(USpawnAIAgentDefinition_Molerat::StaticClass(), UDailyRoutine_Molerat_Base(1000));
	}
};

class UWP_EF_MOLERAT_SPAWN_03_CH2 : UWorldPointScript
{
	UFUNCTION()
	void OnChapterRespawn()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Molerat::StaticClass(), UDailyRoutine_Molerat_Base(1000));
	}
};

class UWP_EF_WOLF_SPAWN_01 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Wolf::StaticClass(), UDailyRoutine_Wolf_Base(700));
		SpawnAIAgent(USpawnAIAgentDefinition_Wolf::StaticClass(), UDailyRoutine_Wolf_Base(700));
	}
};

class UWP_EF_WOLF_SPAWN_02 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Wolf::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_Wolf::StaticClass());
	}
};

class UWP_EF_WOLF_SPAWN_02_CH2 : UWorldPointScript
{
	UFUNCTION()
	void OnChapterRespawn()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Wolf::StaticClass());
	}
};

class UWP_EF_WOLF_SPAWN_03 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Wolf::StaticClass());
	}
};

class UWP_EF_WOLF_SPAWN_03_CH2 : UWorldPointScript
{
	UFUNCTION()
	void OnChapterRespawn()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Wolf::StaticClass());
	}
};

class UWP_EF_WOLF_SPAWN_04 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Wolf::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_Wolf::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_Wolf::StaticClass());
	}
};

class UWP_EF_WOLF_SPAWN_05 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Wolf::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_Wolf::StaticClass());
	}
};

class UWP_EF_WOLF_SPAWN_05_CH2 : UWorldPointScript
{
	UFUNCTION()
	void OnChapterRespawn()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Wolf::StaticClass());
	}
};

class UWP_EF_WOLF_SPAWN_06 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Wolf::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_Wolf::StaticClass());
	}
};

class UWP_EF_WOLF_SPAWN_06_CH2 : UWorldPointScript
{
	UFUNCTION()
	void OnChapterRespawn()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Wolf::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_Wolf::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_Wolf::StaticClass());
	}
};


class UWP_EF_LIZARD_SPAWN_01 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Lizard::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_Lizard::StaticClass());
	}
};

class UWP_EF_LIZARD_SPAWN_01_CH2 : UWorldPointScript
{
	UFUNCTION()
	void OnChapterRespawn()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Lizard::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_Lizard::StaticClass());
	}
};

class UWP_EF_LIZARD_SPAWN_02 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Lizard::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_Lizard::StaticClass());
	}
};

class UWP_EF_MOLERAT_SPAWN_04 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Molerat::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_Molerat::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_Molerat::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_Molerat::StaticClass());
	}
};

class UWP_EF_WOLF_SPAWN_10 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Wolf::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_Wolf::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_Wolf::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_Wolf::StaticClass());
	}
};

class UWP_EF_SCAVENGER_SPAWN_14 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_ScavengerAdult::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_ScavengerAdult::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_ScavengerAdult::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_ScavengerAdult::StaticClass());
	}
};

class UWP_EF_SCAVENGER_SPAWN_15 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_ScavengerAdult::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_ScavengerAdult::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_ScavengerAdult::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_ScavengerAdult::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_ScavengerAdult::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_ScavengerAdult::StaticClass());
	}
};

class UWP_EF_FIRELIZARD_SPAWN_01 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_LizardFire::StaticClass());
	}
};

class UWP_EF_FIRELIZARD_SPAWN_02 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_LizardFire::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_LizardFire::StaticClass());
	}
};

class UWP_EF_ZOMBIE_SPAWN_01 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Zombie::StaticClass(), dailyRoutine = UDailyRoutine_Zombie());
	}
};

class UWP_EF_ZOMBIE_SPAWN_02 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Zombie::StaticClass(), dailyRoutine = UDailyRoutine_Zombie());
	}
};



//SWAMP CAMP SLOPE
class UWP_EF_SCSLOPE_LIZARD_SPAWN_01 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Lizard::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_Lizard::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_Lizard::StaticClass());
	}
};

class UWP_EF_SCSLOPE_LIZARD_SPAWN_01_APARVEZ : UWorldPointScript
{
	UFUNCTION()
	void SpawnMonstersAfterParvez()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Lizard::StaticClass());
	}
};

class UWP_EF_SCSLOPE_LIZARD_SPAWN_01_CH2 : UWorldPointScript
{
	UFUNCTION()
	void OnChapterRespawn()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Lizard::StaticClass());
	}
};

class UWP_EF_SCSLOPE_MOLERAT_SPAWN_01 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Molerat::StaticClass(), UDailyRoutine_Molerat_Base(1000));
		SpawnAIAgent(USpawnAIAgentDefinition_Molerat::StaticClass(), UDailyRoutine_Molerat_Base(1000));
		SpawnAIAgent(USpawnAIAgentDefinition_Molerat::StaticClass(), UDailyRoutine_Molerat_Base(1000));
		SpawnAIAgent(USpawnAIAgentDefinition_Molerat::StaticClass(), UDailyRoutine_Molerat_Base(1000));
	}
};

class UWP_EF_SCSLOPE_MOLERAT_SPAWN_01_APARVEZ : UWorldPointScript
{
	UFUNCTION()
	void SpawnMonstersAfterParvez()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Molerat::StaticClass(), UDailyRoutine_Molerat_Base(1000));
		SpawnAIAgent(USpawnAIAgentDefinition_Molerat::StaticClass(), UDailyRoutine_Molerat_Base(1000));
	}
};

class UWP_EF_SCSLOPE_MOLERAT_SPAWN_01_CH2 : UWorldPointScript
{
	UFUNCTION()
	void OnChapterRespawn()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Molerat::StaticClass(), UDailyRoutine_Molerat_Base(1000));
	}
};

class UWP_EF_SCSLOPE_BLOODFLY_SPAWN_01 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Bloodfly::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_Bloodfly::StaticClass());
	}
};

class UWP_EF_SCSLOPE_BLOODFLY_SPAWN_01_CH2 : UWorldPointScript
{
	UFUNCTION()
	void OnChapterRespawn()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Bloodfly::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_Bloodfly::StaticClass());
	}
};

class UWP_EF_SCSLOPE_SCAVENGER_SPAWN_01 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_ScavengerAdult::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_ScavengerAdult::StaticClass());
	}
};

class UWP_EF_SCSLOPE_SCAVENGER_SPAWN_01_CH2 : UWorldPointScript
{
	UFUNCTION()
	void OnChapterRespawn()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_ScavengerAdult::StaticClass());
	}
};

//GOBLIN CAVE
class UWP_EF_GOBLINCAVE_GOBLIN_SPAWN_01 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Goblin_Black::StaticClass(), UDailyRoutine_GoblinGreen(1000));
		SpawnAIAgent(USpawnAIAgentDefinition_Goblin_Black_Torch::StaticClass(), UDailyRoutine_GoblinGreen(1000));
		SpawnAIAgent(USpawnAIAgentDefinition_Goblin_Black::StaticClass(), UDailyRoutine_GoblinGreen(1000));
	}
};

class UWP_EF_GOBLINCAVE_GOBLIN_SPAWN_02 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Goblin_Black_Torch::StaticClass(), UDailyRoutine_GoblinGreen(1000));
		SpawnAIAgent(USpawnAIAgentDefinition_Goblin_Black::StaticClass(), UDailyRoutine_GoblinGreen(1000));
		SpawnAIAgent(USpawnAIAgentDefinition_Goblin_Black::StaticClass(), UDailyRoutine_GoblinGreen(1000));
	}
};

class UWP_EF_GOBLINCAVE_GOBLIN_SPAWN_03 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Goblin_Black::StaticClass(), UDailyRoutine_GoblinGreen(1000));
		SpawnAIAgent(USpawnAIAgentDefinition_Goblin_Black::StaticClass(), UDailyRoutine_GoblinGreen(1000));
	}
};

class UWP_EF_GOBLINCAVE_GOBLIN_SPAWN_03_CH2 : UWorldPointScript
{
	UFUNCTION()
	void OnChapterRespawn()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Goblin_Black::StaticClass(), UDailyRoutine_GoblinGreen(1000));
		SpawnAIAgent(USpawnAIAgentDefinition_Goblin_Black::StaticClass(), UDailyRoutine_GoblinGreen(1000));
	}
};

class UWP_EF_GOBLINCAVE_GOBLIN_SPAWN_04 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Goblin_Black::StaticClass(), UDailyRoutine_GoblinGreen(1000));
		SpawnAIAgent(USpawnAIAgentDefinition_Goblin_Black::StaticClass(), UDailyRoutine_GoblinGreen(1000));
	}
};

class UWP_EF_GOBLINCAVE_GOBLIN_SPAWN_05 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Goblin_Black::StaticClass(), UDailyRoutine_GoblinGreen(1000));
		SpawnAIAgent(USpawnAIAgentDefinition_Goblin_Black_Torch::StaticClass(), UDailyRoutine_GoblinGreen(1000));
		SpawnAIAgent(USpawnAIAgentDefinition_Goblin_Black::StaticClass(), UDailyRoutine_GoblinGreen(1000));
	}
};

class UWP_EF_GOBLINCAVE_GOBLIN_SPAWN_06 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Goblin_Black::StaticClass(), UDailyRoutine_GoblinGreen(1000));
		SpawnAIAgent(USpawnAIAgentDefinition_Goblin_Black::StaticClass(), UDailyRoutine_GoblinGreen(1000));
		SpawnAIAgent(USpawnAIAgentDefinition_Goblin_Black::StaticClass(), UDailyRoutine_GoblinGreen(1000));
		SpawnAIAgent(USpawnAIAgentDefinition_Goblin_Black::StaticClass(), UDailyRoutine_GoblinGreen(1000));
		SpawnAIAgent(USpawnAIAgentDefinition_Goblin_Black::StaticClass(), UDailyRoutine_GoblinGreen(1000));
		SpawnAIAgent(USpawnAIAgentDefinition_Goblin_Black::StaticClass(), UDailyRoutine_GoblinGreen(1000));
	}
};

class UWP_EF_GOBLINCAVE_GOBLIN_SPAWN_07 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Goblin_Black_Torch::StaticClass(), UDailyRoutine_GoblinGreen(1000));
		SpawnAIAgent(USpawnAIAgentDefinition_Goblin_Black::StaticClass(), UDailyRoutine_GoblinGreen(1000));
	}
};

class UWP_EF_GOBLINCAVE_GOBLIN_SPAWN_08 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Goblin_Black::StaticClass(), UDailyRoutine_GoblinGreen(1000));
		SpawnAIAgent(USpawnAIAgentDefinition_Goblin_Black::StaticClass(), UDailyRoutine_GoblinGreen(1000));
		SpawnAIAgent(USpawnAIAgentDefinition_Goblin_Black::StaticClass(), UDailyRoutine_GoblinGreen(1000));
	}
};


//MOUNTAIN FORTRESS
class UWP_MF_LIZARD_SPAWN_01 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Lizard::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_Lizard::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_Lizard::StaticClass());
	}
};

class UWP_MF_LIZARD_SPAWN_02 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Lizard::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_Lizard::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_Lizard::StaticClass());
	}
};

class UWP_MF_BLOODHOUND_SPAWN_01 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Bloodhound::StaticClass());
	}
};

class UWP_MF_BLOODHOUND_SPAWN_02 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Bloodhound::StaticClass());
	}
};

class UWP_MF_BLOODHOUND_SPAWN_03 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Bloodhound::StaticClass());
	}
};

class UWP_MF_BLOODHOUND_SPAWN_04 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Bloodhound::StaticClass());
	}
};

class UWP_MF_BLOODHOUND_SPAWN_05 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Bloodhound::StaticClass());
	}
};

class UWP_MF_BLOODHOUND_SPAWN_06 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Bloodhound::StaticClass());
	}
};

class UWP_MF_BLOODHOUND_SPAWN_07 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Bloodhound::StaticClass());
	}
};


//MOUNTAIN FORTRESS CASTLE
class UWP_MF_HARPY_SPAWN_01 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Harpy::StaticClass());
	}
};

class UWP_MF_HARPY_SPAWN_02 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Harpy::StaticClass());
	}
};

class UWP_MF_HARPY_SPAWN_03 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Harpy::StaticClass());
	}
};

class UWP_MF_HARPY_SPAWN_04 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Harpy::StaticClass());
	}
};

class UWP_MF_HARPY_SPAWN_05 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Harpy::StaticClass());
	}
};

class UWP_MF_HARPY_SPAWN_06 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Harpy::StaticClass());
	}
};

class UWP_MF_HARPY_SPAWN_21 : UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_Harpy);
        SpawnAIAgent(USpawnAIAgentDefinition_Harpy);
    }
}

class UWP_MF_HARPY_SPAWN_07 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Harpy::StaticClass());
	}
};

class UWP_MF_HARPY_SPAWN_08 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Harpy::StaticClass());
	}
};

class UWP_MF_HARPY_SPAWN_09 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Harpy::StaticClass());
	}
};

class UWP_MF_HARPY_SPAWN_10 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Harpy::StaticClass());
	}
};

class UWP_MF_HARPY_SPAWN_11 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Harpy::StaticClass());
	}
};

class UWP_MF_HARPY_SPAWN_12 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Harpy::StaticClass());
	}
};

class UWP_MF_HARPY_SPAWN_13 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Harpy::StaticClass());
	}
};

class UWP_MF_HARPY_SPAWN_14 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Harpy::StaticClass());
	}
};

class UWP_MF_HARPY_SPAWN_15 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Harpy::StaticClass(), UDailyRoutine_Harpy(100.0f));
	}
};

class UWP_MF_HARPY_SPAWN_16 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Harpy::StaticClass(), UDailyRoutine_Harpy(100.0f));
	}
};

class UWP_MF_HARPY_SPAWN_17 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Harpy::StaticClass(), UDailyRoutine_Harpy(100.0f));
	}
};

class UWP_MF_HARPY_SPAWN_18 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Harpy::StaticClass());
	}
};

class UWP_MF_HARPY_SPAWN_19 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Harpy::StaticClass());
	}
};

class UWP_MF_HARPY_SPAWN_20 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Harpy::StaticClass(), UDailyRoutine_Harpy(100.0f));
	}
};

class UWP_MF_HARPY_SPAWN_22 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Harpy::StaticClass(), UDailyRoutine_Harpy(100.0f));
	}
};

class UWP_MF_MEATBUG_SPAWN_01 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Meatbug::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_Meatbug::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_Meatbug::StaticClass());
	}
};

class UWP_MF_SKELETON_SPAWN_01 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Skeleton::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_Skeleton::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_Skeleton::StaticClass());
	}
};

class UWP_MF_STONEGOLEM_SPAWN_01 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_GolemStone_Bridge::StaticClass());
	}
};

class UWP_MF_STONEGOLEM_SPAWN_02 : UWorldPointScript
{
	UFUNCTION()
	void OnFocusQuestStart()
	{
		for (auto Golem : FCharacterUniqueName(n"Golem_Stone_Bridge").AllNPCStates)
        {
            if (!Golem.IsDead())
            {
                Golem.RemoveFromWorld();
            }
        }


        SpawnAIAgent(USpawnAIAgentDefinition_GolemStone_Bridge::StaticClass());
	}
};

//SUNKEN TOWER

class UWP_ST_MOLERATMOTHER_SPAWN_01 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_BigMolerat::StaticClass());
	}
};

class UWP_ST_LIZARD_SPAWN_01 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Lizard::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_Lizard::StaticClass());
	}
};


class UWP_ST_SKELETON_SPAWN_01 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Skeleton::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_Skeleton::StaticClass());
	}
};

class UWP_ST_SKELETON_SPAWN_02 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Skeleton::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_Skeleton::StaticClass());
	}
};

class UWP_ST_SKELETON_SPAWN_03 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Skeleton_XardasServant::StaticClass(), UDailyRoutine_Skeleton_Servant());
	}
};

class UWP_ST_SKELETONMAGE_SPAWN_01 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_SkeletonMage1::StaticClass());
	}
};

class UWP_ST_DEMONLORD_SPAWN : UWorldPointScript
{
	UFUNCTION()
	void OnDemon_Lord_Activate()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_DemonLord::StaticClass(),UDailyRoutine_Demon_Lord());
	}
};

class UWP_ST_ZOMBIE_SPAWN_01 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Zombie::StaticClass(), UDailyRoutine_Zombie());
		SpawnAIAgent(USpawnAIAgentDefinition_Zombie::StaticClass(), UDailyRoutine_Zombie());
	}
};

class UWP_ST_ZOMBIE_SPAWN_02 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Zombie::StaticClass(), UDailyRoutine_Zombie());
		SpawnAIAgent(USpawnAIAgentDefinition_Zombie::StaticClass(), UDailyRoutine_Zombie());
	}
};

class UWP_ST_ZOMBIE_SPAWN_03 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Zombie::StaticClass(), UDailyRoutine_Zombie());
		SpawnAIAgent(USpawnAIAgentDefinition_Zombie::StaticClass(), UDailyRoutine_Zombie());
		SpawnAIAgent(USpawnAIAgentDefinition_Zombie::StaticClass(), UDailyRoutine_Zombie());
		SpawnAIAgent(USpawnAIAgentDefinition_Zombie::StaticClass(), UDailyRoutine_Zombie());
	}
};

class UWP_ST_ZOMBIE_SPAWN_04 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Zombie::StaticClass(), UDailyRoutine_Zombie());
		SpawnAIAgent(USpawnAIAgentDefinition_Zombie::StaticClass(), UDailyRoutine_Zombie());
		SpawnAIAgent(USpawnAIAgentDefinition_Zombie::StaticClass(), UDailyRoutine_Zombie());
		SpawnAIAgent(USpawnAIAgentDefinition_Zombie::StaticClass(), UDailyRoutine_Zombie());
	}
};

class UWP_ST_ZOMBIE_SPAWN_05 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Zombie::StaticClass(), UDailyRoutine_Zombie());
		SpawnAIAgent(USpawnAIAgentDefinition_Zombie::StaticClass(), UDailyRoutine_Zombie());
	}
};

class UWP_ST_ZOMBIE_SPAWN_06 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Zombie::StaticClass(), UDailyRoutine_Zombie());
		SpawnAIAgent(USpawnAIAgentDefinition_Zombie::StaticClass(), UDailyRoutine_Zombie());
	}
};

//CASTLE RUINS
class UWP_EF_CR_BLOODHOUND_SPAWN_01 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Bloodhound::StaticClass());
	}
};

//ORC GRAVEYARD
class UWP_OG_BLOODHOUND_SPAWN_01 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Bloodhound::StaticClass());
	}
};

class UWP_OG_BITER_SPAWN_01 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Biter_OrcGraveyard::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_Biter_OrcGraveyard::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_Biter_OrcGraveyard::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_Biter_OrcGraveyard::StaticClass());
	}
};

//North East Forest
class UWP_NEF_WOLF_SPAWN_01 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Wolf::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_Wolf::StaticClass());
	}
};



class UWP_Focus_Raven_Nyras : UWorldPointScript
{
	UFUNCTION()
    void OnWorldStart()
    {
        SpawnWarningFlock(URavenNyrasFocusAreaCornice_AmbientLife_Config::StaticClass(),1, 120.0f, 5.0f);
    }
};

class UWP_Focus_Raven_Harpies : UWorldPointScript
{
	UFUNCTION()
    void OnWorldStart()
    {
        SpawnWarningFlock(URavenHarpiesFocusAreaCornice_AmbientLife_Config::StaticClass(),1, 60.0f, 5.0f);
    }
};

