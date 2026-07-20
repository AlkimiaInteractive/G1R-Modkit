class USpellConfigLevelData_BallLightning_Orc_Lvl1 : UBallLightningSpellConfigLevelData
{
    default m_LevelProjectileDefinition = UBallLightningDefinition_Orc_Lvl1::StaticClass();
}

class USpellConfigLevelData_BallLightning_Orc_Lvl2 : UBallLightningSpellConfigLevelData
{
    default m_LevelProjectileDefinition = UBallLightningDefinition_Orc_Lvl2::StaticClass();
}

class USpellConfigLevelData_BallLightning_Orc_Lvl3 : UBallLightningSpellConfigLevelData
{
    default m_LevelProjectileDefinition = UBallLightningDefinition_Orc_Lvl3::StaticClass();
}

class USpellConfigLevelData_BallLightning_Orc_Lvl4 : UBallLightningSpellConfigLevelData
{
    default m_LevelProjectileDefinition = UBallLightningDefinition_Orc_Lvl4::StaticClass();
}

class UGA_Spell_BallLightning_Orc : UGA_Spell_BallLightning
{
    UFUNCTION(BlueprintOverride)
    void OnActorSpawnedServer_Scriptable(AActor ActorSpawned)
    {
        ABallLightningVisual projectileVisual = Cast<ABallLightningVisual>(ActorSpawned);
        projectileVisual.IgnoreActors(projectileVisual.m_CollisionComp, GetAvatarActorFromActorInfo());
        Super::OnActorSpawnedServer_Scriptable(ActorSpawned);      

    }
    
    void SetProjectileDirectionAndVelocity(ABallLightningVisual projectileVisual) override
    {
        auto character = Cast<AAIAgentCharacter>(GetAvatarActorFromActorInfo());
        FVector direction = GetAvatarActorFromActorInfo().GetActorForwardVector();
        auto target = character.TargetedActor;
        if(target != nullptr)
        {
            FVector targetLocation = target.GetActorLocation();
            FVector headSocketLocation = GetHeadSocketLocation(target);
            if(headSocketLocation != FVector::ZeroVector)
            {
                targetLocation = headSocketLocation;
            }
            direction  = targetLocation - GetSpawnPositionServer_Scriptable(Cast<AGothicCharacter>(GetAvatarActorFromActorInfo()), nullptr);
        }   
        direction.Normalize();
        auto config = Cast<UBallLightningSpellConfigLevelData>(GetLevelSpellConfigData());
        projectileVisual.m_MovementComp.InitialSpeed = Cast<UBallLightningDefinition_Base>(config.m_LevelProjectileDefinition.Get().GetDefaultObject()).m_Speed;
        projectileVisual.m_MovementComp.Velocity = direction * projectileVisual.m_MovementComp.InitialSpeed;
    }

    FVector GetHeadSocketLocation(AActor target)
    {
        auto mesh = Cast<AGothicCharacter>(target).Mesh;
        return mesh.GetSocketLocation(n"Head");
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

        return meshComp.GetSocketLocation(FName("Bottom"));

    }

}