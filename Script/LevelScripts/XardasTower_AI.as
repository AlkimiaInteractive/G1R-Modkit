class UOW_XT_DEMON_LESSER_SPAWN_WP : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_XT_XardasDemon::StaticClass());
	}
};

class UWP_WarningFlock_XT_01 : UWorldPointScript
{
	UFUNCTION()
    void OnWorldStart()
    {
        SpawnWarningFlock(UCrowWarningAreaMid_AmbientLife_Config::StaticClass(),4, 80.0f, 7.0f);
    }
};

class UWP_WarningFlock_XT_02 : UWorldPointScript
{
	UFUNCTION()
    void OnWorldStart()
    {
        SpawnWarningFlock(UCrowWarningArea_AmbientLife_Config::StaticClass(),3, 150.0f, 2.0f);
    }
};

class UXT_Skeleton_SPAWN_WP : UWorldPointScript
{
	UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_Skeleton_XardasServant::StaticClass(), UDailyRoutine_Skeleton_Servant());
    }
};