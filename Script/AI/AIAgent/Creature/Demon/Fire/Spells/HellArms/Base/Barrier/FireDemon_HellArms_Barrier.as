UCLASS()
class AHellArmsBarrierVisual : AGothicGASActor
{
    default bNeverApplyTickOptimizations = true;
    
    UPROPERTY(EditAnywhere)
    AGothicCharacter m_Target;

    UPROPERTY(EditAnywhere)
    bool m_CanAttack;

    UPROPERTY()
    bool m_WasActivated;

    UFUNCTION(BlueprintCallable)
    void Initialize(AFireDemonHellArmsAreaVisual_Base AssignedArea)
    {
        AFireDemonHellArmsAreaVisual_Base area = Cast<AFireDemonHellArmsAreaVisual_Base>(AssignedArea);
        m_Target = area.m_Target;
        m_CanAttack = false;
        m_WasActivated = false;
        SetActorTickEnabled(true);
    }

    FVector GetArmSpawnPosition(AGothicCharacter CurrentTarget)
    {
        return CurrentTarget.GetActorLocation();
    }

    void DoArmAttack(AFireDemonHellArmVisual_BarrierArm Arm, AGothicCharacter CurrentTarget)
    {
        Arm.ExecuteAttack(CurrentTarget);
    }

    UFUNCTION(BlueprintCallable)
    void DoAttack()
    {
        // if(m_WasActivated)
        //     return;

        // m_WasActivated = true;

        DoAttackCustom();

        // //We only need the tick for the initial attack.
        // SetActorTickEnabled(false);

    }

    void DoAttackCustom()
    {
    }

    UFUNCTION(BlueprintOverride)
    void Tick(float DeltaSeconds)
    {
        //if(m_CanAttack)  
        DoAttack();
    }

    UFUNCTION(BlueprintOverride)
    void EndPlay(EEndPlayReason EndPlayReason)
    {
        DestroySpawnedActors();
    }

    void DestroySpawnedActors()
    {
    }

}
