class UWP_OG_ORCSCOUT_SPAWN_01 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_OW_OSC_OrcScoutM02_2099::StaticClass(), UDailyRoutine_Orc_Peasant(2000.0f, UAIState_Orc_Living()));
		SpawnAIAgent(USpawnAIAgentDefinition_OW_OSC_OrcScoutM03_2100::StaticClass(), UDailyRoutine_Orc_Peasant(2000.0f, UAIState_Orc_Living()));
	}
};

class UWP_OG_ORCSCOUT_SPAWN_02 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_OW_OSC_OrcScoutM04_2101::StaticClass(), UDailyRoutine_Orc_Peasant(1500.0f, UAIState_Orc_Living()));
		SpawnAIAgent(USpawnAIAgentDefinition_OW_OSC_OrcScoutM05_2102::StaticClass(), UDailyRoutine_Orc_Peasant(1500.0f, UAIState_Orc_Living()));
		SpawnAIAgent(USpawnAIAgentDefinition_OW_OSC_OrcScoutM06_2103::StaticClass(), UDailyRoutine_Orc_Peasant(1500.0f, UAIState_Orc_Living()));
	}
};

class UWP_OG_ORCSCOUT_SPAWN_03 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_OW_OSC_OrcScoutM07_2104::StaticClass(), UDailyRoutine_Orc_Peasant(1500.0f, UAIState_Orc_Living()));
		SpawnAIAgent(USpawnAIAgentDefinition_OW_OSC_OrcScoutM08_2105::StaticClass(), UDailyRoutine_Orc_Peasant(1500.0f, UAIState_Orc_Living()));
		SpawnAIAgent(USpawnAIAgentDefinition_OW_OSC_OrcScoutM09_2106::StaticClass(), UDailyRoutine_Orc_Peasant(1500.0f, UAIState_Orc_Living()));
	}
};

class UWP_OG_ORCSCOUT_SPAWN_04 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_OW_OSC_OrcScoutM10_2107::StaticClass(), UDailyRoutine_Orc_Peasant(1500.0f, UAIState_Orc_Living()));
		SpawnAIAgent(USpawnAIAgentDefinition_OW_OSC_OrcScoutM11_2108::StaticClass(), UDailyRoutine_Orc_Peasant(1500.0f, UAIState_Orc_Living()));
		SpawnAIAgent(USpawnAIAgentDefinition_OW_OSC_OrcScoutM12_2109::StaticClass(), UDailyRoutine_Orc_Peasant(1500.0f, UAIState_Orc_Living()));
		SpawnAIAgent(USpawnAIAgentDefinition_OW_OWR_OrcWarriorM29_2110::StaticClass(), UDailyRoutine_Orc_Guard());
	}
};

class UWP_OG_ORCSCOUT_SPAWN_05 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_OW_OSC_OrcScoutM13_2111::StaticClass(), UDailyRoutine_Orc_Peasant(800.0f, UAIState_Orc_Living()));
	}
};

class UWP_OG_ORCSCOUT_SPAWN_06 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_OW_OSC_OrcScoutM15_2113::StaticClass(), UDailyRoutine_Orc_Peasant(1000.0f, UAIState_Orc_Living()));
		SpawnAIAgent(USpawnAIAgentDefinition_OW_OSC_OrcScoutM16_2114::StaticClass(), UDailyRoutine_Orc_Peasant(1000.0f, UAIState_Orc_Living()));
		SpawnAIAgent(USpawnAIAgentDefinition_OW_OSC_OrcScoutM17_2115::StaticClass(), UDailyRoutine_Orc_Peasant(1000.0f, UAIState_Orc_Living()));
		SpawnAIAgent(USpawnAIAgentDefinition_OW_OSC_OrcScoutM18_2116::StaticClass(), UDailyRoutine_Orc_Peasant(1000.0f, UAIState_Orc_Living()));

	}
};

class UWP_OG_ORCSCOUT_SPAWN_07 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_OW_OSC_OrcScoutM19_2117::StaticClass(), UDailyRoutine_Orc_Peasant(800.0f, UAIState_Orc_Living()));
		SpawnAIAgent(USpawnAIAgentDefinition_OW_OSC_OrcScoutM20_2118::StaticClass(), UDailyRoutine_Orc_Peasant(800.0f, UAIState_Orc_Living()));
	}
};

class UWorldPointActor_BaalLukor_1211 : UWorldPointScript
{
     UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_OG_GUR_BaalLukor_1211::StaticClass());
    }
};