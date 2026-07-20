UCLASS()
class UDiegoSleeperHealthMonitorConfig : UGenericHealthMonitorConfig
{    
 
    default m_HealthPercentageThresholds.Add(0.500f);

    //default m_MaxDamageOnPercentage = 0.101;
    default m_MaxDamageOnPercentage = 0.501;
}
