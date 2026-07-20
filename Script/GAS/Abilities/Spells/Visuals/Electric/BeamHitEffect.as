UCLASS()
class ABeamHitEffect : AActor
{
    default bNeverApplyTickOptimizations = true;
    default bReplicates = true;

    UPROPERTY(DefaultComponent, RootComponent)
    USceneComponent m_RootComp;

    
}