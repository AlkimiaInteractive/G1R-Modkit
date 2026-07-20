UCLASS()
class ADesertSandTornado : ABattleBarrierVisual
{
    default bNeverApplyTickOptimizations = true;

    default bReplicates = true;
    
    UPROPERTY(DefaultComponent, RootComponent)
	USceneComponent m_RootComp;

    UPROPERTY(BlueprintReadOnly, VisibleAnywhere)
    TSubclassOf<UDesertSandTornadoConfig> m_TornadoConfig = UDesertSandTornadoConfig::StaticClass();

    UFUNCTION(BlueprintEvent, BlueprintCallable, NetMulticast)
    void StartTornado()
    {

    }

    UFUNCTION(BlueprintEvent, BlueprintCallable, NetMulticast)
    void ReduceTornado()
    {
        
    }

    UFUNCTION(BlueprintEvent, BlueprintCallable, NetMulticast)
    void OnCreatureSpawned(USpawningRequest SpawningRequest, AActor Actor)
    {
        
    }
}