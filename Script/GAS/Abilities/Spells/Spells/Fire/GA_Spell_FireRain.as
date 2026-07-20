class UGA_Spell_FireRain : UGameplayAbilitySpellBasic
{
    UPROPERTY(EditAnywhere, BlueprintReadWrite)
	float m_MinFloorHeight = -200.f;
	UPROPERTY(EditAnywhere, BlueprintReadWrite)
	float m_MaxFloorHeight = 50.f;

    UPROPERTY(EditAnywhere, BlueprintReadWrite)
	TSoftClassPtr<AActor> m_SpawnActorPath = n"Blueprint'/Game/Items/Magic/FireRain/BP_FireRain.BP_FireRain_C'";

    UFUNCTION(BlueprintOverride)
    TSubclassOf<UObject> GetSpawnActorClassServer_Scriptable() const
    {
        return m_SpawnActorPath.Get();
    }

    UFUNCTION(BlueprintOverride)
    FVector GetSpawnPositionServer_Scriptable(AGothicCharacter owner, TSubclassOf<UObject> actorToSpawnClass) const
    {
        //FVector floorLocation;
        //FVector normal;
        //MagicScript::FindFloorAtLocation(owner.GetActorLocation(), floorLocation, normal, ECollisionChannel::IKTrace, m_MinFloorHeight, m_MaxFloorHeight);
        //System::DrawDebugSphere(floorLocation, 100.f, 32, FLinearColor::MakeRandomColor(), 20.f, 10.f);
        //System::DrawDebugSphere(GetAvatarActorFromActorInfo().GetActorLocation(), 50.f, 12, FLinearColor::Red, 25, 5.f);
        return GetAvatarActorFromActorInfo().GetActorLocation();
    }

    UFUNCTION(BlueprintOverride)
    void OnActorSpawnedServer_Scriptable(AActor ActorSpawned)
    {
        AFireRain fireRain = Cast<AFireRain>(ActorSpawned);
        //System::DrawDebugSphere(fireRain.GetActorLocation(), 50.f, 12, FLinearColor::Green, 25, 5.f);
        fireRain.m_HitCollisionComp.SetState(EHitColliderState::Damage);
        NotifySpellCategory();
    }

};