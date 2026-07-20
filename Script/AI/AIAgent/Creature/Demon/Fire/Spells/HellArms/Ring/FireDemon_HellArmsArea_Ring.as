UCLASS()
class AFireDemonHellArmsAreaVisual_Ring : AFireDemonHellArmsAreaVisual_Base
{
    UPROPERTY(EditAnywhere, VisibleAnywhere, DefaultComponent, Attach=m_RootComp)
    UHitSphereCollisionComponent m_MultiTargetHitSphereCollisionComponent;

    UPROPERTY(EditAnywhere)
    float m_RingExtraAreaIncrement;

    UPROPERTY(EditAnywhere)
    float m_RingExteriorRadius;
    UPROPERTY(EditAnywhere)
    float m_MinDistanceToBorder;

    UPROPERTY(EditAnywhere)
    float m_BorderAngle;

    UPROPERTY(EditAnywhere)
    int m_MaxArmsToSpawn;

    UPROPERTY(EditAnywhere)
    FVector m_RingLocation;

    UPROPERTY()
    TMap<AGothicCharacter, UHitBoxCollisionComponent> m_MultiTargetMap;

    UPROPERTY()
    private TArray<AGothicCharacter> m_DetectedTargets;
    //UPROPERTY()
    //TArray<AGothicCharacter> m_RemoveTargets;


    UPROPERTY(EditAnywhere)
    AHellArmsBarrierVisual_Ring m_ArmsBarrier;

    default m_SpawnActorPath = n"Blueprint'/Game/Items/Magic/FireDemon/HellArms/Ring/BP_FireDemon_HellArms_Barrier_Ring.BP_FireDemon_HellArms_Barrier_Ring_C'";
    default m_AreaSpellConfig = UHellArmsAreaRingSpellConfig::StaticClass();
    default m_AreaType = EDemonAreaTypes::Ring;

    TArray<AGothicCharacter> GetDetectedTargets()
    {
        return m_DetectedTargets;
    }

    void SetUpConfig() override
    {
        Super::SetUpConfig();

        UHellArmsAreaRingSpellConfig config = Cast<UHellArmsAreaRingSpellConfig>(m_AreaSpellConfig.Get().GetDefaultObject());
        if(config == nullptr)
            DestroyActor();

        m_RingExtraAreaIncrement = config.m_RingExtraAreaIncrement;
        m_RingExteriorRadius = m_AreaRadius + m_RingExtraAreaIncrement;
        m_MinDistanceToBorder = config.m_MinDistanceToBorder;
        m_BorderAngle = config.m_BorderAngle;
        m_MaxArmsToSpawn = config.m_MaxArmsToSpawn;
    }

    void OnActorSpawned_Server(AActor SpawnedActor) override
    {
        m_ArmsBarrier = Cast<AHellArmsBarrierVisual_Ring>(SpawnedActor);
        m_ArmsBarrier.SetOwner(GetOwner());
        m_ArmsBarrier.Initialize(this);
    }

    void InitializeArea(AGothicCharacter target) override
    {
        Super::InitializeArea(target);

        if(m_Target == nullptr)
        {
            DestroyActor();
            return;
        }

        m_DetectedTargets.Empty();

        //This sphere will detect the target in to instance a extent box for follow the new targets.
        m_MultiTargetHitSphereCollisionComponent.SetSphereRadius(m_RingExteriorRadius + m_MinDistanceToBorder);
        m_MultiTargetHitSphereCollisionComponent.AddCustomCollisionResponse(ECollisionChannel::ECC_WorldStatic, ECollisionResponse::ECR_Ignore);

        m_MultiTargetHitSphereCollisionComponent.OnComponentBeginOverlap.AddUFunction(this, n"OnBeginOverlapMultiTarget");
        m_MultiTargetHitSphereCollisionComponent.OnComponentEndOverlap.AddUFunction(this, n"OnEndOverlapMultiTarget");
            
        FVector targetLocation = m_Target.GetActorLocation();
        FVector floorLocation = FindFloorLocation(targetLocation, ECollisionChannel::IKTrace, m_FloorMinHeight, m_FloorMaxHeight);

        m_RingLocation = FVector(targetLocation.X, targetLocation.Y, floorLocation.Z);
        SetActorLocation(m_RingLocation);
        DoSpawnArm();

        if(m_EnableDebugLines)
        {
            //System::DrawDebugArrow(GetActorLocation(), GetActorLocation() + GetActorForwardVector() * m_RingExteriorRadius, 12.f, FLinearColor::Gray, m_LifeSpan, 5.f);

            System::DrawDebugCircle(m_RingLocation, m_AreaRadius, 360.f, FLinearColor::Red, m_LifeSpan, 5.f, FVector::RightVector, FVector::ForwardVector);
            System::DrawDebugCircle(m_RingLocation, m_RingExteriorRadius, 360.f, FLinearColor::Purple, m_LifeSpan, 5.f, FVector::RightVector, FVector::ForwardVector);
        
            System::DrawDebugCircle(m_RingLocation, m_AreaRadius - m_MinDistanceToBorder, 360.f, FLinearColor::Green, m_LifeSpan, 5.f, FVector::RightVector, FVector::ForwardVector);
            System::DrawDebugCircle(m_RingLocation, m_RingExteriorRadius + m_MinDistanceToBorder, 360.f, FLinearColor::Blue, m_LifeSpan, 5.f, FVector::RightVector, FVector::ForwardVector);
        }

        m_MultiTargetHitSphereCollisionComponent.SetState(EHitColliderState::Damage);
    }

    void DoSpawnArm() override
    {
        FVector floorLocation = FindFloorLocation(m_TargetPredictedPosition, ECollisionChannel::IKTrace, m_FloorMinHeight, m_FloorMaxHeight);
        AActor barrier = SpawnActor(GetSpawnActorClassServer_Scriptable(), FVector(m_TargetPredictedPosition.X, m_TargetPredictedPosition.Y, floorLocation.Z));
        OnActorSpawned_Server(barrier);
        
    }

    UFUNCTION(BlueprintOverride)
    void Tick(float DeltaSeconds)
    {
        Super::Tick(DeltaSeconds);
        if(CheckSpawnArmsCanAttackTarget(m_Target))
            AddTarget(m_Target);
        else 
            RemoveTarget(m_Target);
            
        MultiTargetTick(DeltaSeconds);        
        m_ArmsBarrier.m_CanAttack = m_DetectedTargets.Num() > 0;
    }

    void AddTarget(AGothicCharacter CurrentTarget)
    {
        m_DetectedTargets.AddUnique(CurrentTarget);
    }

    void RemoveTarget(AGothicCharacter CurrentTarget)
    {
        m_DetectedTargets.Remove(CurrentTarget);
    }

    bool CheckSpawnArmsCanAttackTarget(AGothicCharacter CurrentTarget)
    {
        if(m_ArmsBarrier == nullptr || CurrentTarget == nullptr)
            return false;

        FVector targetLocation = FindFloorLocation(CurrentTarget.GetActorLocation(), ECollisionChannel::IKTrace, m_FloorMinHeight, m_FloorMaxHeight);
        //System::DrawDebugSphere(targetLocation);
        FVector centerArea = GetActorLocation();
        
        if(IsCloseToBorder(targetLocation, centerArea))
            return true;//m_ArmsBarrier.m_CanAttack = true;
        else
            return false;//m_ArmsBarrier.m_CanAttack = false;
    }

    bool IsCloseToBorder(FVector TargetLocation, FVector CenterArea)
    {
        float minInnerDistance = m_AreaRadius - m_MinDistanceToBorder;
        float maxOuterDistance = m_RingExteriorRadius + m_MinDistanceToBorder;

        auto a = CenterArea.Distance(TargetLocation);
        auto b = CenterArea.Distance(TargetLocation) >= minInnerDistance;
        auto c = CenterArea.Distance(TargetLocation) <= maxOuterDistance;

        return (CenterArea.Distance(TargetLocation) >= minInnerDistance) && (CenterArea.Distance(TargetLocation) <= maxOuterDistance);
    }

    void DestroySpawnedActors() override
    {
        Super::DestroySpawnedActors();
        if(m_ArmsBarrier != nullptr)
            m_ArmsBarrier.DestroyActor();
    }


    ////////////////////////////////////////////////////
    /////Multitarget region////////////////////////////
    //////////////////////////////////////////////////

    UFUNCTION()
    void OnBeginOverlapMultiTarget(UPrimitiveComponent OverlappedComponent, AActor OtherActor, UPrimitiveComponent OtherComp, int OtherBodyIndex, bool bFromSweep, const FHitResult&in SweepResult)
    {
        if(OtherActor == m_Target)
            return;

        if(OtherActor == GetOwner())
            return;

        if(m_ArmsBarrier.m_MaxArmsToSpawn < m_MultiTargetMap.Num())
            return;


        AGothicCharacter CurrentTarget = Cast<AGothicCharacter>(OtherActor);

        if(CurrentTarget == nullptr || m_MultiTargetMap.Contains(CurrentTarget))
        {
            return;
        }

        UGothicAbilitySystemComponent targetAbComp = GothicGAS::GetAbilitySystemComponent(CurrentTarget);

        if(targetAbComp.HasGameplayTag(GameplayTag::State_Defeated) || targetAbComp.HasGameplayTag(GameplayTag::State_Dead))
        {
            return;
        }

        auto fireDemon = Cast<AGothicCharacter>(GetOwner());
        if(fireDemon == nullptr || !fireDemon.IsEnemyTowards(CurrentTarget))
        {
            if(!fireDemon.IsEnemyTowards(CurrentTarget))
            {
                FString log = FString(fireDemon.Name);
                log.Append("- IS NOT ENEMY OF -");
                log.Append(CurrentTarget.Name);
                //Print(log, 15, FLinearColor::Red);
            }else
            {
                FString log = FString(fireDemon.Name);
                log.Append("- IS ENEMY OF -");
                log.Append(CurrentTarget.Name);
                //Print(log, 15, FLinearColor::Green);
            }

            if(!CurrentTarget.IsEnemyTowards(fireDemon))
            {
                FString log = FString(CurrentTarget.Name);
                log.Append("- IS NOT ENEMY OF -");
                log.Append(fireDemon.Name);
                //Print(log, 15, FLinearColor::Red);
            }else
            {
                FString log = FString(CurrentTarget.Name);
                log.Append("- IS ENEMY OF -");
                log.Append(fireDemon.Name);
                //Print(log, 15, FLinearColor::Green);
            }
            
            return;
        }
            

        // FString log = FString("HellArmRing::OnBeginOverlap ");
        // log.Append(OtherActor.Name);
        // Print(log);

        UHitBoxCollisionComponent multiTargetTraceBox = Cast<UHitBoxCollisionComponent>(CreateComponent(UHitBoxCollisionComponent::StaticClass(), NAME_None));
        multiTargetTraceBox.SetCollisionProfileName(FName("NoCollision"));
        multiTargetTraceBox.SetBoxExtent(m_HitBoxDamageActorSpawnExtent);
        multiTargetTraceBox.SetVisibility(true);
        multiTargetTraceBox.SetHiddenInGame(true);

        m_MultiTargetMap.Add(CurrentTarget, multiTargetTraceBox);
    }

    UFUNCTION()
    void OnEndOverlapMultiTarget(UPrimitiveComponent OverlappedComp, AActor OtherActor, UPrimitiveComponent OtherComp, int32 OtherBodyIndex)
    {
        if(OtherActor == m_Target)
            return;
        if(OtherActor == GetOwner())
            return;

        if(CheckIsOverlappingActor(OtherActor))
            return;

        AGothicCharacter CurrentTarget = Cast<AGothicCharacter>(OtherActor);

        if(CurrentTarget == nullptr || !m_MultiTargetMap.Contains(CurrentTarget))
        {
            return;
        }
        
        
        m_MultiTargetMap[CurrentTarget].DoDestroyExplicit();
        m_MultiTargetMap.Remove(CurrentTarget);
        RemoveTarget(CurrentTarget);

        // FString log = FString("HellArmRing::OnEndOverlap ");
        // log.Append(OtherActor.Name);
        // Print(log);
    }

    bool CheckIsOverlappingActor(AActor OtherActor)
    {
        if(m_MultiTargetHitSphereCollisionComponent.GetState() != EHitColliderState::Damage)
            return false;
        TArray<AActor> overlappingActors;
        m_MultiTargetHitSphereCollisionComponent.GetOverlappingActorsCustom(overlappingActors, AGothicCharacter::StaticClass());
        for(auto actor : overlappingActors)
        {
            if(actor == OtherActor)
                return true;
        }
        return false;
    }

    void MultiTargetTick(float DeltaSeconds)
    {
        TMap<AGothicCharacter, UHitBoxCollisionComponent> multiTargetCopy = m_MultiTargetMap;
        for(auto CurrentTarget : multiTargetCopy)
        {
            //Print(CurrentTarget.Value.GetWorldLocation().ToString());
            UpdateTarget(CurrentTarget.Key, CurrentTarget.Value, DeltaSeconds);
        }
        

    }

    void UpdateTarget(AGothicCharacter CurrentTarget, UHitBoxCollisionComponent CurrentBox, float DeltaSeconds)
    {
         if(CurrentTarget == nullptr || !IsCloseToArea(CurrentTarget))
            return;
        PredictTargetMovement(CurrentTarget);
        MoveSpawnCube(DeltaSeconds, CurrentBox);
        if(CheckSpawnArmsCanAttackTarget(CurrentTarget))
            AddTarget(CurrentTarget);
        else 
            RemoveTarget(CurrentTarget);
    }

    
    ////////////////////////////////////////////////////
    /////Multitarget region end////////////////////////
    //////////////////////////////////////////////////

   
}