UCLASS()
class ADemonAreaVisual : AGothicGASActor//AFireDemonHellArmsAreaVisual
{
    default bNeverApplyTickOptimizations = true;
    
    UPROPERTY(DefaultComponent, RootComponent)
    USceneComponent m_RootComp;

    UPROPERTY(EditAnywhere, VisibleAnywhere, DefaultComponent, Attach=m_RootComp)
    UHitSphereCollisionComponent m_HitSphereCollisionComponent;

    UPROPERTY(EditAnywhere, VisibleAnywhere, DefaultComponent, Attach=m_RootComp)
    UHitBoxCollisionComponent m_HitBoxDamageActorSpawn;

    UPROPERTY(EditAnywhere, VisibleAnywhere, DefaultComponent, Attach=m_RootComp)
    UArrowComponent m_ArrowComp;

    UPROPERTY(EditAnywhere, Replicated)
    AGothicCharacter m_Target;

    UPROPERTY()
	UDemonAreaRegisterComponent m_DemonAreaRegisterComponent;

    //default m_AreaType = EHellArmsAreaTypes::Base;
    UPROPERTY(EditAnywhere)
    EDemonAreaTypes m_AreaType = EDemonAreaTypes::Base;

    UPROPERTY(EditAnywhere)
    float m_FloorMinHeight;
    UPROPERTY(EditAnywhere)
    float m_FloorMaxHeight;

    UPROPERTY(EditAnywhere)
    float m_MinAttackTime;

    UPROPERTY(EditAnywhere)
    float m_MaxAttackTime;

    //Max predicted Distance from the player to their predicted next position
    UPROPERTY(EditAnywhere)
    float m_MaxPredictionDistance;
    UPROPERTY(EditAnywhere)
    float m_MaxDistanceToAreaDetection;
    UPROPERTY(EditAnywhere, BlueprintReadWrite, Replicated)
    float m_AreaRadius;
    UPROPERTY(EditAnywhere)
    float m_LifeSpan;


    UPROPERTY(EditAnywhere)
    FVector m_HitBoxDamageActorSpawnExtent;

    UPROPERTY(EditAnywhere)
    bool m_EnableDebugLines = false; 

    UPROPERTY(EditAnywhere)
    FVector m_TargetPredictedPosition;

    UPROPERTY(EditAnywhere, BlueprintReadWrite)
	TSoftClassPtr<AActor> m_SpawnActorPath;

    UPROPERTY(EditAnywhere, BlueprintReadWrite)
    TSubclassOf<USpellConfig> m_AreaSpellConfig = UDemonAreaBaseSpellConfig::StaticClass();

    default bReplicates = true;
   
    UFUNCTION()
    TSubclassOf<AActor> GetSpawnActorClassServer_Scriptable() const
    {
        return m_SpawnActorPath.Get();
    }

    

    UFUNCTION(BlueprintOverride)
    void BeginPlay()
    {
        if(!m_SpawnActorPath.IsValid())
            MagicScript::GetPreloaded(m_SpawnActorPath);   

        SetUpConfig();  
    }

    UFUNCTION(BlueprintOverride)
    void Tick(float DeltaSeconds)
    {
        if(!HasAuthority())
            return;
        if(m_Target == nullptr || !IsCloseToArea(m_Target))
            return;
        PredictTargetMovement(m_Target);
        MoveSpawnCube(DeltaSeconds, m_HitBoxDamageActorSpawn);
    }

    UFUNCTION(BlueprintCallable)
    void SetTarget(AGothicCharacter Target)
    {
        m_Target = Target;
    }

    UFUNCTION(BlueprintCallable)
    void OnActorSpawned_Server(AActor SpawnedActor)
    {
        
    }


    UFUNCTION(BlueprintCallable)
    void SetUpConfig()
    {
        UDemonAreaBaseSpellConfig config = Cast<UDemonAreaBaseSpellConfig>(m_AreaSpellConfig.Get().GetDefaultObject());
        if(config == nullptr)
            DestroyActor();
       
        m_FloorMinHeight = config.m_MinFloorHeight;
        m_FloorMaxHeight = config.m_MaxFloorHeight;
        m_MaxPredictionDistance = config.m_MaxPredictionDistance;
        m_MaxDistanceToAreaDetection = config.m_MaxDistanceToAreaDetection;
        m_AreaRadius = config.m_AreaRadius;
        m_LifeSpan = config.m_LifeSpan;
        m_HitBoxDamageActorSpawnExtent = config.m_HitBoxDamageActorSpawnExtent;
        m_EnableDebugLines = config.m_EnableDebugLines;
        m_MinAttackTime = config.m_MinAttackTime;
        m_MaxAttackTime = config.m_MaxAttackTime;
    }


    UFUNCTION(BlueprintCallable)
    void InitializeArea(AGothicCharacter target)
    {
        SetUpConfig();
        m_HitSphereCollisionComponent.SetSphereRadius(m_AreaRadius);
        m_HitSphereCollisionComponent.AddCustomCollisionResponse(ECollisionChannel::ECC_WorldStatic, ECollisionResponse::ECR_Ignore);
        System::SetTimerDelegate(FTimerDynamicDelegate(this, n"OnLifeSpanEnds"), m_LifeSpan, false);
        m_HitBoxDamageActorSpawn.SetCollisionProfileName(FName("NoCollision"));
        //m_HitBoxDamageActorSpawn.AddCustomCollisionResponse(ECollisionChannel::ECC_WorldStatic, ECollisionResponse::ECR_Ignore);
        m_HitBoxDamageActorSpawn.SetBoxExtent(m_HitBoxDamageActorSpawnExtent);
        SetTarget(target);
        if(m_EnableDebugLines)
        {
           m_HitBoxDamageActorSpawn.SetHiddenInGame(true);
        }
        RegisterArea();
    }

    UFUNCTION(BlueprintEvent, NetMulticast)
    void InitializeVisuals()
    {

    }

    UFUNCTION()
    void OnLifeSpanEnds()
    {
        RemoveArea();
        DestroySpawnedActors();
        SetLifeSpan(5.f);
    }


    
    FVector FindFloorLocation(FVector Location, ECollisionChannel CollisionChannel, float FloorMinHeight, float FloorMaxHeight)
    {
        FHitResult hit;
        MagicScript::FindFloorAtLocation(Location, hit, this, CollisionChannel, FloorMinHeight, FloorMaxHeight);
        return hit.ImpactPoint;
    }

    
    FVector FindFloorLocation(FVector Location)
    {
        return FindFloorLocation(Location, ECollisionChannel::IKTrace, m_FloorMinHeight, m_FloorMaxHeight);
    }

    UFUNCTION(BlueprintCallable, BlueprintPure)
    bool IsCloseToArea(AGothicCharacter CurrentTarget)
    {
        if(CurrentTarget == nullptr)
            return false;

        if(GetActorLocation().Distance(CurrentTarget.GetActorLocation()) < m_MaxDistanceToAreaDetection)
            return true;

        return false;
    }

    UFUNCTION(BlueprintCallable, BlueprintPure)
    float GetPlayerVelocityNormalized()
    {
        if(m_Target == nullptr)
            return 0.f;

        UGothicMovementComponent movementComp = m_Target.GetGothicMovementComponent();
        if(movementComp.GetMaxSpeed() == 0)
            return 0.f;
        return movementComp.GetCurrentSpeed() / movementComp.GetMaxSpeed();
    }

    //Calculated the predicted Distance from the player to their predicted next position
    UFUNCTION(BlueprintCallable, BlueprintPure)
    float GetPredictionDistance()
    {
        return Math::Lerp(0.f, m_MaxPredictionDistance, GetPlayerVelocityNormalized());
    }

    UFUNCTION(BlueprintCallable, BlueprintPure)
    FVector GetPredictedPosition(AGothicCharacter CurrentTarget)
    {
         if(CurrentTarget == nullptr)
            return GetActorLocation();
        
        float predictedDistance = GetPredictionDistance();

        FVector targetPosition = CurrentTarget.GetActorLocation();

        UGothicMovementComponent movementComp = CurrentTarget.GetGothicMovementComponent();
        FVector predictedDirection = movementComp.GetPivotCheckDirection();
        predictedDirection.Normalize();
        predictedDirection *= predictedDistance;

        return targetPosition + predictedDirection;
    }

    UFUNCTION(BlueprintCallable)
    void PredictTargetMovement(AGothicCharacter CurrentTarget)
    {
        if(!IsCloseToArea(CurrentTarget) || CurrentTarget == nullptr)
        {
            m_TargetPredictedPosition = FVector(0,0, m_AreaRadius * -100.f);
            return;
        }

        FVector predictedPosition = GetPredictedPosition(CurrentTarget);

        m_TargetPredictedPosition = FVector(predictedPosition.X, predictedPosition.Y, GetActorLocation().Z);

        float floorMinHeight = m_FloorMinHeight - m_AreaRadius;
        m_TargetPredictedPosition = FindFloorLocation(m_TargetPredictedPosition, ECollisionChannel::IKTrace, floorMinHeight, m_FloorMaxHeight);
    }

    UFUNCTION(BlueprintCallable)
    void CalculateDistanceToTarget(FVector Location, FVector TargetLocation, float& Distance, bool& InsideArea)
    {
        Distance = TargetLocation.Distance(Location);
        InsideArea = Distance <= m_AreaRadius;
    }

    UFUNCTION(BlueprintCallable, BlueprintPure)
    bool IsInArea()
    {
        float distance;
        bool isInArea = false;
        CalculateDistanceToTarget(GetActorLocation(), m_TargetPredictedPosition, distance, isInArea);
        return isInArea;
    }

    UFUNCTION(BlueprintCallable)
    void MoveSpawnCube(float DeltaSeconds, UHitBoxCollisionComponent CurrentBox)
    {
        if(IsInArea())
        {
            CurrentBox.SetWorldLocation(GetActorLocation() + (m_TargetPredictedPosition - GetActorLocation()));
        }
        else
        {
            FVector positionInAreaBorder = m_TargetPredictedPosition - GetActorLocation();
            positionInAreaBorder.Normalize();
            positionInAreaBorder = FVector(positionInAreaBorder.X * m_AreaRadius, positionInAreaBorder.Y * m_AreaRadius, positionInAreaBorder.Z * GetActorLocation().Z);
            CurrentBox.SetWorldLocation(GetActorLocation() + positionInAreaBorder);
        }
    }

    
    // UFUNCTION(Server)
    // private void SpawnArm(FVector Location, TSubclassOf<AActor> ArmClass)
    // {
    //     FVector floorLocation = FindFloorLocation(m_TargetPredictedPosition, ECollisionChannel::IKTrace, m_FloorMinHeight, m_FloorMaxHeight);
    //     AActor arm = SpawnActor(ArmClass, FVector(Location.X, Location.Y, floorLocation.Z));
    //     OnActorSpawned_Server(arm);

    // }

    // UFUNCTION(BlueprintCallable, Server)
    // void SpawnArmAtLocation(FVector Location)
    // {
    //     SpawnArm(Location, GetSpawnActorClassServer_Scriptable());
    // }

    // UFUNCTION(BlueprintCallable)
    // void DoSpawnArm()
    // {
    //     FVector randomPoint = Math::RandomPointInBoundingBox(m_HitBoxDamageActorSpawn.GetWorldLocation(), m_HitBoxDamageActorSpawn.BoxExtent / 2);
    //     SpawnArmAtLocation(randomPoint);
    // }

    // UFUNCTION(BlueprintOverride)
    // void EndPlay(EEndPlayReason EndPlayReason)
    // {
    //    RemoveArea();
    //    DestroySpawnedActors();
    // }

    void DestroySpawnedActors()
    {
    }

    UFUNCTION(BlueprintCallable)
    void RegisterArea()
    {
        AAIAgentCharacter instigator = Cast<AAIAgentCharacter>(GetOwner());
        if(instigator == nullptr)
            return;
        UDemonAreaRegisterComponent areaRegisterComp = GetDemonAreaRegisterComponent(instigator);
        areaRegisterComp.AddArea(this);
    }

    UFUNCTION(BlueprintCallable)
    void RemoveArea()
    {
        AGothicCharacter instigator = Cast<AGothicCharacter>(GetOwner());
        if(instigator == nullptr)
            return;
        UDemonAreaRegisterComponent areaRegisterComp = GetDemonAreaRegisterComponent(instigator);
        areaRegisterComp.RemoveArea(this);
    }

    UDemonAreaRegisterComponent GetDemonAreaRegisterComponent(AGothicCharacter InstigatorCharacter)
	{
		if(m_DemonAreaRegisterComponent == nullptr)
			m_DemonAreaRegisterComponent = UDemonAreaRegisterComponent::GetOrCreate(InstigatorCharacter);
		return m_DemonAreaRegisterComponent;
	}


    bool CanSpawnArea(AGothicCharacter InstigatorCharacter, EDemonAreaTypes DemonAreaType)
	{
		return GetDemonAreaRegisterComponent(InstigatorCharacter).CanSpawnArea(DemonAreaType);
	}
    
}