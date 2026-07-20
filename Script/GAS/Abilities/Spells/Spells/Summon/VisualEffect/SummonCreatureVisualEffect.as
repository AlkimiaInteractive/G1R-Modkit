class ASummonCreatureVisualEffect : AGothicGASActor
{
    default bReplicates = true;

    default bNeverApplyTickOptimizations = true;

    default bAlwaysRelevant = true;

    UPROPERTY(DefaultComponent, RootComponent)
	USceneComponent m_RootComp;

    UFUNCTION(BlueprintEvent, NetMulticast)
    void SpawnVisualAtLocation(FVector SpawnLocation)
    {
        
    }

    UFUNCTION()
    void PlayMontage()
    {

    }
}
