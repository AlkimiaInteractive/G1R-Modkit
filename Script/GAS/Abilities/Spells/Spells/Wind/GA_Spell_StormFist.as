class UGA_Spell_StormFist : UGA_Spell_Wind
{
    UPROPERTY()
    AStormFist m_projectile;
    
    UPROPERTY()
    TSoftClassPtr<AActor> m_SpawnActorPath = n"Blueprint'/Game/Items/Magic/StormFist/BP_StormFistActor.BP_StormFistActor_C'";
   
    UFUNCTION(BlueprintOverride)
    TSubclassOf<UObject> GetSpawnActorClassServer_Scriptable() const
    {
        return m_SpawnActorPath.Get();
    }

    UFUNCTION(BlueprintOverride)
    void OnActorSpawnedServer_Scriptable(AActor ActorSpawned)
    {
        const UWindSpellConfig conf = Cast<UWindSpellConfig>(GetSpellConfigurationContainer().GetSpellConfig());
        m_projectile = Cast<AStormFist>(ActorSpawned);

        m_projectile.m_CollisionComp.SetState(EHitColliderState::Damage);
        
        //m_projectile.m_TargetRadius = GetSpellAreaRange();
        m_projectile.m_CollisionComp.SphereRadius = 0.f;
        NotifySpellCategory();
    }

    UFUNCTION(BlueprintOverride)
    FVector GetSpawnPositionServer_Scriptable(AGothicCharacter owner,
                                              TSubclassOf<UObject> actorToSpawnClass) const
    {
        FHitResult hit;
        FVector floorLocation;
        MagicScript::FindFloorAtLocation(owner.GetActorLocation(), hit, nullptr, ECollisionChannel::IKTrace, -200, 10);
        //@DE - A bit increase in height to avoid floor collision. This is for target validation on overlap event. If the actor is on the floor, the raycast always fail
        floorLocation = hit.ImpactPoint;
        floorLocation.Z = floorLocation.Z + 30.f;
        return floorLocation;
    }

}