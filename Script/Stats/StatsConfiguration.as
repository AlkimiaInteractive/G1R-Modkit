UCLASS()
class UStatsConfigurationDefinition : UStatsCalculatorConfiguration
{
    default AddStatsGameplayTag(GameplayTag::Stats_Magic_Hit, UStatsCalculatorIncremental::StaticClass());
	default AddStatsGameplayTag(GameplayTag::Stats_Magic_Throw, UStatsCalculatorIncremental::StaticClass());
    default AddStatsGameplayTag(GameplayTag::Stats_Walk_Steps, UStatsCalculatorIncremental::StaticClass());

    TArray<FGameplayTag> percentageArgs;
    default percentageArgs.Add(GameplayTag::Stats_Magic_Hit);
    default percentageArgs.Add(GameplayTag::Stats_Magic_Throw);

	default AddStatsGameplayTagWithArgs(GameplayTag::Stats_Magic_Hit_Percentage, UStatsCalculatorPercentage::StaticClass(), percentageArgs);


    default m_GenericStats.Add(UStepsStats::StaticClass());
}