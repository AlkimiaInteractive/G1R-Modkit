
// EAST FOREST

class UWP_EF_FT_MOLERAT_SPAWN_01 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Molerat::StaticClass(),UDailyRoutine_Molerat_Base_Extended());
		SpawnAIAgent(USpawnAIAgentDefinition_Molerat::StaticClass(),UDailyRoutine_Molerat_Base_Extended());
	}
};

class UWP_EF_FT_MOLERAT_SPAWN_01_CH2 : UWorldPointScript
{
	UFUNCTION()
	void OnChapterRespawn()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Molerat::StaticClass(),UDailyRoutine_Molerat_Base_Extended());
	}
};

class UWP_EF_FT_BLOODFLY_01 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Bloodfly::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_Bloodfly::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_Bloodfly::StaticClass());
	}
};

class UWP_EF_FT_BLOODFLY_01_CH2 : UWorldPointScript
{
	UFUNCTION()
	void OnChapterRespawn()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Bloodfly::StaticClass());
	}
};

class UWP_EF_ORC_DOG_SPAWN_01 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_OrcDog::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_OrcDog::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_OrcDog::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_OrcDog::StaticClass());
	}
};

class UWP_EF_ORC_DOG_SPAWN_01_CH2 : UWorldPointScript
{
	UFUNCTION()
	void OnChapterRespawn()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_OrcDog::StaticClass());
	}
};

class UWP_EF_BLOODFLY_SPAWN_04 : UWorldPointScript
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

class UWP_EF_BLOODFLY_SPAWN_04_CH2 : UWorldPointScript
{
	UFUNCTION()
	void OnChapterRespawn()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Bloodfly::StaticClass(), UDailyRoutine_Bloodfly_Short());
		SpawnAIAgent(USpawnAIAgentDefinition_Bloodfly::StaticClass(), UDailyRoutine_Bloodfly_Short());
	}
};

class UWP_EF_WOLF_SPAWN_07 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Wolf::StaticClass(), UDailyRoutine_Wolf_Base(700));
		SpawnAIAgent(USpawnAIAgentDefinition_Wolf::StaticClass(), UDailyRoutine_Wolf_Base(700));
		SpawnAIAgent(USpawnAIAgentDefinition_Wolf::StaticClass(), UDailyRoutine_Wolf_Base(700));
	}
};

class UWP_EF_WOLF_SPAWN_07_CH2 : UWorldPointScript
{
	UFUNCTION()
	void OnChapterRespawn()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Wolf::StaticClass(), UDailyRoutine_Wolf_Base(700));
		SpawnAIAgent(USpawnAIAgentDefinition_Wolf::StaticClass(), UDailyRoutine_Wolf_Base(700));
	}
};

class UWP_EF_WOLF_SPAWN_08 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Wolf::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_Wolf::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_Wolf::StaticClass());
	}
};

class UWP_EF_WOLF_SPAWN_08_CH2 : UWorldPointScript
{
	UFUNCTION()
	void OnChapterRespawn()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Wolf::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_Wolf::StaticClass());
	}
};

class UWP_EF_WOLF_SPAWN_09 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Wolf::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_Wolf::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_Wolf::StaticClass());
	}
};

class UWP_EF_WOLF_SPAWN_09_CH2 : UWorldPointScript
{
	UFUNCTION()
	void OnChapterRespawn()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Wolf::StaticClass());
	}
};

class UWP_EF_SCAVENGER_SPAWN_12 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_ScavengerAdult::StaticClass());
	}
};

class UWP_EF_SCAVENGER_SPAWN_12_CH2 : UWorldPointScript
{
	UFUNCTION()
	void OnChapterRespawn()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_ScavengerAdult::StaticClass());
	}
};

class UWP_EF_SCAVENGER_SPAWN_13 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_ScavengerAdult::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_ScavengerAdult::StaticClass());
	}
};

class UWP_EF_SCAVENGER_SPAWN_13_CH2 : UWorldPointScript
{
	UFUNCTION()
	void OnChapterRespawn()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_ScavengerAdult::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_ScavengerAdult::StaticClass());
	}
};


// RUINED MONASTERY

class UWP_MR_CANYON_SNAPPER_SPAWN_01 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Snapper::StaticClass(),UDailyRoutine_Snapper(1000));
		SpawnAIAgent(USpawnAIAgentDefinition_Snapper::StaticClass(),UDailyRoutine_Snapper(1000));
		SpawnAIAgent(USpawnAIAgentDefinition_Snapper::StaticClass(),UDailyRoutine_Snapper(1000));
		SpawnAIAgent(USpawnAIAgentDefinition_Snapper::StaticClass(),UDailyRoutine_Snapper(1000));
	}
};

class UWP_MR_CANYON_SNAPPER_SPAWN_02 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Snapper::StaticClass(),UDailyRoutine_Snapper(1000));
		SpawnAIAgent(USpawnAIAgentDefinition_Snapper::StaticClass(),UDailyRoutine_Snapper(1000));
	}
};

//SHIPWRECK

class UWP_SW_LIZARDFIRE_SPAWN_01 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_LizardFire::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_LizardFire::StaticClass());
	}
};

class UWP_SW_LIZARDFIRE_SPAWN_02 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_LizardFire::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_LizardFire::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_LizardFire::StaticClass());
	}
};

//FOGTOWER

class UWP_FT_MEATBUG_SPAWN_01 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Meatbug::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_Meatbug::StaticClass());
	}
};

class UWP_FT_SKELETON_SPAWNER_01 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Skeleton::StaticClass(),UDailyRoutine_Skeleton(200));
	}
};

class UWP_FT_SKELETON_SPAWNER_02 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Skeleton::StaticClass());
	}
};

class UWP_FT_SKELETON_SPAWNER_03 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Skeleton::StaticClass());
	}
};

class UWP_FT_SKELETON_SPAWNER_04 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Skeleton::StaticClass());
	}
};

class UWP_FT_SKELETON_SPAWNER_05 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Skeleton::StaticClass());
	}
};

class UWP_FT_SKELETON_SPAWNER_06 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Skeleton::StaticClass());
	}
};

class UWP_FT_SKELETON_SPAWNER_07 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Skeleton::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_Skeleton::StaticClass());
	}
};

class UWP_FT_SKELETON_SPAWNER_08 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Skeleton::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_Skeleton::StaticClass());
	}
};

class UWP_FT_SKELETON_SPAWNER_09 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Skeleton::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_Skeleton::StaticClass());
	}
};

class UWP_FT_SKELETON_SPAWNER_10 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Skeleton::StaticClass(),UDailyRoutine_Skeleton(600));
		SpawnAIAgent(USpawnAIAgentDefinition_Skeleton::StaticClass(),UDailyRoutine_Skeleton(600));
	}
};

class UWP_FT_SKMCHAMBER_SKELETON_SPAWNER_01 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Skeleton::StaticClass());
	}
};

class UWP_FT_SKMCHAMBER_SKELETON_SPAWNER_02 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Skeleton::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_Skeleton::StaticClass());
	}
};

class UWP_FT_SKMCHAMBER_SKELETON_SPAWNER_03 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Skeleton::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_Skeleton::StaticClass());
	}
};

class UWP_FT_SKMCHAMBER_SKELETON_SPAWNER_04 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Skeleton::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_Skeleton::StaticClass());
	}
};

class UWP_FT_SKMCHAMBER_SKELETONMAGE_SPAWNER : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_SkeletonMage4::StaticClass());
	}
};

class UWP_FT_SKMCHAMBER_SKELETON_SPAWNER_05 : UWorldPointScript
{
	UFUNCTION()
	void OnChromaninRead()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_SH_Skeleton::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_SH_Skeleton::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_SH_Skeleton::StaticClass());
	}
};



//ANCIENT MONASTERY

class UWP_MR_OUTSIDE_SNAPPER_01 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Snapper::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_Snapper::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_Snapper::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_Snapper::StaticClass());
	}
};

class UWP_MR_OUTSIDE_SNAPPER_02 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Snapper::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_Snapper::StaticClass());
	}
};

class UWP_MR_OUTSIDE_SNAPPER_03 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Snapper::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_Snapper::StaticClass());
	}
};

class UWP_MR_CLOISTER_SNAPPER_01 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Snapper::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_Snapper::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_Snapper::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_Snapper::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_Snapper::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_Snapper::StaticClass(), dailyRoutine = UDailyRoutine_Snapper_Eat());
	}
};

class UWP_MR_CLOISTER_SNAPPER_02 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Snapper::StaticClass());
	}
};

class UWP_MR_ENTRANCE_MEATBUG_01 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Meatbug::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_Meatbug::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_Meatbug::StaticClass());
	}
};

class UWP_MR_CAVE_SNAPPER_01 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Snapper::StaticClass(),UDailyRoutine_Snapper_Cave(1700));
	}
};

class UWP_MR_CAVE_SNAPPER_02 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Snapper::StaticClass(),UDailyRoutine_Snapper(1000));
		SpawnAIAgent(USpawnAIAgentDefinition_Snapper::StaticClass(),UDailyRoutine_Snapper(1200));
		SpawnAIAgent(USpawnAIAgentDefinition_Snapper::StaticClass(),UDailyRoutine_Snapper(1200));
		SpawnAIAgent(USpawnAIAgentDefinition_Snapper::StaticClass(),UDailyRoutine_Snapper(1200));
	}
};

class UWP_MR_FOCUS_CAVE_SHADOWBEAST_01 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_ShadowBeast::StaticClass());
	}
};



class UWP_MR_OUTSIDE_LIZARD_01 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Lizard::StaticClass());
	}
};

class UWP_MR_OUTSIDE_LIZARD_01_CH2 : UWorldPointScript
{
	UFUNCTION()
	void OnChapterRespawn()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Lizard::StaticClass());
	}
};

//STORY

class UWP_RUINMONASTERY_TROLL : UWorldPointScript
{
	UFUNCTION()
	void SpawnMonstersRuinSucceess()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_AM_JuvenileTroll_01::StaticClass(), UDailyRoutine_Troll_Base());
	}
};


// NORTHEAST FOREST

class UWP_NEF_SCAVENGER_SPAWN_01 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_ScavengerAdult::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_ScavengerAdult::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_ScavengerAdult::StaticClass());
	}
};

class UWP_NEF_SCAVENGER_SPAWN_02 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_ScavengerAdult::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_ScavengerAdult::StaticClass());
	}
};

class UWP_NEF_SCAVENGER_SPAWN_03 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_ScavengerAdult::StaticClass());
	}
};

class UWP_NEF_SCAVENGER_SPAWN_03_CH2 : UWorldPointScript
{
	UFUNCTION()
	void OnChapterRespawn()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_ScavengerAdult::StaticClass());
	}
};

class UWP_NEF_MOLERAT_01 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Molerat::StaticClass(), UDailyRoutine_Molerat_Base(1000));
	}
};

class UWP_NEF_MOLERAT_01_CH2 : UWorldPointScript
{
	UFUNCTION()
	void OnChapterRespawn()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Molerat::StaticClass(), UDailyRoutine_Molerat_Base(1000));
	}
};

class UWP_NEF_MOLERAT_02 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Molerat::StaticClass(), UDailyRoutine_Molerat_Base(1000));
		SpawnAIAgent(USpawnAIAgentDefinition_Molerat::StaticClass(), UDailyRoutine_Molerat_Base(1000));
	}
};

class UWP_NEF_MOLERAT_02_CH2 : UWorldPointScript
{
	UFUNCTION()
	void OnChapterRespawn()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Molerat::StaticClass(), UDailyRoutine_Molerat_Base(1000));
	}
};



class UWP_NEF_WOLF_SPAWN_02 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Wolf::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_Wolf::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_Wolf::StaticClass());
	}
};

class UWP_NEF_WOLF_SPAWN_03 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Wolf::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_Wolf::StaticClass());
	}
};

class UNEF_LURKER_SPAWN_01 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Lurker::StaticClass());
	}
};

class UNEF_LURKER_SPAWN_01_CH2 : UWorldPointScript
{
	UFUNCTION()
	void OnChapterRespawn()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Lurker::StaticClass());
	}
};


class UNEF_LURKER_SPAWN_02 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Lurker::StaticClass());
	}
};

class UNEF_LURKER_SPAWN_02_CH2 : UWorldPointScript
{
	UFUNCTION()
	void OnChapterRespawn()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Lurker::StaticClass());
	}
};

class UNEF_LURKER_SPAWN_03 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Lurker::StaticClass());
	}
};

class UNEF_SNAPPER_SPAWN_01 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Snapper::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_Snapper::StaticClass());
	}
};

class UNEF_SNAPPER_SPAWN_01_CH2 : UWorldPointScript
{
	UFUNCTION()
	void OnChapterRespawn()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Snapper::StaticClass());
	}
};

class UWP_NEF_BLOODFLY_01 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Bloodfly::StaticClass(), UDailyRoutine_Bloodfly_Short());
		SpawnAIAgent(USpawnAIAgentDefinition_Bloodfly::StaticClass(), UDailyRoutine_Bloodfly_Short());
		SpawnAIAgent(USpawnAIAgentDefinition_Bloodfly::StaticClass(), UDailyRoutine_Bloodfly_Short());
	}
};



class UWP_Focus_Raven_Monastery : UWorldPointScript
{
	UFUNCTION()
    void OnWorldStart()
    {
        SpawnWarningFlock(URavenMonasteryFocusAreaCornice_AmbientLife_Config::StaticClass(),1, 190.0f, 5.0f);
    }
};



