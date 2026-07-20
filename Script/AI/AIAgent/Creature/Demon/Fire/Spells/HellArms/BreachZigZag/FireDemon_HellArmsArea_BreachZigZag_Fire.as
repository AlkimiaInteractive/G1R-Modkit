UCLASS()
class AFireDemonHellArmsAreaVisual_BreachZigZag_Fire : AFireDemonHellArmsAreaVisual_Base
{
    default m_SpawnActorPath = n"Blueprint'/Game/Items/Magic/FireDemon/HellArms/BreachZigZag/BP_FireDemon_HellArm_BarrierArm_BreachZigZag.BP_FireDemon_HellArm_BarrierArm_BreachZigZag_C'";

    default m_AreaSpellConfig = UHellArmsAreaBreachZigZagSpellConfig_Fire::StaticClass();
    default m_AreaType = EDemonAreaTypes::BreachZigZag;

    UPROPERTY(EditAnywhere)
    float m_SpawnCubeMovementSpeed;
    UPROPERTY(EditAnywhere)
    float m_MinDistanceToTarget;

    UPROPERTY()
    bool m_Finished = false;

    void SetUpConfig() override
    {
        Super::SetUpConfig();
        UHellArmsAreaBreachZigZagSpellConfig_Fire config = Cast<UHellArmsAreaBreachZigZagSpellConfig_Fire>(m_AreaSpellConfig.Get().GetDefaultObject());
        if(config == nullptr)
            DestroyActor();

        m_SpawnCubeMovementSpeed = config.m_SpawnCubeMovementSpeed;
        m_MinDistanceToTarget = config.m_MinDistanceToTarget;
        
    }

    void InitializeArea(AGothicCharacter target) override
    {
        Super::InitializeArea(target);

        if(m_Target == nullptr)
        {
            DestroyActor();
            return;
        }
            
        FVector targetLocation = GetOwner().GetActorLocation();
        FVector floorLocation = FindFloorLocation(targetLocation, ECollisionChannel::IKTrace, m_FloorMinHeight, m_FloorMaxHeight);

        m_Finished = false;

        SetActorLocation(floorLocation);

        SetSpawnTimer(m_MinAttackTime, m_MaxAttackTime);

        m_HitBoxDamageActorSpawn.SetWorldLocation(GetActorLocation());
        
    }

    //Timer to do arm spawn
    UFUNCTION(BlueprintEvent, BlueprintCallable)
    void SetSpawnTimer(float MinAttackTime, float MaxAttackTime)
    {
    }

    //This should be called by the timer
    void DoSpawnArm() override
    {
        if(IsInArea() && !m_Finished)
        {
            FVector randomPoint = Math::RandomPointInBoundingBox(m_HitBoxDamageActorSpawn.GetWorldLocation(), m_HitBoxDamageActorSpawn.BoxExtent / 2);
            SpawnArmAtLocation(randomPoint);
        }
    }

    void OnActorSpawned_Server(AActor SpawnedActor) override
    {
        AFireDemonHellArmVisual HellArm = Cast<AFireDemonHellArmVisual>(SpawnedActor);

        if(HellArm == nullptr)
            return;
        HellArm.SetOwner(GetOwner());
        HellArm.ExecuteAttack(m_Target);
    }

    void MoveSpawnCube(float DeltaSeconds, UHitBoxCollisionComponent CurrentBox) override
    {
        if(m_Target == nullptr)
            return;

        FVector spawnCubeLocation = m_HitBoxDamageActorSpawn.GetWorldLocation();
        FVector targetLocation = m_Target.GetActorLocation();

        if(targetLocation.Distance(spawnCubeLocation) <= m_MinDistanceToTarget)
            return;

        FVector direction = targetLocation - spawnCubeLocation;

        direction.Normalize();

        FVector newCubePosition = spawnCubeLocation + direction * m_SpawnCubeMovementSpeed * DeltaSeconds;
        
        m_HitBoxDamageActorSpawn.SetWorldLocation(FindFloorLocation(newCubePosition, ECollisionChannel::IKTrace, m_FloorMinHeight, m_FloorMaxHeight));
    }

    UFUNCTION(BlueprintOverride)
    void Tick(float DeltaSeconds)
    {
        Super::Tick(DeltaSeconds);
        if(!IsInArea())
            m_Finished = true;
    }


}
