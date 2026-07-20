/// ABANDONED MINE

// AM Creatures WP

class UWP_AM_ENTRANCE_MEATBUG_SPAWN_01 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Meatbug::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_Meatbug::StaticClass());
	}
};

class UWP_AM_CORRIDOR_MINECRAWLERMINI_SPAWN_01 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Minecrawler_Nymph::StaticClass(), UDailyRoutine_Minecrawler(1500.0f));
	}
};

class UWP_AM_HUB_MINECRAWLERMINI_SPAWN_01 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Minecrawler_Nymph::StaticClass(), UDailyRoutine_Minecrawler(1500.0f));
		SpawnAIAgent(USpawnAIAgentDefinition_Minecrawler_Nymph::StaticClass(), UDailyRoutine_Minecrawler(1500.0f));
		SpawnAIAgent(USpawnAIAgentDefinition_Minecrawler_Nymph::StaticClass(), UDailyRoutine_Minecrawler(1500.0f));
	}
};

class UWP_AM_MOLERAT_SPAWN_01 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Molerat::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_Molerat::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_Molerat::StaticClass());
	}
};

class UWP_AM_MOLERATMOM_SPAWN_01 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_BigMolerat::StaticClass());
	}
};

class UWP_AM_UNDEADORC_SPAWN_01 : UWorldPointScript
{
	UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_AM_UOW_UndeadOrcTempleGuard01_3032::StaticClass(), UDailyRoutine_Orc_Trance_Miniboss());
    }
};



/// EXCHANGE ZONE

// EZ NPCs WP

class UWP_INTRO_FALL3 : UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_OC_STT_Diego::StaticClass());
    }
};

class UWP_EZ_START_DIEGO_SPAWN : UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_OC_STT_Diego::StaticClass());
	}
};

class UWP_EZ_OUTPOST_GUARD30_282N_SPAWN : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_OC_GRD_Guard30_282N::StaticClass());
	}
};

class UWP_EZ_OUTPOST_GUARD40_292N_SPAWN : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_OC_GRD_Guard40_292N::StaticClass());
	}
};

class UWP_OC_GUARD41_293N_SPAWN : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_OC_GRD_Guard41_293N::StaticClass());
	}
};

class UWP_EZ_GATE_GATEGUARD30_281N_SPAWN : UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_OC_GRD_Guard30_281N::StaticClass());
	}
};

class UWP_EZ_GATE_ORRY_SPAWN : UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_OC_GRD_Orry_254::StaticClass());
	}
};

// EZ Creatures WP

class UWP_EZ_BRIDGE_MOLERAT_SPAWN_01 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Molerat::StaticClass()); //REMOVED FOR DEMO
	}
};

class UWP_EZ_GATE_MEATBUG_SPAWN_01 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Meatbug::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_Meatbug::StaticClass());
	}
};

class UWP_EZ_HANGEDMAN_SCAVENGER_SPAWN_01 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_ScavengerYoung::StaticClass()); // removed for demo
	}
};

class UWP_EZ_HANGEDMAN_SCAVENGER_SPAWN_02 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_ScavengerYoung::StaticClass()); // removed for demo
	}
};

class UWP_EZ_PASTURE_GOBLINGREEN_SPAWN_01 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Goblin_Green_Club::StaticClass());
	}
};

class UWP_EZ_PASTURE_MOLERAT_SPAWN_01 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Molerat::StaticClass(), UDailyRoutine_Molerat_Base(2000.0f));
		SpawnAIAgent(USpawnAIAgentDefinition_Molerat::StaticClass(), UDailyRoutine_Molerat_Base(2000.0f));
	}
};

class UWP_EZ_PASTURE_SCAVENGER_SPAWN_01 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_ScavengerYoung::StaticClass()); // removed for demo
	}
};

class UWP_EZ_PASTURE_SCAVENGER_SPAWN_02 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_ScavengerYoung::StaticClass()); // removed for demo
	}
};

// EZ Warning Flocks WP

class UWP_WarningFlock_EZ_01 : UWorldPointScript
{
	UFUNCTION()
    void OnWorldStart()
    {
        SpawnWarningFlock(UPidgeonWarning_AmbientLife_Config::StaticClass(),8, 250.0f, 5.0f);
    }
};

class UWP_WarningFlock_EZ_02 : UWorldPointScript
{
	UFUNCTION()
    void OnWorldStart()
    {
        SpawnWarningFlock(UPidgeonWarningMid_AmbientLife_Config::StaticClass(),6, 270.0f);
    }
};

class UWP_AreaFlock_EZ_01 : UWorldPointScript
{
	UFUNCTION()
    void OnWorldStart()
    {
        SpawnAreaFlock(UPidgeonAreaSmall_AmbientLife_Config::StaticClass(),2);
    }
};

class UWP_WarningFlock_EZ_03 : UWorldPointScript
{
	UFUNCTION()
    void OnWorldStart()
    {
        SpawnWarningFlock(UPidgeonWarningFar_AmbientLife_Config::StaticClass(),5, 180);
    }
};

class UWP_WarningFlock_EZ_04 : UWorldPointScript
{
	UFUNCTION()
    void OnWorldStart()
    {
        SpawnWarningFlock(UPidgeonWarningFar_AmbientLife_Config::StaticClass(),3, 260);
    }
};

/// EXCHANGE FOREST

// ExF NPCs WP

class UWP_ExF_RATFORD_SPAWN : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_NC_ORG_Ratford_818::StaticClass());
	}
};

class UWorldPointActor_Drax : UWorldPointScript
{
	 UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_NC_ORG_Drax_819::StaticClass());
    }
};

class UOW_Spawnpoint_BridgeGuard01_275 : UWorldPointScript
{
	 UFUNCTION()
    void OnWorldStart()
    {
         SpawnAIAgent(USpawnAIAgentDefinition_OC_GRD_BridgeGuard01_275::StaticClass());
    }
};

class UOW_Spawnpoint_BridgeGuard02_276 : UWorldPointScript
{
	 UFUNCTION()
    void OnWorldStart()
    {
         SpawnAIAgent(USpawnAIAgentDefinition_OC_GRD_BridgeGuard02_276::StaticClass());
    }
};

// ExF Creatures WP

class UWP_ExF_SURROUNDINGS1_SCAVENGER_SPAWN_01: UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_ScavengerMedium::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_ScavengerMedium::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_ScavengerMedium::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_ScavengerMedium::StaticClass());
	}
};

class UWP_ExF_SURROUNDINGS2_SCAVENGER_SPAWN_01 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_ScavengerMedium::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_ScavengerMedium::StaticClass());
	}
};

class UWP_ExF_SURROUNDINGS2_SCAVENGER_SPAWN_01_CH2 : UWorldPointScript
{
	UFUNCTION()
	void OnChapterRespawn()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_ScavengerMedium::StaticClass());
	}
};

class UWP_ExF_SURROUNDINGS3_SCAVENGER_SPAWN_01 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_ScavengerMedium::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_ScavengerMedium::StaticClass());
	}
};

class UWP_ExF_SURROUNDINGS4_SCAVENGER_SPAWN_01 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_ScavengerMedium::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_ScavengerMedium::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_ScavengerMedium::StaticClass());
	}
};

class UWP_ExF_SURROUNDINGS5_SCAVENGER_SPAWN_01 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_ScavengerMedium::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_ScavengerMedium::StaticClass());
	}
};

class UWP_ExF_SURROUNDINGS5_SCAVENGER_SPAWN_01_CH2 : UWorldPointScript
{
	UFUNCTION()
	void OnChapterRespawn()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_ScavengerMedium::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_ScavengerMedium::StaticClass());
	}
};

class UWP_ExF_SURROUNDINGS6_SCAVENGER_SPAWN_01 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_ScavengerMedium::StaticClass());
	}
};

class UWP_ExF_SURROUNDINGS7_SCAVENGER_SPAWN_01 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_ScavengerMedium::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_ScavengerMedium::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_ScavengerMedium::StaticClass());
	}
};

class UWP_ExF_SURROUNDINGS1_MOLERAT_SPAWN_01 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Molerat::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_Molerat::StaticClass());
	}
};

class UWP_ExF_SURROUNDINGS1_MOLERAT_SPAWN_01_CH2 : UWorldPointScript
{
	UFUNCTION()
	void OnChapterRespawn()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Molerat::StaticClass());
	}
};

class UWP_ExF_SURROUNDINGS2_MOLERAT_SPAWN_01 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Molerat::StaticClass());
	}
};

class UWP_ExF_CAVE_MOLERAT_SPAWN_01 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Molerat::StaticClass(), dailyRoutine = UDailyRoutine_Molerat_Drink());
		SpawnAIAgent(USpawnAIAgentDefinition_Molerat::StaticClass(), dailyRoutine = UDailyRoutine_Molerat_Drink());
		SpawnAIAgent(USpawnAIAgentDefinition_Molerat::StaticClass(), dailyRoutine = UDailyRoutine_Molerat_Drink());
	}
};

class UWP_ExF_CAVE_SNAPPER_SPAWN_01 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Snapper::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_Snapper::StaticClass());
	}
};

class UWP_ExF_HUT_SCAVENGER_SPAWN_01 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_ScavengerYoung::StaticClass(), UDailyRoutine_Scavenger(800.0f));
		SpawnAIAgent(USpawnAIAgentDefinition_ScavengerYoung::StaticClass(), UDailyRoutine_Scavenger(800.0f));
		SpawnAIAgent(USpawnAIAgentDefinition_ScavengerYoung::StaticClass(), UDailyRoutine_Scavenger(800.0f));
	}
};

class UWP_ExF_WATERFALL_GOBLINGREEN_SPAWN_01 : UWorldPointScript
{
	UFUNCTION()
    void OnWorldStart()
 	{
 		SpawnAIAgent(USpawnAIAgentDefinition_Goblin_Green_Sword::StaticClass(), UDailyRoutine_GoblinGreen(2000));
 		SpawnAIAgent(USpawnAIAgentDefinition_Goblin_Green_Sword::StaticClass(), UDailyRoutine_GoblinGreen(2000));
		SpawnAIAgent(USpawnAIAgentDefinition_Goblin_Green_Sword::StaticClass(), UDailyRoutine_GoblinGreen(2000));
 	}
};

class UWP_ExF_WATERFALL_GOBLINGREEN_SPAWN_01_CH2 : UWorldPointScript
{
	UFUNCTION()
    void OnWorldStart()
 	{
 		SpawnAIAgent(USpawnAIAgentDefinition_Goblin_Green_Sword::StaticClass(), UDailyRoutine_GoblinGreen(2000));
 		SpawnAIAgent(USpawnAIAgentDefinition_Goblin_Green_Sword::StaticClass(), UDailyRoutine_GoblinGreen(2000));
 	}
};

class UWP_ExF_CAVEPASSAGE_WOLF_SPAWN_01 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Wolf::StaticClass(), UDailyRoutine_Wolf_Base(1500.0f));
	}
};

class UWP_ExF_CAVEPASSAGE_MOLERAT_SPAWN_01 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Molerat::StaticClass());
	}
};

class UWP_ExF_CAVEPASSAGE_MOLERAT_SPAWN_01_CH2 : UWorldPointScript
{
	UFUNCTION()
	void OnChapterRespawn()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Molerat::StaticClass());
	}
};

class UWP_ExF_CAVEPASSAGE_MOLERAT_SPAWN_02 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Molerat::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_Molerat::StaticClass());
	}
};

class UWP_ExF_CAVEPASSAGE_MOLERAT_SPAWN_02_ADRAX : UWorldPointScript
{
	UFUNCTION()
	void SpawnMonstersAfterDrax()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Molerat::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_Molerat::StaticClass());
	}
};

class UWP_ExF_CAVEPASSAGE_MOLERAT_SPAWN_02_CH2 : UWorldPointScript
{
	UFUNCTION()
	void OnChapterRespawn()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Molerat::StaticClass());
	}
};

class UWP_ExF_RIVER_SCAVENGER_SPAWN_01 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_ScavengerYoung::StaticClass());
	}
};

class UWP_ExF_RIVER_SCAVENGER_SPAWN_02 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_ScavengerYoung::StaticClass());
	}
};

class USPAWN_OW_BLOODFLY_06_01_WP : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Bloodfly::StaticClass(), UDailyRoutine_Bloodfly_Short());
		SpawnAIAgent(USpawnAIAgentDefinition_Bloodfly::StaticClass(), UDailyRoutine_Bloodfly_Short());
		SpawnAIAgent(USpawnAIAgentDefinition_Bloodfly::StaticClass(), UDailyRoutine_Bloodfly_Short());
	}
};

class USPAWN_OW_BLOODFLY_06_01_WP_CH2 : UWorldPointScript
{
	UFUNCTION()
	void OnChapterRespawn()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Bloodfly::StaticClass(), UDailyRoutine_Bloodfly_Short());
		SpawnAIAgent(USpawnAIAgentDefinition_Bloodfly::StaticClass(), UDailyRoutine_Bloodfly_Short());
	}
};


class USPAWN_OW_BLOODFLY_C3_WP : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Bloodfly::StaticClass(), UDailyRoutine_Bloodfly_Short());
		SpawnAIAgent(USpawnAIAgentDefinition_Bloodfly::StaticClass(), UDailyRoutine_Bloodfly_Short());
	}
};

class USPAWN_OW_BLOODFLY_C3_CH2_WP : UWorldPointScript
{
	UFUNCTION()
	void OnChapterRespawn()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Bloodfly::StaticClass(), UDailyRoutine_Bloodfly_Short());
		SpawnAIAgent(USpawnAIAgentDefinition_Bloodfly::StaticClass(), UDailyRoutine_Bloodfly_Short());
		SpawnAIAgent(USpawnAIAgentDefinition_Bloodfly::StaticClass(), UDailyRoutine_Bloodfly_Short());
	}
};

class USPAWN_OW_BLOODFLY_WOOD05_01_WP : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Bloodfly::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_Bloodfly::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_Bloodfly::StaticClass());
	}
};

class USPAWN_OW_BLOODFLY_WOOD05_01_WP_CH2 : UWorldPointScript
{
	UFUNCTION()
	void OnChapterRespawn()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Bloodfly::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_Bloodfly::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_Bloodfly::StaticClass());
	}
};


class UWP_ExF_BURROW_WOLF_SPAWN_01 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Wolf::StaticClass(), UDailyRoutine_Wolf_Base(2000));
		SpawnAIAgent(USpawnAIAgentDefinition_Wolf::StaticClass(), UDailyRoutine_Wolf_Base(2000));
	}
};

class UWP_ExF_BURROW_WOLF_SPAWN_01_CH2 : UWorldPointScript
{
	UFUNCTION()
	void OnChapterRespawn()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Wolf::StaticClass(), UDailyRoutine_Wolf_Base(2000));
	}
};

/// BANDIT'S CAMP

//BC NPCs WP

class UWP_BC_TUNNEL_MEATBUG_SPAWN_01 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Meatbug::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_Meatbug::StaticClass());
	}
};

class UOC_Spawnpoint_Bandit_01 : UWorldPointScript
{
	 UFUNCTION()
    void OnWorldStart()
    {
         SpawnAIAgent(USpawnAIAgentDefinition_BC_BAN_Bandit_01::StaticClass());
    }
};

class UOC_Spawnpoint_Bandit_02 : UWorldPointScript
{
	 UFUNCTION()
    void OnWorldStart()
    {
         SpawnAIAgent(USpawnAIAgentDefinition_BC_BAN_Bandit_02::StaticClass());
    }
};

class UOC_Spawnpoint_Bandit_03 : UWorldPointScript
{
	 UFUNCTION()
    void OnWorldStart()
    {
         SpawnAIAgent(USpawnAIAgentDefinition_BC_BAN_Bandit_03::StaticClass());
    }
};

class UOC_Spawnpoint_Bandit_04 : UWorldPointScript
{
	 UFUNCTION()
    void OnWorldStart()
    {
         SpawnAIAgent(USpawnAIAgentDefinition_BC_BAN_Bandit_04::StaticClass());
    }
};

class UOC_Spawnpoint_Bandit_05 : UWorldPointScript
{
	 UFUNCTION()
    void OnWorldStart()
    {
         SpawnAIAgent(USpawnAIAgentDefinition_BC_BAN_Bandit_05::StaticClass());
    }
};

class UOC_Spawnpoint_Bandit_06 : UWorldPointScript
{
	 UFUNCTION()
    void OnWorldStart()
    {
         SpawnAIAgent(USpawnAIAgentDefinition_BC_BAN_Bandit_06::StaticClass());
    }
};

class UOC_Spawnpoint_Bandit_07 : UWorldPointScript
{
	 UFUNCTION()
    void OnWorldStart()
    {
         SpawnAIAgent(USpawnAIAgentDefinition_BC_BAN_Bandit_07::StaticClass());
    }
};

class UOC_Spawnpoint_Bandit_08 : UWorldPointScript
{
	 UFUNCTION()
    void OnWorldStart()
    {
         SpawnAIAgent(USpawnAIAgentDefinition_BC_BAN_Bandit_08::StaticClass());
    }
};

class UOC_Spawnpoint_Bandit_09 : UWorldPointScript
{
	 UFUNCTION()
    void OnWorldStart()
    {
         SpawnAIAgent(USpawnAIAgentDefinition_BC_BAN_Bandit_09::StaticClass());
    }
};

class UOC_Spawnpoint_Bandit_10 : UWorldPointScript
{
	 UFUNCTION()
    void OnWorldStart()
    {
         SpawnAIAgent(USpawnAIAgentDefinition_BC_BAN_Bandit_10::StaticClass());
    }
};

class UOC_Spawnpoint_Bandit_11 : UWorldPointScript
{
	 UFUNCTION()
    void OnWorldStart()
    {
         SpawnAIAgent(USpawnAIAgentDefinition_BC_BAN_Bandit_11::StaticClass());
    }
};

class UOC_Spawnpoint_Bandit_12 : UWorldPointScript
{
	 UFUNCTION()
    void OnWorldStart()
    {
         SpawnAIAgent(USpawnAIAgentDefinition_BC_BAN_Bandit_12::StaticClass());
    }
};

class UOC_Spawnpoint_Bandit_13 : UWorldPointScript
{
	 UFUNCTION()
    void OnWorldStart()
    {
         SpawnAIAgent(USpawnAIAgentDefinition_BC_BAN_Bandit_13::StaticClass());
    }
};

class UOC_Spawnpoint_Bandit_14 : UWorldPointScript
{
	 UFUNCTION()
    void OnWorldStart()
    {
         SpawnAIAgent(USpawnAIAgentDefinition_BC_BAN_Bandit_14::StaticClass());
    }
};

class UOC_Spawnpoint_Bandit_15 : UWorldPointScript
{
	 UFUNCTION()
    void OnWorldStart()
    {
         SpawnAIAgent(USpawnAIAgentDefinition_BC_BAN_Bandit_15::StaticClass());
    }
};

class UOC_Spawnpoint_Bandit_16 : UWorldPointScript
{
	 UFUNCTION()
    void OnWorldStart()
    {
         SpawnAIAgent(USpawnAIAgentDefinition_BC_BAN_Bandit_16::StaticClass());
    }
};

class UOC_Spawnpoint_Bandit_17 : UWorldPointScript
{
	 UFUNCTION()
    void OnWorldStart()
    {
         SpawnAIAgent(USpawnAIAgentDefinition_BC_BAN_Bandit_17::StaticClass());
    }
};

class UOC_Spawnpoint_Bandit_18 : UWorldPointScript
{
	 UFUNCTION()
    void OnWorldStart()
    {
         SpawnAIAgent(USpawnAIAgentDefinition_BC_BAN_Bandit_18::StaticClass());
    }
};

class UOC_Spawnpoint_Bandit_19 : UWorldPointScript
{
	 UFUNCTION()
    void OnWorldStart()
    {
         SpawnAIAgent(USpawnAIAgentDefinition_BC_BAN_Bandit_19::StaticClass());
    }
};

class UOC_Spawnpoint_Bandit_20 : UWorldPointScript
{
	 UFUNCTION()
    void OnWorldStart()
    {
         SpawnAIAgent(USpawnAIAgentDefinition_BC_BAN_Bandit_20::StaticClass());
    }
};

class UOC_Spawnpoint_Bandit_21 : UWorldPointScript
{
	 UFUNCTION()
    void OnWorldStart()
    {
         SpawnAIAgent(USpawnAIAgentDefinition_BC_BAN_Bandit_21::StaticClass());
    }
};

class UOC_Spawnpoint_Bandit_22 : UWorldPointScript
{
	 UFUNCTION()
    void OnWorldStart()
    {
         SpawnAIAgent(USpawnAIAgentDefinition_BC_BAN_Bandit_22::StaticClass());
    }
};

class UOC_Spawnpoint_Bandit_23 : UWorldPointScript
{
	 UFUNCTION()
    void OnWorldStart()
    {
         SpawnAIAgent(USpawnAIAgentDefinition_BC_BAN_Bandit_23::StaticClass());
    }
};

class UOC_Spawnpoint_Brannok_863 : UWorldPointScript
{
	 UFUNCTION()
    void OnWorldStart()
    {
         SpawnAIAgent(USpawnAIAgentDefinition_BC_BAN_Brannok_863::StaticClass());
    }
};

class UOC_Spawnpoint_Torik_864 : UWorldPointScript
{
	 UFUNCTION()
    void OnWorldStart()
    {
         SpawnAIAgent(USpawnAIAgentDefinition_BC_BAN_Torik_864::StaticClass());
    }
};

class UOC_Spawnpoint_Bandit_Quentin_858 : UWorldPointScript
{
	 UFUNCTION()
    void OnWorldStart()
    {
         SpawnAIAgent(USpawnAIAgentDefinition_BC_BAN_Quentin_858::StaticClass());
    }
};


class UWP_OC_PRISIONER_SPAWN: UWorldPointScript
{
    // UFUNCTION()
    // void OnPrisionerQuestStarted()
    // {
    //     SpawnAIAgent(USpawnAIAgentDefinition_BC_BAN_Arlin_852::StaticClass());
    // }
	 UFUNCTION()
    void OnWorldStart()
    {
         SpawnAIAgent(USpawnAIAgentDefinition_BC_BAN_Arlin_852::StaticClass());
    }
};

///TROLL CANYON

// TC NPCs WP



// TC Creatures WP

class UWP_TC_SNAPPER_SPAWN_01 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Snapper::StaticClass(),UDailyRoutine_Snapper(1000));
		SpawnAIAgent(USpawnAIAgentDefinition_Snapper::StaticClass(),UDailyRoutine_Snapper(1000));
		SpawnAIAgent(USpawnAIAgentDefinition_Snapper::StaticClass(),UDailyRoutine_Snapper(1000));
	}
};

class UWP_TC_SNAPPER_SPAWN_01_CH2 : UWorldPointScript
{
	UFUNCTION()
	void OnChapterRespawn()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Snapper::StaticClass(),UDailyRoutine_Snapper(1000));
		SpawnAIAgent(USpawnAIAgentDefinition_Snapper::StaticClass(),UDailyRoutine_Snapper(1000));
	}
};

class UWP_TC_SNAPPER_SPAWN_02 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Snapper::StaticClass(),UDailyRoutine_Snapper(1000));
		SpawnAIAgent(USpawnAIAgentDefinition_Snapper::StaticClass(),UDailyRoutine_Snapper(1000));
	}
};

class UWP_TC_SNAPPER_SPAWN_03 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Snapper::StaticClass(),UDailyRoutine_Snapper(1000));
		SpawnAIAgent(USpawnAIAgentDefinition_Snapper::StaticClass(),UDailyRoutine_Snapper(1000));
	}
};

class UWP_TC_GOBLINWARRIOR_SPAWN_01 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Goblin_Warrior::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_Goblin_Warrior::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_Goblin_Warrior::StaticClass());
	}
};

class UWP_TC_GOBLINWARRIOR_SPAWN_02 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Goblin_Warrior::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_Goblin_Warrior::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_Goblin_Warrior::StaticClass());
	}
};

class UWP_TC_GOBLINWARRIOR_SPAWN_03 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Goblin_Warrior::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_Goblin_Warrior::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_Goblin_Warrior::StaticClass());
	}
};

class UWP_TC_GOBLINWARRIOR_SPAWN_04 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Goblin_Warrior::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_Goblin_Warrior::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_Goblin_Warrior::StaticClass());
	}
};

class UWP_TC_HARPY_SPAWN_01 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Harpy::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_Harpy::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_Harpy::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_Harpy::StaticClass());
	}
};

class UWP_TC_TROLLADULT_SPAWN_01 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_TC_TrollAdult_01::StaticClass());
	}
};

///CAVALORN VALLEY

//CV NPCs WP

class UWP_CV_AIDAN_SPAWN : UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_UL_ORG_Aidan_859::StaticClass());
    }
};

class UWorldPointActor_Blackmailer : UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_UL_ORG_Blackmailer_888::StaticClass());
    }
};

class UWorldPointActor_CoBlackmailer : UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_UL_ORG_CoBlackmailer_889::StaticClass());
    }
};

class UWorldPointActor_Rogue01_1501 : UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_UL_ORG_Rogue01_1501::StaticClass());
    }
};

class UWorldPointActor_Rogue02_1502 : UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_UL_ORG_Rogue02_1502::StaticClass());
    }
};

class UWorldPointActor_Rogue03_1503 : UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_UL_ORG_Rogue03_1503::StaticClass());
    }
};

class UWorldPointActor_Rogue04_1504 : UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_UL_ORG_Rogue04_1504::StaticClass());
    }
};

class UWP_CV_CAVALORN_SPAWN : UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_UL_STT_Cavalorn_336::StaticClass());
    }
};

class UWorldPointActor_Cohsel_337 : UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_UL_STT_Cohsel_337::StaticClass());
    }
};

class UWP_UL_WOLF_COHSEL : UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_UL_Wolf_Cohsel::StaticClass(), UDailyRoutine_Wolf_Cohsel());
    }
};

class UWP_UL_SCAVENGER_RIDEABLE_COHSEL : UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_ScavengerAdult_Rideable_Cohsel::StaticClass(), UDailyRoutine_Scavenger_Rideable_Cohsel_Idle());
    }
};

//CV Creatures WP

class UWP_CV_ENTRY_SCAVENGER_SPAWN_01 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_ScavengerAdult::StaticClass());
	}
};

class UWP_CV_ENTRY_SCAVENGER_CH2_SPAWN_01 : UWorldPointScript
{
	UFUNCTION()
	void OnChapterRespawn()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_ScavengerAdult::StaticClass());
	}
};

class UWP_CV_AIDANCAMP_WOLF_SPAWN_01 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Wolf::StaticClass());
	}
};

class UWP_CV_AIDANCAMP_WOLF_SPAWN_02 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Wolf::StaticClass());
	}
};

class UWP_CV_AIDANCAMP_MOLERAT_SPAWN_03 : UWorldPointScript
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

class UWP_CV_CAVALORNHUT_GOBLINGREEN_SPAWN_01 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Goblin_Green_Sword::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_Goblin_Green_Sword::StaticClass());
	}
};

class UWP_CV_CAVALORNHUT_GOBLINGREEN_SPAWN_01_CH2 : UWorldPointScript
{
	UFUNCTION()
	void OnChapterRespawn()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Goblin_Green_Sword::StaticClass());
	}
};

class UWP_CV_CAVALORNHUT_MEATBUG_SPAWN_01 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Meatbug::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_Meatbug::StaticClass());
	}
};

class UWP_CV_CAVEBLACKGOBLIN_GOBLINBLACK_SPAWN_01 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Goblin_Black::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_Goblin_Black::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_Goblin_Black::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_Goblin_Black::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_Goblin_Black::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_Goblin_Black::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_Goblin_Black::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_Goblin_Black::StaticClass());
	}
};

class UWP_CV_CAVEBLACKGOBLIN_GOBLINBLACK_SPAWN_01_CH2 : UWorldPointScript
{
	UFUNCTION()
	void OnChapterRespawn()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Goblin_Black::StaticClass());
	}
};

class UWP_CV_CAVEBLACKGOBLIN_LIZARD_SPAWN_01 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Lizard::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_Lizard::StaticClass());
	}
};

class UWP_CV_CAVEBLACKGOBLIN_LIZARD_SPAWN_01_CH2 : UWorldPointScript
{
	UFUNCTION()
	void OnChapterRespawn()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Lizard::StaticClass());
	}
};

class UWP_CV_CAVEII_MOLERAT_SPAWN_01 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Molerat::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_Molerat::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_Molerat::StaticClass());
	}
};

class UWP_CV_CAVEII_SCAVENGER_SPAWN_01 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_ScavengerMedium::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_ScavengerMedium::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_ScavengerMedium::StaticClass());
	}
};

class UWP_CV_CAVEII_SCAVENGER_SPAWN_01_AMORDRAG : UWorldPointScript
{
	UFUNCTION()
	void SpawnMonstersAfterMordrag()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_ScavengerMedium::StaticClass());
	}
};

class UWP_CV_CAVEI_MOLERAT_SPAWN_01: UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Molerat::StaticClass(), );
		SpawnAIAgent(USpawnAIAgentDefinition_Molerat::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_Molerat::StaticClass());
	}
};

class UWP_CV_CAVEI_MOLERAT_SPAWN_01_CH2: UWorldPointScript
{
	UFUNCTION()
	void OnChapterRespawn()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Molerat::StaticClass(), );
		SpawnAIAgent(USpawnAIAgentDefinition_Molerat::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_Molerat::StaticClass());
	}
};

class UWP_CV_HANGEDTREE_WOLF_SPAWN_01 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Wolf::StaticClass(), UDailyRoutine_Wolf_Base(2000.0f));
		SpawnAIAgent(USpawnAIAgentDefinition_Wolf::StaticClass(), UDailyRoutine_Wolf_Base(2000.0f));
	}
};

class UWP_CV_HIDEOUT_GOBLINGREEN_SPAWN_01 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Goblin_Green_Sword::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_Goblin_Green_Sword::StaticClass());
	}
};

class UWP_CV_HIDEOUT_GOBLINGREEN_SPAWN_01_CH2 : UWorldPointScript
{
	UFUNCTION()
	void OnChapterRespawn()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Goblin_Green_Sword::StaticClass());
	}
};

class UWP_CV_HUNTERREFUGEE_SCAVENGER_SPAWN_01 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_ScavengerMedium::StaticClass());
	}
};

class UWP_CV_HUNTERREFUGEE_SCAVENGER_SPAWN_01_CH2 : UWorldPointScript
{
	UFUNCTION()
	void OnChapterRespawn()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_ScavengerMedium::StaticClass());
	}
};

class UWP_CV_HUNTERREFUGEE_WOLF_SPAWN_01 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Wolf::StaticClass(), UDailyRoutine_Wolf_Base(1700.0f));
	}
};

class UWP_CV_LAKEACCESS2_LIZARD_SPAWN_01: UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Lizard::StaticClass());
	}
};

class UWP_CV_LAKEACCESS2_LIZARD_SPAWN_01_CH2: UWorldPointScript
{
	UFUNCTION()
	void OnChapterRespawn()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Lizard::StaticClass());
	}
};

class UWP_CV_OLDMINEBRIDGE_SCAVENGER_SPAWN_01 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_ScavengerMedium::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_ScavengerMedium::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_ScavengerMedium::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_ScavengerMedium::StaticClass());
	}
};

class UWP_CV_OLDMINEBRIDGE_SCAVENGER_SPAWN_01_ADRAX : UWorldPointScript
{
	UFUNCTION()
	void SpawnMonstersAfterDrax()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_ScavengerMedium::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_ScavengerMedium::StaticClass());
	}
};

class UWP_CV_OLDMINEBRIDGE_SCAVENGER_SPAWN_01_CH2 : UWorldPointScript
{
	UFUNCTION()
	void OnChapterRespawn()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_ScavengerMedium::StaticClass());
	}
};

class UWP_CV_RIVER_LURKER_SPAWN_01 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Lurker::StaticClass());
	}
};

class UWP_CV_RIVER_LURKER_SPAWN_01_CH2 : UWorldPointScript
{
	UFUNCTION()
	void OnChapterRespawn()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Lurker::StaticClass());
	}
};

class UWP_CV_RIVER_LURKER_SPAWN_02: UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Lurker::StaticClass(), UDailyRoutine_Lurker(2000.0f));
	}
};

class UWP_CV_SAWMILL_LIZARD_SPAWN_01 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Lizard::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_Lizard::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_Lizard::StaticClass());
	}
};

class UWP_CV_SAWMILL_LIZARD_SPAWN_01_CH2 : UWorldPointScript
{
	UFUNCTION()
	void OnChapterRespawn()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Lizard::StaticClass());
	}
};

class UWP_CV_SAWMILL_WOLF_SPAWN_01 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Wolf::StaticClass(), UDailyRoutine_Wolf_Base(2500.0f));
		SpawnAIAgent(USpawnAIAgentDefinition_Wolf::StaticClass(), UDailyRoutine_Wolf_Base(2500.0f));
		SpawnAIAgent(USpawnAIAgentDefinition_Wolf::StaticClass(), UDailyRoutine_Wolf_Base(2500.0f));
		SpawnAIAgent(USpawnAIAgentDefinition_Wolf::StaticClass(), UDailyRoutine_Wolf_Base(2500.0f));
	}
};

class UWP_CV_SAWMILL_WOLF_SPAWN_01_CH2 : UWorldPointScript
{
	UFUNCTION()
	void OnChapterRespawn()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Wolf::StaticClass(), UDailyRoutine_Wolf_Base(2500.0f));
	}
};

class UWP_CV_STASH_MOLERAT_SPAWN_01 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Molerat::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_Molerat::StaticClass());
	}
};

class UWP_CV_STASH_MOLERAT_SPAWN_01_CH2 : UWorldPointScript
{
	UFUNCTION()
	void OnChapterRespawn()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Molerat::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_Molerat::StaticClass());
	}
};

class USPAWN_OW_BLOODFLY_12_WP : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Bloodfly::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_Bloodfly::StaticClass());
	}
};

class USPAWN_OW_BLOODFLY_12_CH2_WP : UWorldPointScript
{
	UFUNCTION()
	void OnChapterRespawn()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Bloodfly::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_Bloodfly::StaticClass());
	}
};

class USPAWN_OW_BLOODFLYS_152_WP : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Bloodfly::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_Bloodfly::StaticClass());
	}
};

class USPAWN_OW_BLOODFLYS_152_WP_CH2 : UWorldPointScript
{
	UFUNCTION()
	void OnChapterRespawn()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Bloodfly::StaticClass());
	}
};

class UWP_Focus_Raven_TrollCanyon : UWorldPointScript
{
	UFUNCTION()
    void OnWorldStart()
    {
        SpawnWarningFlock(URavenTrollCanyonFocusAreaCornice_AmbientLife_Config::StaticClass(),1, 240.0f, 5.0f);
    }
};


class UWP_Focus_Raven_Amulet : UWorldPointScript
{
	UFUNCTION()
    void OnWorldStart()
    {
        SpawnWarningFlock(URavenAmuletFocusAreaCornice_AmbientLife_Config::StaticClass(),1, 220.0f, 1.0f);
    }
};

class UWP_Begin_Game : UWorldPointScript
{
	UFUNCTION()
    void OnWorldStart()
    {
        SpawnWarningFlock(UExchangeBeginGame_AmbientLife_Config::StaticClass(),1, 320.0f, 5.0f);
    }
};