// USTRUCT()
// struct FTargetHellArmData
// {
// 	UPROPERTY()
// 	TArray<AFireDemonHellArmVisual_BarrierArm_Ring> m_AsignedHellArms;
// }

UCLASS()
class AHellArmsBarrierVisual_Ring : AHellArmsBarrierVisual
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
    AFireDemonHellArmsAreaVisual_Ring m_AssignedArea;

    // UPROPERTY()
    // TMap<AGothicCharacter, FTargetHellArmData> m_MultiTargetMap;

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
        m_AssignedArea = Cast<AFireDemonHellArmsAreaVisual_Ring>(AssignedArea);

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

        auto targets = m_AssignedArea.GetDetectedTargets();
         if(targets.IsEmpty())
            return;

        TArray<AFireDemonHellArmVisual_BarrierArm_Ring> freeArms = GetAllFreeArms();
        if(freeArms.IsEmpty())
            return;

        auto freeArmsCount = freeArms.Num();
        auto targetCount = targets.Num();
        auto maxCount = Math::Max(freeArmsCount, targetCount);

        for(int i = 0; i < maxCount; i++)
        {
            auto currentArm = freeArms[i%freeArmsCount];
            auto currentTarget = targets[i%targetCount];
            DoArmAttack(currentArm, currentTarget);
        }

    }

    

    void DoArmAttack(AFireDemonHellArmVisual_BarrierArm Arm, AGothicCharacter CurrentTarget) override
    {
        Arm.ExecuteDelayedAttack(CurrentTarget, m_AssignedArea.m_MinAttackTime, m_AssignedArea.m_MaxAttackTime);
    }

    TArray<AFireDemonHellArmVisual_BarrierArm_Ring> GetAllFreeArms()
    {
        TArray<AFireDemonHellArmVisual_BarrierArm_Ring> freeArms;
        for(auto currentHellArm : m_SpawnedArms)
        {
            if(currentHellArm.m_Target == nullptr)
                freeArms.Add(currentHellArm);
        }
        return freeArms;
    }

    AFireDemonHellArmVisual_BarrierArm_Ring GetFreeArm()
    {
        for(auto currentHellArm : m_SpawnedArms)
        {
            if(currentHellArm.m_Target == nullptr)
                return currentHellArm;
        }
        return nullptr;
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
