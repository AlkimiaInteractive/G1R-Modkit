UCLASS()
class UGenericHealthMonitorConfig : UGothicBaseConfig
{    
    UPROPERTY()
    TArray<float> m_HealthPercentageThresholds;

    //@DE - Max percentage of damage in [0-1] range meaining 0 = 0% and 1 = 100%
    UPROPERTY()
    float m_MaxDamageOnPercentage = 0.f;


}
