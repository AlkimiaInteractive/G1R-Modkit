//Spell ability (Create the visual once the cast ends)
class UGA_Spell_StormOfFire_Orc : UGA_Spell_StormOfFire
{
    default m_WeaponData = UStormOfFireDefinition_Orc::StaticClass(); //definition of the properties of the projectile.

	UFUNCTION(BlueprintOverride)
    FRotator GetSpawnRotationServer_Scriptable(AGothicCharacter owner,
                                               TSubclassOf<UObject> actorToSpawnClass) const
    {
        auto spawnPosition = GetSpawnPositionServer_Scriptable(owner, actorToSpawnClass);

        auto character = Cast<AAIAgentCharacter>(GetAvatarActorFromActorInfo());
        auto target = character.TargetedActor;
        if(target == nullptr)
        {
            auto avatarRotation = GetAvatarActorFromActorInfo().GetActorRotation();
            return FRotator(0.f, avatarRotation.Yaw, avatarRotation.Roll);
        }
        FRotator rotation = MagicScript::FindLookAtRotation(spawnPosition, target.GetActorLocation());
        return FRotator(0.f, rotation.Yaw, rotation.Roll);

    }

    UFUNCTION(BlueprintOverride)
    FVector GetSpawnPositionServer_Scriptable(AGothicCharacter owner,
                                              TSubclassOf<UObject> actorToSpawnClass) const
    {
        auto carryComp = Cast<AGothicCharacter>(GetAvatarActorFromActorInfo()).GetCarryComponent();
        if(carryComp == nullptr)
            return Super::GetSpawnPositionServer_Scriptable(owner, actorToSpawnClass);

        auto itemInHand = carryComp.GetItemVisual();
        if(itemInHand == nullptr)
            return Super::GetSpawnPositionServer_Scriptable(owner, actorToSpawnClass);

        auto meshComp = Cast<UStaticMeshComponent>(itemInHand.GetComponentByClass(UStaticMeshComponent::StaticClass()));
        if(meshComp == nullptr)
            return Super::GetSpawnPositionServer_Scriptable(owner, actorToSpawnClass);

        auto socketLocation = meshComp.GetSocketLocation(FName("Bottom"));
        
        FHitResult hit;
        FVector floorLocation;
        MagicScript::FindFloorAtLocation(socketLocation, hit, GetAvatarActorFromActorInfo(), ECollisionChannel::IKTrace, -450, 150);
        floorLocation = hit.ImpactPoint;
        floorLocation.Z += 20.f;
        
        return floorLocation;
    }   

}