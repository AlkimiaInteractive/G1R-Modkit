UCLASS()
class UStatsCalculatorPercentage : UStatsCalculatorBase
{
    FName m_Dividend;
	FName m_Divider;

    UFUNCTION(BlueprintOverride)    
    void Initialize_Scriptable(const TArray<FName> args)
    {
        if(ensure(args.Num() == 2, "This calculator requires two params"))
        {
            m_Dividend = args[0];
            m_Divider = args[1];
        }
    }

    UFUNCTION(BlueprintOverride)
    float Calculate_Scriptable(const UItemStatsDefinitionContainer actorStats, float currentStatValue)
    {
        if(m_Dividend.IsNone() || m_Divider.IsNone() || actorStats == nullptr)
        {
		    return currentStatValue;
        }
        
        const auto dividendStat = actorStats.Find_Scriptable(m_Dividend);
        const auto dividerStat = actorStats.Find_Scriptable(m_Divider);
        
        if(dividendStat == nullptr || dividerStat == nullptr || dividerStat.GetStatValue() == 0.f)
        {
            return currentStatValue;
        }

        return dividendStat.GetStatValue() / dividerStat.GetStatValue() * 100.f;
    }
}