// class UGA_Spell_SpawnProjectile : UGameplayAbilitySpellCommonProjectile
// {

// }







// class UGA_Spell_SpawnProjectile : UGA_Spell_BasicWithUpdate
// {
//     UPROPERTY(BlueprintReadWrite, EditAnywhere)
// 	TArray<AProjectileVisual> m_Projectiles;

//     UFUNCTION(BlueprintOverride)
//     FVector GetSpawnPosition(ACharacter OwnerCharacter, AActor SummonActorClass, int Idx, int TotalAmount) const
//     {
//         AProjectileVisual def_actor = Cast<AProjectileVisual>(SummonActorClass);
//         auto def = def_actor.GetWeaponDefinition();
//         if(def !=nullptr)
//         {
//             USpellProjectileDefinition ball_def = Cast<USpellProjectileDefinition>(def.Get().GetDefaultObject());
        
//             UDataModule_Animation datamodule_Animation = DataModule::GetAnimationDataModule(GetActorInfo().GetAvatarActor());
//             if(datamodule_Animation != nullptr)
//             {
//                 const UItemAnimConfig anim_config = datamodule_Animation.GetItemAnimConfig(ball_def.GetItemType());
//                 if (anim_config != nullptr)
//                 {
//                     FTransform bone_trans = OwnerCharacter.Mesh.GetSocketTransform(FName(anim_config.m_SocketName), ERelativeTransformSpace::RTS_World);
//                     return bone_trans.GetLocation();
//                 }
//             }
//         }
//         return GetActorInfo().GetAvatarActor().GetActorLocation();
//     }

//     void RemoveProjectile(AActor projectile)
//     {
//         AProjectileVisual visualProjectile = Cast<AProjectileVisual>(projectile);
//         m_Projectiles.Remove(visualProjectile);
//     }

//     void CheckIfLastProjectileThenEndAbility()
//     {
//         if(m_Projectiles.Num() == 0)
//         {
//            EndAbilitySpell();
//         } 
//     }

//     void RemoveProjectileAndCheckEndAbility(AActor projectile)
//     {
//         RemoveProjectile(projectile);
//         CheckIfLastProjectileThenEndAbility();
//     }

//     UFUNCTION()
// 	void OnProjectileDestroyed(AActor DestroyedActor)
//     {
//         RemoveProjectileAndCheckEndAbility(DestroyedActor);
//     }

//     bool TryToShoot(ASpellBallVisual_AS projectile, const FVector spawnLocation)
//     {
//         projectile.SetSpellLevel( GetCurrentSpellLevel());
        
//         auto def = projectile.GetWeaponDefinition();

//         if(def == nullptr)
//         {
//             return false;
//         }
        
//         const USpellProjectileDefinition projectileDefinition = Cast<USpellProjectileDefinition>(def.Get().GetDefaultObject());
//         m_DefaultTargetDistance = projectileDefinition.m_DefaultTargetDistance;
        
//         FVector target_pos = spawnLocation + m_MoveComp.Get().GetControllerRotation().ForwardVector * 10;
//         projectile.Initialize(target_pos, projectileDefinition.m_Speed, projectileDefinition.m_Gravity);

//         projectile.OnDestroyed.AddUFunction(this, n"OnProjectileDestroyed");
//         //projectile.m_EndDetectionPlane = projectile.m_SpawnPoint + projectile.GetCurrentDirection() * projectile.GetMaxDistance();
//         //projectile.m_SpawnDirection = projectile.GetCurrentDirection();
//         projectile.m_Debug_PreviousPosition = projectile.GetActorLocation();
//         return true;
//     }

// }

/*
class UGA_Spell_SpawnProjectile : UGA_Spell_BasicWithUpdate
{
    UPROPERTY(BlueprintReadWrite, EditAnywhere)
	TArray<AProjectileVisual> m_Projectiles;

	UPROPERTY(BlueprintReadWrite, EditAnywhere)
	float m_ChannelingCostSg = 1.0f;

    UPROPERTY(BlueprintReadWrite, EditAnywhere)
	TSubclassOf<UGameplayEffect> m_GE_Channeling = UGE_Mana_Channeling::StaticClass();

    UPROPERTY()
    bool m_IsChannelling = false;

    UPROPERTY(BlueprintReadWrite, EditAnywhere)
    FScriptAsset m_EndRedirectMontage = FScriptAsset::OfClass(UAnimMontage::StaticClass());
    //default m_EndRedirectMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Fire/Fireball/AM_Man_FireballRedirect_Out.AM_Man_FireballRedirect_Out'";
    default m_EndRedirectMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Fire/Fireball/AM_Man_FireballLaunch.AM_Man_FireballLaunch'";
    
    UFUNCTION(BlueprintOverride)
    void OnNewTarget_Scriptable(AActor Target)
    {
        Super::OnNewTarget_Scriptable(Target);

        // To force update the direction
        FVector target_pos = Target.GetActorLocation();
        for(AProjectileVisual projectile : m_Projectiles)
        {
            FVector dir_to_target = target_pos - projectile.GetActorLocation();
            dir_to_target.Normalize();

            FVector dir_current = projectile.GetActorForwardVector();

            auto def = projectile.GetWeaponDefinition();
            if(def != nullptr)
            {
                const USpellProjectileDefinition ball_def = Cast<USpellProjectileDefinition>(def.GetDefaultObject());
                
                FVector vel = dir_to_target * ball_def.m_Speed;
                projectile.SetVelocity(vel);
            }
        }
    }

    UFUNCTION(BlueprintOverride)
    void OnUpdateSpell_Scriptable(float DeltaTime)
    {
        if(!m_IsChannelling)
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
            target_pos = avatar.GetActorLocation() + m_MoveComp.Get().GetControllerRotation().ForwardVector * m_DefaultTargetDistance;
        }
        
        //System::DrawDebugSphere(target_pos, 10.f, 10.f, FColor::Green, 100.f, 5.f);
        //Log("Projectile target pos: "+target_pos.ToString());
        MoveProjectilesTo(target_pos);
    }

    UFUNCTION(BlueprintOverride)
    void OnActorSpawnedServer_Scriptable(AActor ActorSpawned, int RequestId)
    {
        Super::OnActorSpawnedServer_Scriptable(ActorSpawned, RequestId);

        Log("Spell level: " + m_SpellLevel);
        
        APawn pawn = Cast<APawn>(GetActorInfo().GetAvatarActor());

        ActorSpawned.SetOwner(pawn);
        ActorSpawned.SetInstigator(pawn);
        
        ASpellBallVisual_AS projectile = Cast<ASpellBallVisual_AS>(ActorSpawned);
        projectile.SetSpellLevel(m_SpellLevel);

        auto def = projectile.GetWeaponDefinition();
        if(def == nullptr)
        {
            //EndAbilitySpell();
            EndAbility();
            return;
        }

        m_Projectiles.Add(projectile);
        const USpellProjectileDefinition ball_def = Cast<USpellProjectileDefinition>(def.GetDefaultObject());
        m_DefaultTargetDistance = ball_def.m_DefaultTargetDistance;
        
        const FVector origin = ActorSpawned.GetActorLocation();
        FVector target_pos = origin + m_MoveComp.Get().GetControllerRotation().ForwardVector * 10;
        projectile.Shoot(target_pos, ball_def.m_Speed, ball_def.m_Gravity);

        projectile.OnDestroyed.AddUFunction(this, n"OnProjectileDestroyed");

        //m_CanFinishSpell = false;

        if( GetSpellContext().IsSpellManaUsageRechargeable())
        {
            if(IsInputPressed())
            {
                FGameplayEventData payload;
                payload.Instigator = GetAvatarActorFromActorInfo();
                payload.OptionalObject2 = this;
                SendGameplayEvent(GameplayTag::Action_CastSpell, payload);
            } 
            //EndAbilitySpell();
            EndAbility();
        }
        else
        {
            if(m_SpellLevel < GetSpellContext().GetSpellLevels()-1)
            {
                //EndAbilitySpell();
                EndAbility();
            }
            else
            {
                m_IsChannelling = true;
                ApplyManaEffect(-m_ChannelingCostSg, -1, m_GE_Channeling);
            }
        }
    }

    UFUNCTION()
    void MoveProjectilesTo(FVector TargetPos)
    {
        for(AProjectileVisual projectile : m_Projectiles)
        {
            auto weaponDefinition = projectile.GetWeaponDefinition();
            if(weaponDefinition != nullptr)
            {
                const USpellProjectileDefinition projectileDefinition = Cast<USpellProjectileDefinition>(weaponDefinition.GetDefaultObject());

                auto directionToTarget = TargetPos - projectile.GetActorLocation();
                directionToTarget.Normalize();

                auto velocity = projectile.GetVelocity();
                velocity.Normalize();

                auto steering = directionToTarget - velocity;

                steering = steering * Math::Clamp(projectileDefinition.m_SteeringFactor, 0.0f, 1.0f);
        
                auto newVelocity = velocity + steering;
                newVelocity.Normalize();
                
                projectile.SetVelocity(newVelocity * projectileDefinition.m_Speed);
            }
        }
    }

    UFUNCTION(BlueprintOverride)
    FVector GetSpawnPosition(ACharacter OwnerCharacter, AActor SummonActorClass, int Idx, int TotalAmount) const
    {
        AProjectileVisual def_actor = Cast<AProjectileVisual>(SummonActorClass);
        auto def = def_actor.GetWeaponDefinition();
        if(def !=nullptr)
        {
            USpellProjectileDefinition ball_def = Cast<USpellProjectileDefinition>(def.GetDefaultObject());
        
            UDataModule_Animation datamodule_Animation = DataModule::GetAnimationDataModule(GetActorInfo().GetAvatarActor());
            if(datamodule_Animation != nullptr)
            {
                const UItemAnimConfig anim_config = datamodule_Animation.GetItemAnimConfig(ball_def.GetItemType());
                if (anim_config != nullptr)
                {
                    FTransform bone_trans = OwnerCharacter.Mesh.GetSocketTransform(FName(anim_config.m_SocketName), ERelativeTransformSpace::RTS_World);
                    return bone_trans.GetLocation();
                }
            }
        }
        return GetActorInfo().GetAvatarActor().GetActorLocation();
    }

    UFUNCTION()
	void OnProjectileDestroyed(AActor DestroyedActor)
    {
        AProjectileVisual projectile = Cast<AProjectileVisual>(DestroyedActor);
        m_Projectiles.Remove(projectile);

        if(m_Projectiles.Num() == 0)
        {
            FinishRedirect();
        }
    }

    UFUNCTION()
    void FinishRedirect()
    {
        if(m_IsChannelling)
        {
            m_IsChannelling = false;

            UAnimMontage montage = Cast<UAnimMontage>(m_EndRedirectMontage.GetAsset());
            if(montage != nullptr)
            {
                UAbilityTask_PlayMontage_Extended task = Task::PlayMontageAndKeepPlayingAfterAbilityEnds(this, montage);
                task.ReadyForActivation();
            }
        }
        
        //EndAbilitySpell();
        EndAbility();
    }

    UFUNCTION(BlueprintOverride)
    void OnOutMana_Scriptable(FGameplayTag InTag, int32 NewCount)
    {
        FinishRedirect();
    }
}*/


