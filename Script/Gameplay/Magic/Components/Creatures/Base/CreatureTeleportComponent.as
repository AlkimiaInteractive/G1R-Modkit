class UCreatureTeleportComponent : UCreatureGenericMagicComponent
{
    UPROPERTY()
    private ATeleportSpotVisual m_TeleportSpot;
    UPROPERTY()
    ACreatureTeleportDirectionVisual m_TeleportDirectionVisual;

    UPROPERTY()
    FGameplayTeleportDelegate OnMovementCompletedDelegate;
    
    UPROPERTY()
    private FTimerHandle TaskTimer;

    UPROPERTY()
    FVector m_HeightOffset = FVector(0, 0, 150);

    UPROPERTY(EditAnywhere, BlueprintReadWrite)
	TSoftClassPtr<AActor> m_SpawnActorPath;// = n"Blueprint'/Game/Items/Magic/Golem/Ice/BP_IceBoltActor_IceGolem.BP_IceBoltActor_IceGolem_C'";

    UFUNCTION()
    TSubclassOf<AActor> GetSpawnActorClassServer() const
    {
        return m_SpawnActorPath.Get();
    }

    UFUNCTION(BlueprintOverride)
    void BeginPlay()
    {
        if(!m_SpawnActorPath.IsValid())
            MagicScript::GetPreloaded(m_SpawnActorPath);

        auto actor = GetOwner();
        //@DE - Deactivate tick optimizer for teleport.
        UBFGTickOptimizerSystem::SetTickOptimizationRuntime_Enabled(actor, false);
        actor.NetUpdateFrequency = 1.f;
        actor.NetPriority = 1.f;
    }
    
    
    UFUNCTION(BlueprintCallable)
    void SetTargetTeleportSpot(ATeleportSpotVisual TeleportSpot)
    {
        if(!GetOwner().HasAuthority())
            return;
        m_TeleportSpot = TeleportSpot;

    }

    UFUNCTION(BlueprintCallable)
    ATeleportSpotVisual GetTargetTeleportSpot()
    {
        return m_TeleportSpot;
    }

    ATeleportSpotVisual FindFurthestTeleportSpot(UClass TeleportSpotFilterClass)
    {
        TArray<ATeleportSpotVisual> outActors;
        GetAllActorsOfClass(TeleportSpotFilterClass, outActors);

        if(outActors.Num() == 0)
            return nullptr;
        
        auto target = GetTargetActor();
        if(target == nullptr)
            return FindFurthestTeleportSpotByActorLocation(outActors, GetOwner().GetActorLocation());
        return FindFurthestTeleportSpotByActorLocation(outActors, target.GetActorLocation());
    }

    ATeleportSpotVisual FindFurthestTeleportSpotByActorLocation(TArray<ATeleportSpotVisual> TeleportSpots, FVector OriginActorLocation)
    {
        float distance = 0.f;
        ATeleportSpotVisual selectedSpot = nullptr;

        for(auto spot : TeleportSpots)
        {
            float currentDistance = spot.GetActorLocation().Distance(OriginActorLocation);
            if(currentDistance > distance)
            {
                distance = currentDistance;
                selectedSpot = spot;
            }
        }

        return selectedSpot;
    }

    AActor GetTargetActor()
    {
        auto instigator = Cast<AAIAgentCharacter>(GetOwner());
        //auto ai = instigator.GetAI();
        return instigator.GetTargetedActor();       
    }

    UFUNCTION()
    void ActivateDirectionVisuals()
    {
        if(m_TeleportSpot == nullptr)
        {
            return;
        }
        FVector origin = GetOwner().GetActorLocation();
        FVector end = m_TeleportSpot.GetActorLocation();
        FRotator rotation = MagicScript::FindLookAtRotation(origin, end);
        auto actorClass = GetSpawnActorClassServer();
        if(actorClass == nullptr)
            return;

        m_TeleportDirectionVisual = Cast<ACreatureTeleportDirectionVisual>(SpawnActor(actorClass, origin + m_HeightOffset, rotation));//Cast<ACreatureTeleportDirectionVisual>(NewObject(this, GetSpawnActorClassServer()));
        if(m_TeleportDirectionVisual == nullptr)
        {
            return;
        }

        m_TeleportDirectionVisual.InitializeVisual(origin, end);
    }

    void DoTeleportToSpotVisual()
    {
        auto TeleportSpot = Cast<ATeleportSpotVisual>(GetTargetTeleportSpot());
        if(TeleportSpot != nullptr)
        {   
            auto currentCharacter =  Cast<AGothicCharacter>(GetOwner());
            if(ShouldRotateCharacter())
            {
                currentCharacter.SetActorRotation(GetTeleportSpotRotation());
            }

            FVector TeleportLocation = GetTeleportSpotLocation();
            auto capsuleComp = currentCharacter.CapsuleComponent.GetScaledCapsuleHalfHeight();
            TeleportLocation.Z += capsuleComp;
            DoTeleportToLocation(currentCharacter, TeleportLocation);
        }
       
        if(System::IsTimerActiveHandle(TaskTimer))
            System::ClearAndInvalidateTimerHandle(TaskTimer);
        TaskTimer = System::SetTimerDelegate(FTimerDynamicDelegate(this, n"OnMovementCompleted"), .15f, false);
    }


    bool ShouldRotateCharacter()
    {
        auto TeleportSpot = Cast<ATeleportSpotVisual>(GetTargetTeleportSpot());
        if(TeleportSpot == nullptr)
            return false;
        return TeleportSpot.ShouldRotateCharacter();
    }

    FVector GetTeleportSpotLocation()
    {
        auto TeleportSpot = Cast<ATeleportSpotVisual>(GetTargetTeleportSpot());
        if(TeleportSpot == nullptr)
            return Cast<AGothicCharacter>(GetOwner()).GetActorLocation();
        return TeleportSpot.GetTeleportLocation();
    }

    FRotator GetTeleportSpotRotation()
    {
        auto TeleportSpot = Cast<ATeleportSpotVisual>(GetTargetTeleportSpot());
        if(TeleportSpot == nullptr)
            return Cast<AGothicCharacter>(GetOwner()).GetActorRotation();
        return TeleportSpot.GetSpotRotation();
    }

    void DoTeleportToWayPointActor(FName WayPointActorName)
    {

        FInteractionSpotHandle Spot(WayPointActorName);
        if(Spot.IsValid())
        {
            auto currentCharacter =  Cast<AGothicCharacter>(GetOwner());
            FVector TeleportLocation = Spot.Transform.Location;
            
            FHitResult hit;
            MagicScript::FindFloorAtLocation(TeleportLocation, hit, currentCharacter, ECollisionChannel::IKTrace, -200, 10);
            TeleportLocation.Z = hit.ImpactPoint.Z + currentCharacter.CapsuleComponent.ScaledCapsuleHalfHeight;

            DoTeleportToLocation(currentCharacter, TeleportLocation);
        }
       
        if(System::IsTimerActiveHandle(TaskTimer))
            System::ClearAndInvalidateTimerHandle(TaskTimer);
        TaskTimer = System::SetTimerDelegate(FTimerDynamicDelegate(this, n"OnMovementCompleted"), .15f, false);
    }

    void DoTeleportToLocation(AGothicCharacter currentCharacter, FVector TeleportLocation)
    {
        //currentCharacter.SetActorEnableCollision(false);    
        FHitResult hitResult;
        currentCharacter.SetActorLocation(TeleportLocation, false, hitResult, true);
        if(currentCharacter.Controller != nullptr)
            currentCharacter.Controller.SetControlRotation(currentCharacter.GetActorRotation());
    }


    UFUNCTION()
    void OnMovementCompleted()
    {
        auto currentCharacter =  Cast<AGothicCharacter>(GetOwner());
        //currentCharacter.SetActorEnableCollision(true);
        
        OnMovementCompletedDelegate.ExecuteIfBound();
    }

}