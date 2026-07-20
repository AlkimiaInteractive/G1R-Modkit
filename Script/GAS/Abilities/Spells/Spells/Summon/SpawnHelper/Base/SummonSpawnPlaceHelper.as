class USummonSpawnPlaceHelper : UObject
{

    UPROPERTY(EditAnywhere, BlueprintReadWrite)
    TArray<AActor> m_ActorsToIgnore;

    UPROPERTY(EditAnywhere, BlueprintReadWrite)
    USpawnAIAgentDefinition m_CurrentSpawnAIAgentDefinition;

    UPROPERTY(EditAnywhere, BlueprintReadWrite)
    AActor m_AvatarActor;

    UPROPERTY()
    bool m_IgnoreNavMesh = false;


    UFUNCTION(BlueprintPure)
    bool TryToGetValidSpawnPlace(AActor TargetActor, FVector& DesiredPos, AActor DefaultCharacter)
    {
        return false;
    }

	bool FindArroundComputedPosition(AActor TargetActor, FVector& DesiredPos, AActor DefaultCharacter)
	{
        return false;
	}

	TArray<AActor> GetActorsToIgnore()
	{
        return m_ActorsToIgnore;
	}

    UFUNCTION(BlueprintPure)
	bool CheckLocation(const FVector StartPosition, const FVector DesiredPosition, AActor ActorToCheck, TArray<AActor> ActorsToIgnore)
    {
        return IsPositionReachable(StartPosition, DesiredPosition);
    }


    bool DoShapeTrace(AActor ActorToCheck, const FVector DesiredPosition, TArray<AActor> ActorsToIgnore, FHitResult& out_hit)
    {
        //FHitResult out_hit;
        if(ActorToCheck == nullptr)
            return false;

        AGothicCharacter currentCharacter = Cast<AGothicCharacter>(ActorToCheck);
        if(currentCharacter != nullptr)
            return DoCapsuleShapeTrace(currentCharacter, DesiredPosition, ActorsToIgnore, out_hit);
        
        UShapeComponent shape = Cast<UShapeComponent>(ActorToCheck.GetComponentByClass(UShapeComponent::StaticClass()));
        if(shape == nullptr)
            return false;
        
        UHitSphereCollisionComponent hitSphere = Cast<UHitSphereCollisionComponent>(shape);
        if(hitSphere != nullptr)
            return DoSphereShapeTrace(hitSphere, DesiredPosition, ActorsToIgnore, out_hit);
        
        return false;
    }


    bool DoSphereShapeTrace(UHitSphereCollisionComponent hitSphere, FVector DesiredPosition, TArray<AActor> ActorsToIgnore, FHitResult& out_hit)
    {

        const FVector pivot = DesiredPosition + FVector::UpVector * (hitSphere.GetUnscaledSphereRadius() + 0.1f);
        ETraceTypeQuery trace_type = UCollisionProfile::ConvertToTraceType(hitSphere.GetCollisionObjectType());
        bool hits = false;
        hits = System::SphereTraceSingle(
            pivot,
            pivot,
            hitSphere.GetUnscaledSphereRadius(),
            trace_type,
            true,
            ActorsToIgnore,
            EDrawDebugTrace::None,
            out_hit,
            true,
            FLinearColor::Yellow,
            FLinearColor::Red,
            5.0f
        );
        return hits;
    }

    bool DoCapsuleShapeTrace(AGothicCharacter CurrentCharacter, FVector DesiredPosition, TArray<AActor> ActorsToIgnore, FHitResult& out_hit)
    {
        UCapsuleComponent capsule_component = Cast<AGothicCharacter>(CurrentCharacter).CapsuleComponent;
        const FVector pivot = DesiredPosition + FVector::UpVector * (capsule_component.GetScaledCapsuleHalfHeight() + 0.1f);
        ETraceTypeQuery trace_type = UCollisionProfile::ConvertToTraceType(capsule_component.GetCollisionObjectType());
        bool hits = false;
        hits = System::CapsuleTraceSingle(
            pivot,
            pivot,
            capsule_component.GetScaledCapsuleRadius(),
            capsule_component.GetScaledCapsuleHalfHeight(),
            trace_type,
            true,
            ActorsToIgnore,
            EDrawDebugTrace::None,
            out_hit,
            true,
            FLinearColor::Yellow,
            FLinearColor::Red,
            5.5f);

        return hits;
    }

    UFUNCTION(BlueprintPure)
    bool IsPositionReachable(FVector PathStart, FVector PathEnd)
    {
        if(m_IgnoreNavMesh)
            return true;
        return UNavigationSystemV1::DoesPathExistForUnspawnedCharacter(m_AvatarActor, m_CurrentSpawnAIAgentDefinition, PathStart, PathEnd);
    }


    UFUNCTION(BlueprintPure)
    FVector ComputeNextLocation(FVector CenterPoint, float Radius, float Angle, FVector ForwardVector)
    {
        const FVector direction = ForwardVector.RotateAngleAxis(Angle, FVector::UpVector);
        FVector desired_pos = CenterPoint + (direction * Radius);
        desired_pos.Z = CenterPoint.Z;
        
        return desired_pos;
    }
    

    UFUNCTION()
    void ModifySearchParams()
    {
        
    }   

    UFUNCTION()
    AAIAgentCharacter GetSummonCharacter(const FAISpawnData& spawnData)
    {
        m_CurrentSpawnAIAgentDefinition = Cast<USpawnAIAgentDefinition>(spawnData.m_SpawnAIAgentDefinition.Get().GetDefaultObject());
        if (m_CurrentSpawnAIAgentDefinition != nullptr)
        {
            UClass asset = Cast<UClass>(m_CurrentSpawnAIAgentDefinition.AIAgentCharacterClass.ToSoftObjectPath().TryLoad());

            if (asset == nullptr)
                return nullptr;

            return Cast<AAIAgentCharacter>(asset.GetDefaultObject());
        }

        return nullptr;
    }
}
