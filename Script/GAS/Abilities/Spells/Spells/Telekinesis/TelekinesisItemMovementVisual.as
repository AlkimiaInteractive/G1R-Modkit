class ATelekinesisItemMovementVisual : ATelekinesisItemMovement
{
    UPROPERTY(DefaultComponent, RootComponent)
    USceneComponent m_Root;
    UPROPERTY(DefaultComponent, Attach=m_Root)
    UArrowComponent m_Arrow;

    UPROPERTY(DefaultComponent)
    UProjectileMovementComponent m_MovementComp;

    UPROPERTY(DefaultComponent, Attach=m_Root)
    USceneComponent m_InteractSensorPoint;

    UPROPERTY()
    UInteractiveComponent m_ItemInteractComponent;
    UPROPERTY()
    FTransform m_InitialBoneTransform;

    UPROPERTY()
    FRotator m_RotationToSocket;
    UPROPERTY()
    FRotator m_InitialActorRotation;
    UPROPERTY()
    float m_MovementSpeed;


    UPROPERTY()
    FName m_SocketBoneName = FName("hand_l");

    UPROPERTY()
    AActor m_TargetItem;

    UPROPERTY()
    float32 m_DirFromTarget = MAX_flt;

    default bReplicateMovement = true;
    default bReplicates = true;
    default m_Arrow.SetHiddenInGame(true);
    default m_MovementComp.ProjectileGravityScale = 0.f;
    default m_MovementComp.SetUpdatedComponent(m_Root);
    default m_MovementComp.Deactivate();

    default m_Root.bReplicates = true;
    default m_InteractSensorPoint.bReplicates = true;
    default m_MovementComp.bReplicates = true;

    FVector m_InitialRelativeLocation;
    FRotator m_InitialRelativeRotation;

    UPROPERTY()
    bool m_CanUpdate = false;

    float m_AccumulatedTime = 0.f;
    
    //@DE - BE CAREFULL WITH BeginPlay on client. It can be called after RPC StartMovement(AActor ItemTarget). 
    //I let the call and the comment to remember it.
    UFUNCTION(BlueprintOverride)
    void BeginPlay()
    {
        //  Print(FString("BeginPlay"), 5.f, FLinearColor::Green);
        // m_Arrow.SetHiddenInGame(false);
        // m_MovementComp.ProjectileGravityScale = 0.f;
        // m_MovementComp.SetUpdatedComponent(m_Root);
        // m_MovementComp.Deactivate();
    }

    UFUNCTION(BlueprintOverride)
    void StartMovement_Scriptable(AActor Target, FName SocketName, float MovementSpeed)
    {
        StartMovement(Target, SocketName, MovementSpeed);
    }

    UFUNCTION(BlueprintOverride)
    void StopMovement_Scriptable()
    {
        StopMovement();
    }

    UFUNCTION(BlueprintOverride)
    float32 GetDistance_Scriptable()
    {
        return GetDistance();
    }

    UFUNCTION(BlueprintCallable, NetMulticast)
    void StartMovement(AActor ItemTarget, FName SocketName, float MovementSpeed)
    {
        m_TargetItem = ItemTarget;
        m_SocketBoneName = SocketName;
        m_MovementSpeed = MovementSpeed;

        m_ItemInteractComponent = Cast<UInteractiveComponent>(m_TargetItem.GetComponentByClass(UInteractiveComponent::StaticClass()));
        FTransform interactTransform;
        m_ItemInteractComponent.TryGetInteractTransform(false, interactTransform);
        
        m_InteractSensorPoint.SetWorldLocationAndRotation(interactTransform.GetLocation(), interactTransform.GetRotation());
        m_TargetItem.AttachToComponent(m_InteractSensorPoint,NAME_None, EAttachmentRule::KeepWorld);

        m_InitialRelativeLocation = m_InteractSensorPoint.GetRelativeLocation();
        m_InitialRelativeRotation = m_InteractSensorPoint.GetRelativeRotation();


        auto internalDirection = m_InitialRelativeLocation - GetActorLocation();
        internalDirection.Normalize();
        auto gothicChar = Cast<AGothicCharacter>(GetOwner());
        m_InitialBoneTransform = gothicChar.Mesh.GetSocketTransform(m_SocketBoneName, ERelativeTransformSpace::RTS_World);
        m_RotationToSocket = MagicScript::FindLookAtRotation(internalDirection, m_InitialBoneTransform.GetLocation());
        m_InitialActorRotation = GetActorRotation();

        ActivateRelocationTimeline();

        //Initial setup
        if(HasAuthority())
            UpdateVelocity();

        SetVelocity(m_FinalVelocity);

        m_MovementComp.Activate(true);
        m_CanUpdate = true;

        AItemVisualWorld WorldItem = Cast<AItemVisualWorld>(m_TargetItem);

        if(IsValid(WorldItem))
        {
            WorldItem.m_FXComponent.PlayEffect(GameplayTag::FX_Magic_Ray_Telekenesis, nullptr);
        }
    }

    UFUNCTION(BlueprintEvent)
    void ActivateRelocationTimeline()
    {}

    UFUNCTION(BlueprintCallable)
    void UpdateRelocationValues(float DeltaValue)
    {
        FVector newLocation = Math::Lerp(m_InitialRelativeLocation, FVector::ZeroVector, DeltaValue);
        FRotator newRotation = Math::LerpShortestPath(m_InitialRelativeRotation, FRotator::ZeroRotator, DeltaValue);
        m_InteractSensorPoint.SetRelativeLocation(newLocation);
        m_InteractSensorPoint.SetRelativeRotation(newRotation);

        FRotator rotationToSocket = Math::LerpShortestPath(m_InitialActorRotation, m_RotationToSocket, DeltaValue);
        SetActorRotation(rotationToSocket);
    }

    UFUNCTION(BlueprintCallable, NetMulticast)
    void StopMovement()
    {
        if(m_TargetItem != nullptr)
            m_TargetItem.DetachFromActor(EDetachmentRule::KeepWorld, EDetachmentRule::KeepWorld, EDetachmentRule::KeepWorld);

        m_CanUpdate = false;
        m_MovementComp.Deactivate();
        if(!HasAuthority())
            return;
        if(m_TargetItem != nullptr)
            m_TargetItem.ForceNetUpdate();

        
        AItemVisualWorld WorldItem = Cast<AItemVisualWorld>(m_TargetItem);

        if(IsValid(WorldItem))
        {
            WorldItem.m_FXComponent.StopFXInstancesWithTag(GameplayTag::FX_Magic_Ray_Telekenesis);
        }
    }
    

    
    void SetVelocity(FVector NewVelocity)
    {
        m_MovementComp.Velocity = NewVelocity;
    }

    UFUNCTION(BlueprintOverride)
    void Tick(float DeltaSeconds)
    {
        if(!m_CanUpdate)
            return;
        if(HasAuthority())
            UpdateVelocity();

        SetVelocity(m_FinalVelocity);

    }

    UPROPERTY(Replicated)
    FVector m_FinalVelocity;

    void UpdateVelocity()
    {
        FTransform interactTransform;
        m_ItemInteractComponent.TryGetInteractTransform(false, interactTransform);
        FVector intCompLocation = interactTransform.GetLocation();

        const FVector targetPos = intCompLocation;

        const FVector characterPos = m_InitialBoneTransform.GetLocation();
        m_DirFromTarget = float32(characterPos.Distance(targetPos));
        FVector direction = characterPos - targetPos;

        direction.Normalize();

        m_FinalVelocity = direction * m_MovementSpeed;

        auto gothicChar = Cast<AGothicCharacter>(GetOwner());
        m_InitialBoneTransform = gothicChar.Mesh.GetSocketTransform(m_SocketBoneName, ERelativeTransformSpace::RTS_World);
    }

    float32 GetDistance()
    {
        return m_DirFromTarget;
    }

    UFUNCTION(BlueprintOverride)
    void EndPlay(EEndPlayReason EndPlayReason)
    {
        StopMovement();
    }
}