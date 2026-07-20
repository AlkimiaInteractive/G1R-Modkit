UCLASS()
class UMCQueenHealthMonitorConfig : UGenericHealthMonitorConfig
{    
 
    default m_HealthPercentageThresholds.Add(0.500f);

    //default m_MaxDamageOnPercentage = 0.101;
    default m_MaxDamageOnPercentage = 0.501;
}

UCLASS()
class UMCBossHealthMonitorConfig : UGenericHealthMonitorConfig
{    
    //default m_MaxDamageOnPercentage = 0.101;
    default m_MaxDamageOnPercentage = 1.000;
}

UCLASS()
class UMCBossHealthMonitorConfigEGolems : UGenericHealthMonitorConfig
{    
    //default m_MaxDamageOnPercentage = 0.25;
    default m_MaxDamageOnPercentage = 1.000;
}
