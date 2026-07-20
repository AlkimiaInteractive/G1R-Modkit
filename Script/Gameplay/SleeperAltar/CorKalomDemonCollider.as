UCLASS()
class ACorKalomDemonCollider : AActor
{
    UPROPERTY(DefaultComponent, RootComponent)
    USceneComponent m_RootComp;
    
    UPROPERTY(DefaultComponent,  Replicated, Attach=m_RootComp)
    UStaticMeshComponent m_ColliderMesh;
}
