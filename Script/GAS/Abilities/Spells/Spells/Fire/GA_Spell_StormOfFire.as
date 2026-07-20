
class UGA_Spell_StormOfFire : UGameplayAbilityStormOfFire
{
    UPROPERTY(EditAnywhere, BlueprintReadWrite)
	TSoftClassPtr<AActor> m_SpawnActorPath = n"Blueprint'/Game/Items/Magic/BP_StormOfFire.BP_StormOfFire_C'";

    UPROPERTY()
    TSubclassOf<UWeaponDefinition> m_WeaponData = UStormOfFireDefinition::StaticClass();

    default m_SpawnCollisionHandlingOverride = ESpawnActorCollisionHandlingMethod::AlwaysSpawn;

    UFUNCTION(BlueprintOverride)
    TSubclassOf<UObject> GetSpawnActorClassServer_Scriptable() const
    {
        return m_SpawnActorPath.Get();
    }

    UFUNCTION(BlueprintOverride)
    FRotator GetSpawnRotationServer_Scriptable(AGothicCharacter owner,
                                               TSubclassOf<UObject> actorToSpawnClass) const
    {
        const FRotator controllerRot = m_MoveComp.Get().GetControllerRotation();
        return FRotator(0.f, controllerRot.Yaw, controllerRot.Roll);
    }

    UFUNCTION(BlueprintOverride)
    FVector GetSpawnPositionServer_Scriptable(AGothicCharacter owner, TSubclassOf<UObject> actorToSpawnClass) const
    {
        UStormOfFireDefinition def = Cast<UStormOfFireDefinition>(GetWeaponDefinition());

        float capsuleRadius = def.m_MovementCapsuleRadius;
        float capsuleHalfHeight = def.m_MovementCapsuleHeight * 0.5f;
        
        FVector pos = owner.GetActorLocation() + m_MoveComp.Get().GetControllerRotation().ForwardVector * (def.SpawnOffset+ capsuleRadius);

        //System::DrawDebugSphere(pos, 10.f, 10, FLinearColor::Blue, 10.f, 1.f);

        FHitResult hit;
        FVector floorLocation;
        MagicScript::FindFloorAtLocation(pos, hit, nullptr,ECollisionChannel::IKTrace, -200, 50);
        floorLocation = hit.ImpactPoint;
        //System::DrawDebugSphere(floorLocation, 10.f, 10, FLinearColor::Green, 10.f, 1.f);
        floorLocation.Z += capsuleRadius * 0.5 + def.m_FloorOffset;
        //System::DrawDebugSphere(floorLocation, 10.f, 10, FLinearColor::Red, 10.f, 1.f);
        return floorLocation;
    }

    UFUNCTION()
    UStormOfFireDefinition GetWeaponDefinition() const
    {
        if(m_WeaponData != nullptr)
        {
            return Cast<UStormOfFireDefinition>(m_WeaponData.Get().GetDefaultObject());
        }

        return nullptr;
    }

    UFUNCTION(BlueprintOverride)
    void OnActorSpawnedServer_Scriptable(AActor ActorSpawned)
    {
        if(!ActorInfo.IsNetAuthority())
            return;
        m_SpellProjectile = Cast<AStormOfFire>(ActorSpawned);
        m_SpellProjectile.Initialize_Scriptable(m_WeaponData);
        NotifySpellCategory();
    }

    UFUNCTION(BlueprintOverride)
    void OnFireProjectile_Scriptable()
    {
        auto spawnLocation = m_SpellProjectile.GetActorLocation();
        UStormOfFireDefinition def = Cast<UStormOfFireDefinition>(GetWeaponDefinition());
       
        FVector cameraDirection, cameraLocation; 
        MagicScript::GetCameraDirectionAndLocation(Cast<AGothicCharacter>(GetAvatarActorFromActorInfo()), cameraDirection, cameraLocation);
        FVector cameraProjection = cameraLocation + cameraDirection * 10000;

        auto direction = cameraProjection - spawnLocation;
        direction.Z = 0.0f;
        direction.Normalize();

        m_SpellProjectile.m_SphereComponent.SetSimulatePhysics(true);
        m_SpellProjectile.m_Velocity = direction * def.m_Speed;
       
        //m_SpellProjectile.m_CapsuleComponent.AddImpulse(direction * def.m_Speed, NAME_None, true);

        //System::DrawDebugLine(spawnLocation, cameraProjection, FLinearColor::Green, 10, 5);
        //System::DrawDebugLine(spawnLocation, spawnLocation + direction * 1000, FLinearColor::Blue, 10, 4);
    }


    UFUNCTION(BlueprintOverride)
    bool OnShouldFinishSpellAfterActivation_Scriptable()
    {
        return false;
    }
};
