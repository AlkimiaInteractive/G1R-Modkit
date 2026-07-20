UCLASS()
class UStatsCalculatorIncremental : UStatsCalculatorBase
{
    UFUNCTION(BlueprintOverride)
    float Calculate_Scriptable(const UItemStatsDefinitionContainer actorStats, float currentStatValue)
    {
        return currentStatValue + 1;
    }
}