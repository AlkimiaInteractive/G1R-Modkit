// class UWorldPointActor_CorKalomDemon : UWorldPointScript
// {
//     UFUNCTION()
//     void OnWorldStart()
//     {
//         SpawnAIAgent(USpawnAIAgentDefinition_CorKalomDemon::StaticClass(),UDailyRoutine_Empty());
//     }
// };

class UWorldPointActor_DiegoSleeper : UWorldPointScript
{
    UFUNCTION()
    void SleeperTempleRegionTrait_Dream_Diego_Spawn()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_OC_STT_Diego_Sleeper::StaticClass(),UDailyRoutine_Empty.DefaultObject);
    }
};

class UWorldPointActor_GornSleeper : UWorldPointScript
{
    UFUNCTION()
    void SleeperTempleRegionTrait_Dream_Gorn_Spawn()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_NC_SLD_Gorn_699_Sleeper::StaticClass(),UDailyRoutine_Empty.DefaultObject);
    }
};

class UWorldPointActor_MiltenSleeper : UWorldPointScript
{
    UFUNCTION()
    void SleeperTempleRegionTrait_Dream_Milten_Spawn()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_Human_OC_KDF_Milten_Sleeper::StaticClass(),UDailyRoutine_Empty.DefaultObject);
    }
};

class UWorldPointActor_LesterSleeper : UWorldPointScript
{
    UFUNCTION()
    void SleeperTempleRegionTrait_Dream_Lester_Spawn()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_Human_SC_NOV_Lester_Sleeper::StaticClass(),UDailyRoutine_SC_NOV_Lester_Sleeper_Start.DefaultObject);
    }
};

class UWorldPointActor_Swampshark_LesterSleeper : UWorldPointScript
{
    UFUNCTION()
	void SleeperTempleRegionTrait_Dream_Lester_Spawn()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Swampshark_Sleeper::StaticClass(), dailyRoutine = UDailyRoutine_Swampshark_Sleeper.DefaultObject);
		SpawnAIAgent(USpawnAIAgentDefinition_Swampshark_Sleeper::StaticClass(), dailyRoutine = UDailyRoutine_Swampshark_Sleeper.DefaultObject);
        SpawnAIAgent(USpawnAIAgentDefinition_Swampshark_Sleeper::StaticClass(), dailyRoutine = UDailyRoutine_Swampshark_Sleeper.DefaultObject);
		SpawnAIAgent(USpawnAIAgentDefinition_Swampshark_Sleeper::StaticClass(), dailyRoutine = UDailyRoutine_Swampshark_Sleeper.DefaultObject);
        SpawnAIAgent(USpawnAIAgentDefinition_Swampshark_Sleeper::StaticClass(), dailyRoutine = UDailyRoutine_Swampshark_Sleeper.DefaultObject);
	}
}

class UWorldPointActor_Harpy_SleeperDream : UWorldPointScript
{
	UFUNCTION()
	void SleeperTempleRegionTrait_Dream_Harpies_Spawn()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Harpy_Sleeper::StaticClass(),UDailyRoutine_Empty.DefaultObject);
		SpawnAIAgent(USpawnAIAgentDefinition_Harpy_Sleeper::StaticClass(),UDailyRoutine_Empty.DefaultObject);
        SpawnAIAgent(USpawnAIAgentDefinition_Harpy_Sleeper::StaticClass(),UDailyRoutine_Empty.DefaultObject);
		SpawnAIAgent(USpawnAIAgentDefinition_Harpy_Sleeper::StaticClass(),UDailyRoutine_Empty.DefaultObject);
        SpawnAIAgent(USpawnAIAgentDefinition_Harpy_Sleeper::StaticClass(),UDailyRoutine_Empty.DefaultObject);
		SpawnAIAgent(USpawnAIAgentDefinition_Harpy_Sleeper::StaticClass(),UDailyRoutine_Empty.DefaultObject);
        // SpawnAIAgent(USpawnAIAgentDefinition_Harpy_Sleeper::StaticClass(),UDailyRoutine_Empty.DefaultObject);
	}
};

class UWorldPointActor_XardasSleeper : UWorldPointScript
{
    UFUNCTION()
    void SleeperTempleRegionTrait_Dream_Xardas_Spawn()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_Human_XT_DMB_Xardas_404_Sleeper::StaticClass(), UDailyRoutine_XT_DMB_Xardas_404_Sleeper_Start.DefaultObject);
    }
};

class UWorldPointActor_MCQueen_SleeperDream : UWorldPointScript
{
    UFUNCTION()
    void OldMIne_Dream_MCQueen_Battle_Activate()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_Minecrawler_QueenPh2_Sleeper::StaticClass(),UDailyRoutine_Empty.DefaultObject);
    }
};

// class UWorldPointActor_Swampshark03_LesterSleeper : UWorldPointScript
// {
//     UFUNCTION()
//     void OnWorldStart()
//     {
//         SpawnAIAgent(USpawnAIAgentDefinition_Swampshark_Sleeper::StaticClass());
//     }
// };

// class UWorldPointActor_Swampshark04_LesterSleeper : UWorldPointScript
// {
//     UFUNCTION()
//     void OnWorldStart()
//     {
//         SpawnAIAgent(USpawnAIAgentDefinition_Human_SC_NOV_Lester_Sleeper::StaticClass());
//     }
// };

// class UWorldPointActor_Swampshark05_LesterSleeper : UWorldPointScript
// {
//     UFUNCTION()
//     void OnWorldStart()
//     {
//         SpawnAIAgent(USpawnAIAgentDefinition_Human_SC_NOV_Lester_Sleeper::StaticClass());
//     }
// }

class UWorldPointActor_MudSleeper : UWorldPointScript
{
    UFUNCTION()
    void SleeperTempleRegionTrait_Dream_Mine_Spawn()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_ST_VLK_Mud_Sleeper::StaticClass(),UDailyRoutine_ST_VLK_Mud_Sleeper_Guide.DefaultObject);
    }
};

class UWorldPointActor_Minecrawler_MineDream : UWorldPointScript
{
    UFUNCTION()
    void SleeperTempleRegionTrait_Dream_Mine_Spawn()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_Minecrawler_Temple_Sleeper::StaticClass(),UDailyRoutine_Empty.DefaultObject);
        SpawnAIAgent(USpawnAIAgentDefinition_Minecrawler_Temple_Sleeper::StaticClass(),UDailyRoutine_Empty.DefaultObject);
    }
};