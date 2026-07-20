class UMCQueenDamageLimiterComponent : UPercentageDamageLimiterComponent
{
    default m_HealthConfigDefClass = UMCQueenHealthMonitorConfig::StaticClass();
}

class UMCBossDamageLimiterComponent : UPercentageDamageLimiterComponent
{
    default m_HealthConfigDefClass = UMCBossHealthMonitorConfig::StaticClass();
}

class UMCBossDamageLimiterComponentEGolems : UPercentageDamageLimiterComponent
{
    default m_HealthConfigDefClass = UMCBossHealthMonitorConfigEGolems::StaticClass();
}