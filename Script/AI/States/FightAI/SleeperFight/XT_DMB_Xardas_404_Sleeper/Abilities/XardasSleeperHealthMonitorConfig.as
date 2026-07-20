UCLASS()
class UXardasSleeperHealthMonitorConfig : UGenericHealthMonitorConfig
{    
 
    default m_HealthPercentageThresholds.Add(0.666f);
    default m_HealthPercentageThresholds.Add(0.333f);

    default m_MaxDamageOnPercentage = 0.334;
}
