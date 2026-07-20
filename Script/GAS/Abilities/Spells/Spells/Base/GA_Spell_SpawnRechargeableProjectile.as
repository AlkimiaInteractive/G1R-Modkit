

class UGA_Spell_SpawnRechargeableProjectile : UGameplayAbilitySpellRechargeable
{
    UPROPERTY()
    ASpellBallVisual_AS m_Projectile;

    UPROPERTY()
    USpellProjectileDefinition m_ProjectileDefinition;

    URechargeableSpellConfigLevelData GetLevelSpellConfigData() const
    {
         auto LevelSpellConfigDataClass = GetLevelSpawnActorClassServer();
        if(LevelSpellConfigDataClass != nullptr)
            return Cast<URechargeableSpellConfigLevelData>(LevelSpellConfigDataClass.Get().GetDefaultObject());
        
        return nullptr;
    }

    UFUNCTION(BlueprintOverride)
    TSubclassOf<UObject> GetSpawnActorClassServer_Scriptable() const
    {
        auto configLevelData = GetLevelSpellConfigData();
        if(configLevelData == nullptr)
            return nullptr;

        return configLevelData.m_SpawnActorPath.Get();
    }

    UFUNCTION(BlueprintOverride)
    FVector GetSpawnPositionServer_Scriptable(AGothicCharacter owner, TSubclassOf<UObject> actorToSpawnClass) const
    {
        const auto spellConfig = GetSpellConfigurationContainer().GetSpellConfig();
        return MagicScript::GetCharacterBoneTransformGivenABoneName(owner, spellConfig.GetSpawnLocationSocketName()).GetLocation();
    }

    UFUNCTION(BlueprintOverride)
    void OnUpdateSpellServer_Scriptable(float DeltaTime)
    {
        if(m_ProjectileDefinition == nullptr || m_Projectile == nullptr)
        {
            return;
        }

        FVector target_pos;
        if(m_Targets.Num() > 0)
        {
            target_pos = m_Targets[0].GetActorLocation();
        }
        else
        {           
            AActor avatar = GetActorInfo().GetAvatarActor();
            FHitResult outHitResult;

           MagicScript::CalculateShootingProjectileTargetLocationFromCamera(
                Cast<AGothicCharacter>(avatar),
                avatar.GetActorLocation(),           
                m_ProjectileDefinition.m_DefaultTargetDistance,
                m_ProjectileDefinition.m_Radius,
                FName("SpellProjectileProfile"),
                FName("SpellProjectileProfile"),
                NAME_None,
                target_pos,
                outHitResult,
                false, 
                0.0f);
        }
        //System::DrawDebugSphere(target_pos, 30, 12, FLinearColor::Green, 3, 3);
        
        MoveProjectilesTo(target_pos);
    }
    
    UFUNCTION(BlueprintOverride)
    void OnActorSpawnedServer_Scriptable(AActor actorSpawned)
    {
        m_Projectile = Cast<ASpellBallVisual_AS>(actorSpawned);
        m_Projectile.SetSpellLevel(GetCurrentSpellLevel());
        NotifySpellCategory();
    }

    UFUNCTION()
    void MoveProjectilesTo(FVector TargetPos)
    {
        auto weaponDefinition = m_Projectile.GetWeaponDefinition();
        if(weaponDefinition != nullptr)
        {
            const USpellProjectileDefinition projectileDefinition = Cast<USpellProjectileDefinition>(weaponDefinition.Get().GetDefaultObject());

            auto directionToTarget = TargetPos - m_Projectile.GetActorLocation();
            directionToTarget.Normalize();

            auto velocity = m_Projectile.GetVelocity();
            velocity.Normalize();

            auto steering = directionToTarget - velocity;

            steering = steering * Math::Clamp(projectileDefinition.m_SteeringFactor, 0.0f, 1.0f);
    
            auto newVelocity = velocity + steering;
            newVelocity.Normalize();
            
            m_Projectile.SetVelocity(newVelocity * projectileDefinition.m_Speed);
        }
    }
}