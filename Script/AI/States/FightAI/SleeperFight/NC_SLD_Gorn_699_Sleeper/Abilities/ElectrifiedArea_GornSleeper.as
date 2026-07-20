UCLASS()
class UElectrifiedArea_GornSleeper : UGothicBaseConfig
{
    UPROPERTY()
    TArray<float> m_ElectrifiedAreaHealthPercentage;

    // default m_LavaStreamHealthPercentage.Add(0.9f);
    // default m_LavaStreamHealthPercentage.Add(0.8f);
    // default m_LavaStreamHealthPercentage.Add(0.7f);
    // default m_LavaStreamHealthPercentage.Add(0.6f);
    // default m_LavaStreamHealthPercentage.Add(0.5f);

    default m_ElectrifiedAreaHealthPercentage.Add(0.9f);
    default m_ElectrifiedAreaHealthPercentage.Add(0.7f);
    default m_ElectrifiedAreaHealthPercentage.Add(0.6f);
    default m_ElectrifiedAreaHealthPercentage.Add(0.4f);

}