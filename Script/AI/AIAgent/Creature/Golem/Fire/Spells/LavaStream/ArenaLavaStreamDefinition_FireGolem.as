UCLASS()
class UArenaLavaStreamDefinition_FireGolem : UGothicBaseConfig
{
    UPROPERTY()
    TArray<float> m_LavaStreamHealthPercentage;

    // default m_LavaStreamHealthPercentage.Add(0.9f);
    // default m_LavaStreamHealthPercentage.Add(0.8f);
    // default m_LavaStreamHealthPercentage.Add(0.7f);
    // default m_LavaStreamHealthPercentage.Add(0.6f);
    // default m_LavaStreamHealthPercentage.Add(0.5f);

    default m_LavaStreamHealthPercentage.Add(0.9f);
    default m_LavaStreamHealthPercentage.Add(0.7f);
    default m_LavaStreamHealthPercentage.Add(0.6f);
    default m_LavaStreamHealthPercentage.Add(0.4f);
    default m_LavaStreamHealthPercentage.Add(0.3f);


    UPROPERTY()
    float m_SearchRadius = 3000.f;
}