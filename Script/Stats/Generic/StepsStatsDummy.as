UCLASS()
class UStepsStats : UGenericStat
{
    default m_StatName = n"Walk";
	
    default m_StatsTag = GameplayTag::Stats_Walk_Steps;
    default m_StatsArgs.Add(GameplayTag::Stats_Walk_Steps);
}