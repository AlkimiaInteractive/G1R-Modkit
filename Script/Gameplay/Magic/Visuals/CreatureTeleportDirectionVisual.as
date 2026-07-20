class ACreatureTeleportDirectionVisual : AActor
{
    UPROPERTY(BlueprintReadOnly, VisibleAnywhere)
    FVector m_OriginPoint;
    UPROPERTY(BlueprintReadOnly, VisibleAnywhere)
    FVector m_EndPoint;
    UPROPERTY(BlueprintReadOnly, VisibleAnywhere)
    FVector m_Direction;

    UPROPERTY(DefaultComponent, RootComponent)
    USceneComponent m_RootComp;

    UPROPERTY(DefaultComponent, Attach=m_RootComp)
    UArrowComponent m_DirectionArrow;

    UPROPERTY(DefaultComponent)
    UProjectileMovementComponent m_MovementComp;

    UPROPERTY()
    float m_MaxSpeed = 0.f;
    UPROPERTY()
    float m_Speed = 750.f;

    UPROPERTY(BlueprintReadOnly, VisibleAnywhere)
    float m_MaxDistance = 450.f;

    default m_MaxSpeed = m_Speed;

    default m_MovementComp.InitialSpeed = 0.f;
    default m_MovementComp.InitialSpeed = m_MaxSpeed;
    default m_MovementComp.ProjectileGravityScale = 0.f;
    default m_MovementComp.SetUpdatedComponent(m_DirectionArrow);
    default m_MovementComp.SetActive(false);

    default bNeverApplyTickOptimizations = true;

    

    UFUNCTION(BlueprintOverride)
    void BeginPlay()
    {
        SetActorTickEnabled(false);
        SetReplicates(true);
        SetReplicateMovement(true);
    }

    UFUNCTION(BlueprintCallable)
    void InitializeVisual(FVector Origin, FVector End)
    {
        m_OriginPoint = Origin;
        m_EndPoint = FVector(End.X, End.Y, Origin.Z);
        m_Direction = End - Origin;
        m_Direction.Normalize();

        m_MaxDistance = m_OriginPoint.Distance(m_EndPoint);

        //SetActorLocation(Origin + m_HeightOffset);
        //SetActorRotation(MagicScript::FindLookAtRotation(Origin, End));

        m_MovementComp.Velocity = GetActorForwardVector() * m_Speed;
        m_MovementComp.SetActive(true);

        ActivateVisuals();

        SetActorTickEnabled(true);

        SetLifeSpan(8.f);

    }

    UFUNCTION(BlueprintEvent)
    void ActivateVisuals()
    {

    }

    UFUNCTION(BlueprintCallable)
    void DeactivateVisual()
    {
        //SetActorHiddenInGame(true);
        SetActorTickEnabled(false);
        m_MovementComp.SetActive(false);
        //DestroyActor();
    }

    UFUNCTION(BlueprintOverride)
    void Tick(float DeltaSeconds)
    {
        if(!HasAuthority())
            return;
        if(m_DirectionArrow.GetWorldLocation().Distance(m_OriginPoint) >= m_MaxDistance)
            DeactivateVisual();

    }
}