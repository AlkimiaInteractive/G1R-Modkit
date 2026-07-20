//@DE - Duplicated version by @SP
class UGA_FireDemon_FireExplosion_Fire : UGA_AttackSpawnActor
{
    AFireDemonFireExplosionVisual m_FireExplosion;
    TSubclassOf<USpellProjectileDefinition> m_FireExplosionProjectileConfigClass = UFireExplosionProjectile::StaticClass();
    UFireExplosionProjectile m_FireExplosionProjectileConfig;

    UPROPERTY()
    TArray<UAbilitySystemComponent> m_Targets;
 
    default m_SuperArmorEffect = UGE_IncreaseSuperArmor::StaticClass();

    UFireExplosionProjectile GetConfig()
    {
        return Cast<UFireExplosionProjectile>(m_FireExplosionProjectileConfigClass.Get().GetDefaultObject());
    }

    UFUNCTION(BlueprintOverride)
    void OnActivateAbility_Scriptable(FGameplayAbilityActorInfo GameplayAbilityActorInfo,
                                      FGameplayEventData TriggerEventData)
    {
        m_FireExplosionProjectileConfig = GetConfig();
    }

    UFUNCTION(BlueprintOverride)
    void OnActorSpawned_Scriptable(AActor SpawnedActor)
    {
        m_FireExplosion = Cast<AFireDemonFireExplosionVisual>(SpawnedActor);
        if(m_FireExplosion != nullptr)
        {
            m_FireExplosion.m_CollisionComp.OnTargetDetected.AddUFunction(this, n"OnTargetReceived");
        }

    }

    UFUNCTION(BlueprintOverride)
    void OnEndAbility(bool bWasCancelled)
    {
       m_Targets.Empty();
    }

    UFUNCTION()
    void OnTargetReceived(AActor OtherActor, const FHitResult SweepResult)
    {
        if(OtherActor == nullptr)
            return;
        if(OtherActor == GetAvatarActorFromActorInfo())
            return;
        OnNewTarget(OtherActor, SweepResult);
    }

    void OnNewTarget(AActor Target, const FHitResult SweepResult)
    {
        AActor Owner = m_FireExplosion.GetOwner();
        if(Owner.GetOwner() == Target)
        {
            return;
        }
        AGothicCharacter targetCharacter = Cast<AGothicCharacter>(Target);
        if(targetCharacter == nullptr)
            return;
        
        UGothicAbilitySystemComponent sourceAbComp =GothicGAS::GetAbilitySystemComponent(Owner);
        UGothicAbilitySystemComponent targetAbComp = GothicGAS::GetAbilitySystemComponent(Target);

        if(sourceAbComp == nullptr || targetAbComp == nullptr || m_FireExplosion.m_CollisionComp.m_WeaponData == nullptr)
        {
            return;
        }
        
        if(m_Targets.Contains(targetAbComp))
            return;

        FGameplayEffectContext_HitResponse hit_data;
        hit_data.Impact = GameplayTag::Combat_HitType_Knockback;
        hit_data.WeaponUsed = m_FireExplosion.m_CollisionComp.m_WeaponData;
        hit_data.SourceDirection = MagicScript::GetCombatDirectionGivenHitLocation(
            Target.GetActorForwardVector(), 
            Target.GetActorRightVector(), -Owner.GetActorForwardVector());

        GothicGAS::ApplyDamageTo(sourceAbComp, sourceAbComp.GetAvatar(), m_FireExplosion, targetAbComp, hit_data, SweepResult);
        m_Targets.Add(targetAbComp);
    }
}