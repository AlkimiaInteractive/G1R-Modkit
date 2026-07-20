
UCLASS()
class AXardas_Sleeper_Env_RubyVisual : AActor
{
    default bReplicates = true;

    UPROPERTY(DefaultComponent, RootComponent)
    USceneComponent m_Root;

    UPROPERTY(DefaultComponent, Attach=m_Root)
    UArrowComponent m_Arrow;

    UPROPERTY(DefaultComponent, Attach=m_Root)
    USceneComponent m_RubyRoot;
    

    UPROPERTY(DefaultComponent,  Replicated, Attach=m_RubyRoot)
    UStaticMeshComponent m_RubyMesh;
    UPROPERTY(DefaultComponent, Replicated, Attach=m_RubyRoot)
    USkeletalMeshComponent m_RubySkeletalMesh;

    UPROPERTY(DefaultComponent, Attach=m_RubyRoot)
    UGothicFXComponent m_FXComp;

    default bNeverApplyTickOptimizations = true;

    default bReplicates = true;

    UFUNCTION(BlueprintEvent)
    void DoActivateVisuals()
    {

    }
}
