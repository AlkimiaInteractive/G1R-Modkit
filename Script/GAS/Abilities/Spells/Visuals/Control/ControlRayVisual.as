UCLASS(Blueprintable)
class AControlRayVisual : AActor

{
    default bNeverApplyTickOptimizations = true;
    
    UPROPERTY(BlueprintReadWrite, EditAnywhere, Replicated)
	AActor m_Source = nullptr;

	UPROPERTY(BlueprintReadWrite, EditAnywhere, Replicated)
	AActor m_Target = nullptr;

    UPROPERTY(BlueprintReadOnly, EditAnywhere, Replicated)
    float m_Duration = 0.0f;

    default ActorTickEnabled = true;
    default bReplicates = true;

    UFUNCTION(NetMulticast)
    void Initialize(AActor NewTarget, AActor NewSource, float duration)
    {
        m_Target = NewTarget;
        m_Source = NewSource;
        m_Duration = duration;
    }
}