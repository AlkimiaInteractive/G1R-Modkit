UCLASS()
class AFireDemonHellArmsAreaVisual_Base : ADemonAreaVisual//AGothicGASActor//AFireDemonHellArmsAreaVisual
{
      
    UFUNCTION(Server)
    private void SpawnArm(FVector Location, TSubclassOf<AActor> ArmClass)
    {
        FVector floorLocation = FindFloorLocation(m_TargetPredictedPosition, ECollisionChannel::IKTrace, m_FloorMinHeight, m_FloorMaxHeight);
        AActor arm = SpawnActor(ArmClass, FVector(Location.X, Location.Y, floorLocation.Z));
        OnActorSpawned_Server(arm);

    }

    UFUNCTION(BlueprintCallable, Server)
    void SpawnArmAtLocation(FVector Location)
    {
        SpawnArm(Location, GetSpawnActorClassServer_Scriptable());
    }

    UFUNCTION(BlueprintCallable)
    void DoSpawnArm()
    {
        FVector randomPoint = Math::RandomPointInBoundingBox(m_HitBoxDamageActorSpawn.GetWorldLocation(), m_HitBoxDamageActorSpawn.BoxExtent / 2);
        SpawnArmAtLocation(randomPoint);
    }


    void OnActorSpawned_Server(AActor SpawnedActor) override
    {
        Super::OnActorSpawned_Server(SpawnedActor);
        AFireDemonHellArmVisual HellArm = Cast<AFireDemonHellArmVisual>(SpawnedActor);

        if(HellArm == nullptr)
            return;
        HellArm.SetOwner(GetOwner());
        HellArm.ExecuteDelayedAttack(m_Target, 0.f, 0.5f);
    }

    
}