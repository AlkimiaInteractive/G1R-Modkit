class UGA_Spell_BreakFloor_FireGolem : UGameplayAbilitySpellBasic
{
    UPROPERTY(EditAnywhere, BlueprintReadWrite)
	float m_MinFloorHeight = -200.f;
	UPROPERTY(EditAnywhere, BlueprintReadWrite)
	float m_MaxFloorHeight = 50.f;

    UPROPERTY(EditAnywhere, BlueprintReadWrite)
	TSoftClassPtr<AActor> m_SpawnActorPath = n"Blueprint'/Game/Items/Magic/Golem/Fire/BreakFloor/BP_BreakFloorBoxActor_FireGolem.BP_BreakFloorBoxActor_FireGolem_C'";
	//TSoftClassPtr<AActor> m_SpawnActorPath = n"Blueprint'/Game/Items/Magic/Golem/Fire/BreakFloor/BP_BreakFloorActor_FireGolem.BP_BreakFloorActor_FireGolem_C'";

    UFUNCTION(BlueprintOverride)
    TSubclassOf<UObject> GetSpawnActorClassServer_Scriptable() const
    {
        return m_SpawnActorPath.Get();
    }

    UFUNCTION(BlueprintOverride)
    void OnActivateSpellServer_Scriptable()
    {
        if(!m_SpawnActorPath.IsValid())
            MagicScript::GetPreloaded(m_SpawnActorPath);
    }

    UFUNCTION(BlueprintOverride)
    FVector GetSpawnPositionServer_Scriptable(AGothicCharacter owner, TSubclassOf<UObject> actorToSpawnClass) const
    {
        FVector floorLocation;
        FVector normal;
        FName socket = n"middle_01_l";

        if (owner.Mesh.DoesSocketExist(socket))
        {
            // return owner.Mesh.GetSocketLocation(socket); // This makes very varied location results
            FVector LocationWithForwardOffset = owner.GetActorLocation() + (owner.GetActorForwardVector()*FVector(50.0f,290.0f,0.0f));
            FVector LocationWithRightOffset = LocationWithForwardOffset + (owner.GetActorRightVector()*FVector(-40.0f,-40.0f,0.0f));
            FVector LocationFinal = LocationWithRightOffset - FVector(0.0f,0.0f,160.0f);
            // DebugScript::DrawSphere(LocationFinal, 10.0f, FColor::Red, 10.0f);
            return LocationFinal;
        }
        
        FHitResult hit;
        MagicScript::FindFloorAtLocation(owner.GetActorLocation(), hit, nullptr, ECollisionChannel::IKTrace, m_MinFloorHeight, m_MaxFloorHeight);
        //System::DrawDebugSphere(floorLocation, 100.f, 32, FLinearColor::MakeRandomColor(), 20.f, 10.f);

        return hit.ImpactPoint;//owner.GetActorLocation();
    }

    UFUNCTION(BlueprintOverride)
    FRotator GetSpawnRotationServer_Scriptable(AGothicCharacter owner,
                                               TSubclassOf<UObject> actorToSpawnClass) const
    {
        auto spawnPosition = GetSpawnPositionServer_Scriptable(owner, actorToSpawnClass);

        auto character = Cast<AAIAgentCharacter>(GetAvatarActorFromActorInfo());
        auto target = character.TargetedActor;

        FName socket = n"middle_01_l";

        if (owner.Mesh.DoesSocketExist(socket)) //Check to keep consistency with the location behavior
        {
            return owner.GetActorRotation();
        }

        if(target == nullptr)
        {
            auto avatarRotation = GetAvatarActorFromActorInfo().GetActorRotation();
            return FRotator(0.f, avatarRotation.Yaw, avatarRotation.Roll);
        }
        FRotator rotation = MagicScript::FindLookAtRotation(spawnPosition, target.GetActorLocation());
        return FRotator(0.f, rotation.Yaw, rotation.Roll);
    }

    UFUNCTION(BlueprintOverride)
    void OnActorSpawnedServer_Scriptable(AActor actorSpawned)
    {
        //Cast<ABreakFloorSpellVisual>(actorSpawned).m_CollisionComp.IgnoreActorWhenMoving(GetAvatarActorFromActorInfo(), true);
        Cast<ABreakFloorSpellVisualBox>(actorSpawned).m_CollisionComp.IgnoreActorWhenMoving(GetAvatarActorFromActorInfo(), true);
    }
};
