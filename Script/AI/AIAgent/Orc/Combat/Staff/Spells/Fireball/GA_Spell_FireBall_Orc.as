class UOrcFireBallSpellConfigLevelData : URechargeableSpellConfigLevelData
{
    UPROPERTY()
    TSubclassOf<UFireBallDefinition_Base_Orc> m_LevelProjectileDefinition;
	default m_SpawnActorPath = n"Blueprint'/Game/Items/Magic/BP_Fireball_lvl4.BP_Fireball_lvl4_C'";
    // default m_SpawnActorPath = n"Blueprint'/Game/Items/Magic/BP_Fireball_lvl2.BP_Fireball_lvl2_C'";
	//default m_SpawnActorPath = n"Blueprint'/Game/Items/Magic/BP_Fireball_lvl3.BP_Fireball_lvl3_C'";
}

// class UOrcFireBallSpellConfigLevelData : UBallLightningSpellConfigLevelData
// {
//     // UPROPERTY()
//     // TSubclassOf<UBallLightningDefinition_Base> m_LevelProjectileDefinition;
// 	// default m_SpawnActorPath = n"Blueprint'/Game/Items/Magic/BallLightning/BP_BallLightning.BP_BallLightning_C'";
//     default m_SpawnActorPath = n"Blueprint'/Game/Items/Magic/BP_Fireball_lvl1.BP_Fireball_lvl1_C'";
// }

// class USpellConfigLevelData_FireBall_Orc_Lvl1 : UOrcFireBallSpellConfigLevelData
// {
//     default m_LevelProjectileDefinition = UFireBallDefinition_Orc_Lvl1::StaticClass();
// }

// class USpellConfigLevelData_BallLightning_Orc_Lvl2 : UBallLightningSpellConfigLevelData
// {
//     default m_LevelProjectileDefinition = UBallLightningDefinition_Orc_Lvl2::StaticClass();
// }

// class USpellConfigLevelData_BallLightning_Orc_Lvl3 : UBallLightningSpellConfigLevelData
// {
//     default m_LevelProjectileDefinition = UBallLightningDefinition_Orc_Lvl3::StaticClass();
// }

class USpellConfigLevelData_FireBall_Orc_Lvl4 : UOrcFireBallSpellConfigLevelData
{
    default m_LevelProjectileDefinition = UFireBallDefinition_Orc_Lvl4::StaticClass();
    default m_Lvl = 4;
}

class UGA_Spell_FireBall_Orc : UGA_Spell_Fireball//UGA_Spell_BallLightning
{
    default m_GE_Channeling = UGE_NoManaBurn::StaticClass();
    default m_GE_Mana = UGE_NoManaBurn::StaticClass();
    
    UFUNCTION(BlueprintOverride)
    bool OnShouldFinishSpellAfterActivation_Scriptable() 
    {
        return true;
    }

    float GetLevelChannelingCostSg() override
    {
        return 0.f;
    }

    UFUNCTION(BlueprintOverride)
    void OnActorSpawnedServer_Scriptable(AActor ActorSpawned)
    {
        AFireballVisual projectileVisual = Cast<AFireballVisual>(ActorSpawned);
        projectileVisual.IgnoreActors(projectileVisual.m_CollisionComp, GetAvatarActorFromActorInfo());
        Super::OnActorSpawnedServer_Scriptable(ActorSpawned);     
        SetProjectileDirectionAndVelocity(Cast<AFireballVisual>(ActorSpawned)); 

    }

    bool CanDoChanneling() override
    {
        return false;
    }

    FGameplayTag GetSFXTagByLevel() override
    {
        return GameplayTag::FX_Magic_Spell_FireBall_Launch_Level3;
    }

    
    void SetProjectileDirectionAndVelocity(AFireballVisual projectileVisual)
    {
        auto character = Cast<AAIAgentCharacter>(GetAvatarActorFromActorInfo());
        FVector direction = GetAvatarActorFromActorInfo().GetActorForwardVector();
        auto target = character.TargetedActor;
        if(target != nullptr)
        {
            direction  = target.GetActorLocation() - GetSpawnPositionServer_Scriptable(Cast<AGothicCharacter>(GetAvatarActorFromActorInfo()), nullptr);
        }   
        direction.Normalize();
        auto config = Cast<UOrcFireBallSpellConfigLevelData>(GetLevelSpellConfigData());
        projectileVisual.m_MovementComp.InitialSpeed = Cast<UFireBallDefinition_Base_Orc>(config.m_LevelProjectileDefinition.Get().GetDefaultObject()).m_Speed;
        projectileVisual.m_MovementComp.Velocity = direction * projectileVisual.m_MovementComp.InitialSpeed;
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

        // return meshComp.GetSocketLocation(FName("Bottom"));
        return owner.Mesh.GetSocketLocation(FName("weapon_l"));

    }

}