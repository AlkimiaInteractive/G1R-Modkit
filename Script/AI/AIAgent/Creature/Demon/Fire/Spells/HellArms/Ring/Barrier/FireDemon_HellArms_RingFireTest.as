class UGA_FireDemon_HellArmsArea_Ring_Fire : UGA_FireDemon_HellArmsArea_Base
{
    default m_Area = AFireDemonHellArmsAreaVisual_Ring_Fire::StaticClass();
     
}

///------------

UCLASS()
class UHellArmsAreaRingSpellConfig_Fire : UDemonAreaBaseSpellConfig
{
	default m_LifeSpan = 15.0f; //15.f;

	UPROPERTY(EditAnywhere)
	float m_RingExtraAreaIncrement = 150.f;

	//Min distance to the border of the circle (from the center of the area) where the detection will work for arm spawn- P.E: 500.f -> 5 meters or less close to the border.
	UPROPERTY(EditAnywhere)
	float m_MinDistanceToBorder = 150.f;

	//Size of the angle where the arms are spawned on the circle border
	UPROPERTY(EditAnywhere)
	float m_BorderAngle = 25.f;

	UPROPERTY(EditAnywhere)
	int m_MaxArmsToSpawn = 7; //35

	default m_AreaRadius = 900.f; //60

	default m_MinAttackTime = 0.2f; //0.2

    default m_MaxAttackTime = 2.0f; //1

	default m_EnableDebugLines = true;

}

///------------

UCLASS()
class AFireDemonHellArmsAreaVisual_Ring_Fire : AFireDemonHellArmsAreaVisual_Base
{
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


    UPROPERTY(EditAnywhere)
    AHellArmsBarrierVisual_Ring_Fire m_ArmsBarrier;

    TSoftClassPtr<AActor> m_BarrierArmActorPath = n"Blueprint'/Game/Items/Magic/FireDemon/HellArms/Ring/BP_FireDemon_HellArm_BarrierArm_Ring.BP_FireDemon_HellArm_BarrierArm_Ring_C'";
    default m_AreaSpellConfig = UHellArmsAreaRingSpellConfig_Fire::StaticClass();
    default m_AreaType = EDemonAreaTypes::Ring;

    void SetUpConfig() override
    {
        AFireDemonHellArmsAreaVisual_Base::SetUpConfig();

        UHellArmsAreaRingSpellConfig_Fire config = Cast<UHellArmsAreaRingSpellConfig_Fire>(m_AreaSpellConfig.Get().GetDefaultObject());
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
        m_ArmsBarrier = Cast<AHellArmsBarrierVisual_Ring_Fire>(SpawnedActor);
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
        CheckSpawnArms();        
    }

    void CheckSpawnArms()
    {
        if(m_ArmsBarrier == nullptr || m_Target == nullptr)
            return;

        FVector targetLocation = FindFloorLocation(m_Target.GetActorLocation(), ECollisionChannel::IKTrace, m_FloorMinHeight, m_FloorMaxHeight);
        FVector centerArea = GetActorLocation();
        
        if(IsCloseToBorder(targetLocation, centerArea))
            m_ArmsBarrier.m_CanAttack = true;
        else
            m_ArmsBarrier.m_CanAttack = false;
    }

    bool IsCloseToBorder(FVector TargetLocation, FVector CenterArea)
    {
        float minInnerDistance = m_AreaRadius - m_MinDistanceToBorder;
        float maxOuterDistance = m_RingExteriorRadius + m_MinDistanceToBorder;

        return (CenterArea.Distance(TargetLocation) >= minInnerDistance) && (CenterArea.Distance(TargetLocation) <= maxOuterDistance);
    }

    void DestroySpawnedActors() override
    {
        Super::DestroySpawnedActors();
        if(m_ArmsBarrier != nullptr)
            m_ArmsBarrier.DestroyActor();
    }
}


///------------


UCLASS()
class AHellArmsBarrierVisual_Ring_Fire : AHellArmsBarrierVisual
{
    UPROPERTY(EditAnywhere)
    float m_AreaRadius;
    UPROPERTY(EditAnywhere)
    float m_RingExteriorRadius;
    
    UPROPERTY(EditAnywhere)
    float m_BorderAngle;

    UPROPERTY(EditAnywhere)
    int m_MaxArmsToSpawn;

    UPROPERTY(EditAnywhere)
    FVector m_RingLocation;

    UPROPERTY(EditAnywhere)
    TArray<AFireDemonHellArmVisual_BarrierArm_Ring> m_SpawnedArms;

    UPROPERTY()
    AFireDemonHellArmsAreaVisual_Ring_Fire m_AssignedArea;

    UPROPERTY(EditAnywhere)
	TSoftClassPtr<AActor> m_BarrierArmActorPath = n"Blueprint'/Game/Items/Magic/FireDemon/HellArms/Ring/BP_FireDemon_HellArm_BarrierArm_Ring.BP_FireDemon_HellArm_BarrierArm_Ring_C'";
    
    UFUNCTION()
    TSubclassOf<AActor> GetActorClassServer_Scriptable(TSoftClassPtr<AActor> Asset) const
    {
        return Asset.Get();
    }

    UFUNCTION(BlueprintOverride)
    void BeginPlay()
    {
        if(!m_BarrierArmActorPath.IsValid())
            MagicScript::GetPreloaded(m_BarrierArmActorPath);
    }


    void Initialize(AFireDemonHellArmsAreaVisual_Base AssignedArea) override
    {
        Super::Initialize(AssignedArea);
        m_AssignedArea = Cast<AFireDemonHellArmsAreaVisual_Ring_Fire>(AssignedArea);

        m_RingLocation = m_AssignedArea.m_RingLocation;
        m_BorderAngle = m_AssignedArea.m_BorderAngle;
        m_AreaRadius = m_AssignedArea.m_AreaRadius;
        m_RingExteriorRadius = m_AssignedArea.m_RingExteriorRadius;
        m_MaxArmsToSpawn = m_AssignedArea.m_MaxArmsToSpawn;

        SpawnArms();
    }

    void SpawnArms()
    {
        for(int i = 0; i < m_MaxArmsToSpawn; i++)
        {
            FVector location = GetRandomLocationOnBorder(nullptr);
            AFireDemonHellArmVisual_BarrierArm_Ring arm = SpawnBarrierArm(location);
            arm.m_Barrier = this;
            arm.SetOwner(GetOwner());

            arm.AttachToActor(this);
        }
    }

    FVector GetArmSpawnPosition(AGothicCharacter CurrentTarget) override
    {
        return GetRandomLocationOnBorder(CurrentTarget);
    }

    FVector GetRandomLocationOnBorder(AGothicCharacter CurrentTarget)
    {
        //On initialize the target is null. We add a random direction.
        FVector targetFloorLocation = CurrentTarget != nullptr ? m_AssignedArea.FindFloorLocation(CurrentTarget.GetActorLocation()) : m_AssignedArea.FindFloorLocation(m_RingLocation + m_AssignedArea.GetActorForwardVector() * 10);
        FVector ringFloorLocation = m_AssignedArea.FindFloorLocation(m_RingLocation);
        FVector direction = targetFloorLocation - ringFloorLocation;
        direction.Normalize();
       
        FVector randomDirection = direction.RotateAngleAxis(Math::RandRange(-m_BorderAngle, m_BorderAngle), FVector(0,0,1));
        FVector randomSpawnPoint = ringFloorLocation + randomDirection * Math::RandRange(m_AreaRadius, m_RingExteriorRadius);

        return randomSpawnPoint;
    }

    void DoAttackCustom() override
    {
        for(auto arm : m_SpawnedArms)
            DoArmAttack(arm, m_Target);
    }

    void DoArmAttack(AFireDemonHellArmVisual_BarrierArm Arm, AGothicCharacter CurrentTarget) override
    {
        Arm.ExecuteDelayedAttack(CurrentTarget, m_AssignedArea.m_MinAttackTime, m_AssignedArea.m_MaxAttackTime);
    }

    UFUNCTION(BlueprintCallable)
    AFireDemonHellArmVisual_BarrierArm_Ring SpawnBarrierArm(FVector Location)
    {
        AFireDemonHellArmVisual_BarrierArm_Ring arm = Cast<AFireDemonHellArmVisual_BarrierArm_Ring>(SpawnActor(GetActorClassServer_Scriptable(m_BarrierArmActorPath), Location));
        if(arm == nullptr)
            return nullptr;

        m_SpawnedArms.Add(arm);
        return arm;
    } 

    void DestroySpawnedActors() override
    {
        Super::DestroySpawnedActors();
        DestroySpawnedArms();
        
    }

    
    void DestroySpawnedArms()
    {
        for(auto arm : m_SpawnedArms)
            arm.FinalizeAttack();
    }
}

