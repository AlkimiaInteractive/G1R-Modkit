UCLASS(Abstract)
class UTauntData_Config : UTauntData
{
    UFUNCTION(BlueprintCallable)
    UTauntConfigManager CreateNewTauntGroup()
    {
        auto TauntConfigManager = UTauntConfigManager();
        TauntConfigManager.TauntData = this;

        return TauntConfigManager;
    }
}

UCLASS()
class UTauntConfigManager
{
    UTauntData_Config TauntData;
    FGameplayTagContainer TauntProperties;

    TArray<FName> Montages;

    UFUNCTION(BlueprintCallable)
    UTauntConfigManager AddProperty(FGameplayTag Tag)
    {
        TauntProperties.AddTag(Tag);
        return this;
    }

    UFUNCTION(BlueprintCallable)
    UTauntConfigManager AddProperties(FGameplayTagContainer Tags)
    {
        TauntProperties.AppendTags(Tags);
        return this;
    }

    UFUNCTION(BlueprintCallable)
    UTauntConfigManager AddMontage(FName Montage)
    {
        Montages.Add(Montage);
        return this;
    }

    UFUNCTION(BlueprintCallable)
    UTauntConfigManager AddMontages(TArray<FName> MontagesToAdd)
    {
        Montages.Append(MontagesToAdd);
        return this;
    }

    UFUNCTION(BlueprintCallable)
    void Set()
    {
        for (auto Montage : Montages)
        {
            TauntData.AddTaunt(TauntProperties, Montage);
        }
    }
}