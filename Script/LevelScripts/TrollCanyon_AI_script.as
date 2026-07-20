class UWP_TC_WarningFlock_01 : UWorldPointScript
{
	UFUNCTION()
    void OnWorldStart()
    {
        SpawnWarningFlock(UCrowWarningAreaMid_AmbientLife_Config::StaticClass(),6, 250.0f, 5.0f);
    }
};

class UWP_TC_WarningFlock_02 : UWorldPointScript
{
	UFUNCTION()
    void OnWorldStart()
    {
        SpawnWarningFlock(UCrowWarningAreaMid_AmbientLife_Config::StaticClass(),5, 260.0f, 3.0f);
    }
};

class UWP_TC_AreaFlock_01 : UWorldPointScript
{
	UFUNCTION()
    void OnWorldStart()
    {
        SpawnAreaFlock(UCrowArea_AmbientLife_Config::StaticClass(),1);
    }
};

class UWP_TC_AreaFlock_02 : UWorldPointScript
{
	UFUNCTION()
    void OnWorldStart()
    {
        SpawnAreaFlock(UCrowArea_AmbientLife_Config::StaticClass(),2);
    }
};